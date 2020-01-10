#include "kcpsm6.h"

//
// PicoBlaze TOF code.
// note: grep all C/H for OPTIMIZE to find any
// known places where code can be saved

#define sSpare sF

#include "tof_device_addresses.h"
#include "tof_devices.h"
#include "pb_stack.h"

/*
 * Config addresses:
 * 0-7:   VTHTRIGA0,VTHTRIGA1,VSETA1,VSETA0,VSETA2,VSETA3,VTHTIMA,VHYSTA
 * 8-15:  VTHTRIGB0,VTHTRIGB1,VSETB1,VSETB0,VSETB2,VSETB3,VTHTIMB,VHYSTB
 * 16-23: VTHTRIGC0,VTHTRIGC1,VSETC1,VSETC0,VSETC2,VSETC3,VTHTIMC,VHYSTC
 * 24-31: VTHTRIGD0,VTHTRIGD1,VSETD1,VSETD0,VSETD2,VSETD3,VTHTIMD,VHYSTD
 * 32-39: VTHTRIGE0,VTHTRIGE1,VSETE1,VSETE0,VSETE2,VSETE3,VTHTIME,VHYSTE
 * 40-47: VTHTRIGF0,VTHTRIGF1,VSETF1,VSETF0,VSETF2,VSETF3,VTHTIMF,VHYSTF
 * 48-55: VTHTRIGG0,VTHTRIGG1,VSETG1,VSETG0,VSETG2,VSETG3,VTHTIMG,VHYSTG
 * 56-63: VTHTRIGH0,VTHTRIGH1,VSETH1,VSETH0,VSETH2,VSETH3,VTHTIMH,VHYSTH
 * 64: VSLOPE
 * 65: ENABLES ( [14] \FEEPENE, [13] \FEEPENF, [12] \FEEPENG, [11] \FEEPENH,
 *                [7] \FEEPENA, [6]  \FEEPENB, [5]  \FEEPENC,  [4] \FEEPENDx,
 *                [3] \VP75EN )
 *
 * Monitor addresses
 * Note the intermix: this means that the address is just
 * (channel << 1) + bus
 * 0-14:  RMONA2, VCOMPA, RMONA1, RMONA0, IMONA3, IMONA2, IMONA1, IMONA0
 * 16-30:  RMONB2, VCOMPB, RMONB1, RMONB0, IMONB3, IMONB2, IMONB1, IMONB0
 * 32-46: RMONC2, VCOMPC, RMONC1, RMONC0, IMONC3, IMONC2, IMONC1, IMONC0
 * 48-62: RMOND2, VCOMPD, RMOND1, RMOND0, IMOND3, IMOND2, IMOND1, IMOND0
 * 1-15: RMONE2, VCOMPE, RMONE1, RMONE0, IMONE3, IMONE2, IMONE1, IMONE0
 * 17-31: RMONF2, VCOMPF, RMONF1, RMONF0, IMONF3, IMONF2, IMONF1, IMONF0
 * 33-47: RMONG2, VCOMPG, RMONG1, RMONG0, IMONG3, IMONG2, IMONG1, IMONG0
 * 49-63: RMONH2, VCOMPH, RMONG1, RMONG0, IMONG3, IMONG2, IMONG1, IMONG0
 * These are the equivalents of [A-H]2, just with the 64s bit set.
 * 64: RMONA3
 * 65: RMONE3
 * 80: RMONB3
 * 81: RMONF3
 * 96: RMONC3
 * 97: RMONG3
 * 112: RMOND3
 * 113: RMONH3
 * 114: TEMP0
 * 115: TEMP1
 * 116: VIN
 * 117: VOUT
 * 118: IOUT
 */

#define CFG_DATA                     0x20
#define CFG_ADDR                     0x40
#define MON_DATA                     0x60
#define MON_ADDR                     0x80
#define MONITOR_RATE                 0xA0
#define READYINIT                    0xC0
#define MONSTATUS                    0xE0

#define READY                        0x80
#define INIT                         0x40
#define INITSKIP                     0x20
#define INITDONE                     0x10
#define INITFORCE                    0x08
#define UPDATECOMPLETE               0x04
#define UPDATING                     0x02
#define UPDATEREQ                    0x01

#define MONCYCLETOGGLE               0x80
#define MONCYCLE_WAIT_AT_TICK        0x01
#define MONCYCLE_WAITING             0x02

void init() {
  stack_init();
  KSET_I2C_BUS(0);
  gpio_init();
  KSET_I2C_BUS(1);
  gpio_init();
  KSET_I2C_BUS(0);
  gpio1_read_input();
  // check init force
  input(READYINIT, s0);
  if (s0 & INITFORCE) {
    sA = 0xFF;
  }
  s0 = sA;
  if (s0 & 0x3) {
    if (s0 & 0x1) {
      s1 = INIT;
      output( READYINIT, s1 );
      do {
	input(READYINIT, s1);
      } while (!(s1 & INITDONE));
      s1 = 0;
      output(READYINIT, s1);
      s0 ^= 0x1;
      sA = s0;
      gpio1_write_output();
    }
    if (s0 & 0x2) {
      adc_init();
      // adc_init jumps to I2C bus 0
      // so we don't have to set it again
      s1 = READY;
      output(READYINIT, s1);
      s0 ^= 0x2;
      sA = s0;
      gpio1_write_output();
    }
  } else {
    // INITSKIP is a flag, so no need to clear it.
    s0 = INITSKIP | READY;
    output(READYINIT, s0);
  }
  monitor_init();
}

void loop() {
  control();
  monitor();
}

void control() {
  input( READYINIT, s0);
  if (s0 & UPDATEREQ) {
    s0 |= UPDATING;
    output( READYINIT, s0);
    s1 = 0;
    do {
      output( CFG_ADDR, s1 );
      input( CFG_DATA+1, sC );
      input( CFG_DATA, sB );
      // sC.sB is the value,
      // it'll be shifted out of oblivion
      if (sC & 0x80) {
	// yes
	sA = s1;
	dac_write();
      }
      s1 += 1;
    } while (s1 != 65);
    // do 65, which is the GPIO control word
    output( CFG_ADDR, s1);
    input( CFG_DATA, sA);   // lo byte[7:3] I2C0
    input( CFG_DATA+1, sB); // hi byte[6:3] I2C1
    // shift up sB. they're downshifted by 1 to preserve bit 15 as an update bit
    sB <<= 1;
    // if C, then bit 15 was set
    if (C != 0) {
      KSET_I2C_BUS(0);
      // preserve ready/init bits
      sA |= 0x3;
      gpio1_write_output();
      KSET_I2C_BUS(1);
      sA = sB;
      gpio1_write_output();
    }
    s0 |= (UPDATECOMPLETE | READY);
    output(READYINIT, s0);
  }
}

//
// The monitoring path is a pain in the neck,
// because the monitoring ADC is incredibly
// slow and we need to switch between things
// periodically.
//
// We use the second regbank when we're in
// the monitor path, to allow us to reuse registers.
//
// NOTE: the monitor path and the control path
// CANNOT save crap to the stack between calls.
// This is because you could end up with
// control: push
// monitor: push
// monitor: pop
// control: pop
// which obviously won't work.
//
// This means that we don't need to worry about
// preserving stack register between banks:
// it'll only exit out of 0x3F briefly when
// each path is doing something.
//
#define MONITOR_COUNT_0 s0
#define MONITOR_COUNT_1 s1
#define MONITOR_COUNT_2 s2
#define MONITOR_CHANNEL s3
#define MONITOR_STATE   s4
#define MONITOR_INCREMENT s6

// call monitor_reset and move immediate to ST_SYNC
#define ST_RESET 0
// call monitor_sync_check on both I2C busses until both acknowledge
#define ST_SYNC_0 1
#define ST_SYNC_1 2
// extended path: we start with XSELn high, so
// we do channel 0/8/16/24 first. then we lower XSEL.
// the 'extended channels' are channels 64/65, 72/73, 80/81, 88/89.
#define ST_EXTEND 3
// normal path, go through channels 0-64
#define ST_NORMAL 4
// finish, these are the quick reads
// (channels 96+).
#define ST_TEMP_0 5
#define ST_TEMP_1 6
#define ST_PMON_0 7
#define ST_PMON_1 8
#define ST_PMON_2 9
#define ST_FINISH 10

#define PMON_CONTROL 0xD3
#define PMON_VIN 0x88
#define PMON_VOUT 0x8B
// PMON_IOUT is determined programmatically, it's 0x8C


void monitor_init() {
  psm("regbank B");
  // We need to init the stack in regbank B as well.
  stack_init();
  MONITOR_COUNT_0 = 0;
  input(MONITOR_RATE, MONITOR_COUNT_1);
  input(MONITOR_RATE+1, MONITOR_COUNT_2);
  MONITOR_STATE = ST_RESET;
  MONITOR_CHANNEL = 0;
  psm("regbank A");
}

// I'd love to do a jump table here:
// I need to figure out a macro for
// extracting label addresses.
// Figuring out a way to process
// switch statements would be even
// better obviously, but it's not
// SO bad to code a jump table.
void monitor() {
  psm("regbank B");
  if (MONITOR_STATE == ST_RESET) {
    monitor_reset();
    MONITOR_STATE = ST_SYNC_0;
  }
  // ST_SYNC_0 / ST_SYNC_1
  if (MONITOR_STATE < ST_EXTEND) {
    sA = MONITOR_STATE;
    sA -= 1;
    SET_I2C_BUS(sA);
    // returns and sets Z if ADCs are now converting.
    monitor_sync_check();
    psm("jump NZ, monitor_finish");
    MONITOR_STATE += 1;
    // bail out
    psm("jump monitor_finish");
  }
  // ST_EXTEND / ST_NORMAL
  if (MONITOR_STATE < ST_TEMP_0) {
    monitor_tick();
    psm("jump NZ, monitor_finish");    
    // oookay need to do something
    // massive sleaze
    // this is 253. Adding state will be 0 for ST_EXTEND
    // and 1 for ST_NORMAL.
    MONITOR_INCREMENT = (256 - ST_EXTEND);
    MONITOR_INCREMENT += MONITOR_STATE;
    if (Z != 0) {
      MONITOR_INCREMENT += 8;
    }
    // MONITOR_INCREMENT is now 1 or 8
    s5 = 0;
    do {
      // set up our NEXT read
      sB = MONITOR_CHANNEL;
      sA = sB;
      sA += MONITOR_INCREMENT;
      // shift up monitor channel,
      // so 0-31 becomes 0-62
      // we then add on the bus number to get a full 0-63
      // the extended guys then sparsely populate 64-128
      // and the temperatures/pmons fill it in
      MONITOR_CHANNEL <<= 1;      
      monitor_normalextend_read();
      // shift down monitor channel, we temporarily
      // shifted it up before.
      MONITOR_CHANNEL >>= 1;
      // now increment s5
      s5 += 1;
      // s5 might be either 0 or 64 on the first pass,
      // so it would be 1 or 65 here. Then on the
      // second pass, it'll be 2 or 66. So regardless,
      // check against the second bit.
    } while (!(s5 & 0x2));
    // now increment what channel we're on
    MONITOR_CHANNEL += MONITOR_INCREMENT;
    // are we past the end of the extended set?
    if (MONITOR_CHANNEL == 32) {
      // yes, go to normal
      MONITOR_CHANNEL = 0;
      MONITOR_STATE += 1;
    }
    psm("jump monitor_finish");
  }
  // ST_TEMP_0 / ST_TEMP_1
  if (MONITOR_STATE < ST_PMON_0) {
    monitor_temp_read();
    MONITOR_STATE += 1;
    if (MONITOR_STATE == ST_PMON_0) {
      // still on I2C BUS 1
      sB = PMON_CONTROL;
      sA = 0x1;
      sSpare = PMON_ADDR;
      store(I2C_BUFFER(2), sSpare);
      I2C_reg_write();
    }
    psm("jump monitor_finish");
  }
  if (MONITOR_STATE == ST_PMON_0) {
    monitor_tick();
    psm("jump NZ, monitor_finish");
  }
  monitor_pmon_read();
  MONITOR_STATE += 1;
  if (MONITOR_STATE == ST_FINISH) {
    MONITOR_STATE = ST_EXTEND;
    MONITOR_CHANNEL = 0;
    // maybe do something to flag
    // a completed cycle
    sSpare = MONCYCLETOGGLE;
    output(MONSTATUS, sSpare);
  }
 monitor_finish:
  // let the world know what we're doing
  output(MONSTATUS+1, MONITOR_STATE);
  psm("regbank A");  
}

// clear XSEL in ST_EXTEND, otherwise
// set it. Leave everything else high.
void toggle_xsel() {
  sA = 0xFF;
  if (MONITOR_STATE == ST_EXTEND) {
    sA ^= 0x10;
  }
  gpio0_write_output();
}

// we read out VIN/VOUT/IOUT
// these are 88/8B/8C
// and are stored in 116/119/120
// terminates in monitor_output
#define PMON_CHANNEL_0 116
void monitor_pmon_read(void) __attribute__((noreturn));
void monitor_pmon_read() {
  KSET_I2C_BUS(1);
  sSpare = PMON_ADDR;
  store(I2C_BUFFER(1), sSpare);
  // construct the channel from the monitor state
  s5 = MONITOR_STATE;
  s5 -= ST_PMON_0;
  // s5 = 0, 1, or 2
  if (Z != 0) {
    s5 += 2;
  }
  // s5 = 0, 3, 4
  sA = s5;
  // sA = 0, 3, 4
  sA += 0x88;
  // sA = 88, 8B, 8C
  I2C_reg_read16();
  // s5 = 0, 3, 4
  // so these are 116, 119, 120
  // monitor channel is pointless with temp/pmon,
  // can be anything we want.
  MONITOR_CHANNEL = 116;
  psm("jump monitor_output");
}

// 114/115 are the two temperature channels
#define TEMP_CHANNEL_0 114

// terminates in monitor_output
void monitor_temp_read(void) __attribute__((noreturn));
void monitor_temp_read() {
  sSpare = MONITOR_STATE;
  sSpare -= ST_TEMP_0;
  // 0 or 1
  SET_I2C_BUS(sSpare);
  sSpare = TEMP_ADDR;
  store(I2C_BUFFER(1), sSpare);
  // read register 0
  sA = 0;
  I2C_reg_read16();
  s5 = MONITOR_STATE;
  // monitor channel is pointless with temp/pmon,
  // can be anything we want.
  MONITOR_CHANNEL = (TEMP_CHANNEL_0 - ST_TEMP_0);
  // make s5 96/97
  psm("jump monitor_output");
}

// read channels 0-63, or
// read the extended channels (64+)
void monitor_normalextend_read(void) __attribute__((noreturn));
void monitor_normalextend_read() {
  // Set I2C bus. s5 is also used as the
  // base monitor channel output
  // 
  SET_I2C_BUS(s5);
  if (sA == 32) {
    push2();
    toggle_xsel();
    pop2();
    sA = 0;
  }
  monitor_operation();
  if (MONITOR_STATE == ST_EXTEND) {
    s5 |= 64;
  }
  // gets shifted down later.
  psm("jump monitor_output");
}

// Monitor output is the termination for all
// of the "monitor_*_read" functions.
void monitor_output() {
  s5 += MONITOR_CHANNEL;
  output(MON_ADDR, s5);
  // sA is the high byte (first read out)
  // writing to the low byte generates a mon_wr
  // so write it second
  output(MON_DATA+1, sA);
  output(MON_DATA, sB);
  // s5 isn't used by anyone either, so preserve
  // only the low bit, which is used to track
  // the I2C bus being used.
  s5 &= 0x1;
}

// each cycle is ~100 ns
// for a ~17 ms cycle that's
// a monitor rate of 664*256
// (169,984) cycles.

// returns Z when ready to proceed
void monitor_tick() {
  MONITOR_COUNT_2.MONITOR_COUNT_1.MONITOR_COUNT_0--;
  if ( Z != 0 ) {
    MONITOR_COUNT_0 = 0;
    input(MONITOR_RATE, MONITOR_COUNT_1);
    input(MONITOR_RATE+1, MONITOR_COUNT_2);
    input(MONSTATUS, sSpare);
    // this is a bit test: will set Z
    // if this is skipped, so still fine.
    if (sSpare & MONCYCLE_WAIT_AT_TICK) {
      // output 1 to indicate we've reached
      // it. The VIO will clear it, and then
      // we're ready to go.
      sSpare = MONCYCLE_WAITING;
      output(MONSTATUS, sSpare);
      output(MONSTATUS+1, MONITOR_STATE);
      output(MONSTATUS+2, MONITOR_CHANNEL);
      // again, this is a zero test, so
      // zero will be set when we're ready to go.
      while (sSpare & MONCYCLE_WAITING) {
	input(MONSTATUS, sSpare);
      }
    }
  }
  // Z should be preserved here
}

// monitor_operation(sB,sA):
// Disable switch value in sB,
// and change switch to value in sA.
// Then read ADC and return its result in sB.sA.
void monitor_operation() {
  // save sA, copy sB->sA, and clear switch
  push1();
  sA = sB;
  switch_clear();
  // restore sA and set switch
  pop1();
  switch_set();
  // and read ADC
  sA = ADC_ADDR_RD;  
  I2C_read_two_bytes();
}

// set switches to channel 0
void monitor_reset() {
  KSET_I2C_BUS(0);
  sA = 0;
  switch_set();
  KSET_I2C_BUS(1);
  sA = 0;
  switch_set();
}

// write 0 to ADC
// if it ACKs, a new conversion
// has now begun, and we need
// to wait 17 ms
void monitor_sync_check() {
  // write 0
  sA = 0;
  store(I2C_BUFFER(0), sA);
  // to ADC
  sA = ADC_ADDR;
  store(I2C_BUFFER(1), sA);
  sA = I2C_BUFFER(1);
  I2C_write_bytes();
  // set zero if success
  psm("add %1, 0", sA);
}

#define ADC_WRITE( addr, data ) \
  sA = addr;                    \
  sB = data;                    \
  adc_write_fn()

void adc_init() {
  s8 = 1;
  do {
    SET_I2C_BUS(s8);
    // this setup takes load/load/call x 5 = 15 instructions
    // unlikely that a call table would help
    // a loop might tho
    ADC_WRITE( 0x00 , 0x00 );
    ADC_WRITE( 0x01 , 0x00 );
    ADC_WRITE( 0x02 , 0x00 );
    ADC_WRITE( 0x03 , 0x02 );
    ADC_WRITE( 0x04 , 0x00 );
  } while (s8--);
}

void adc_write_fn() {
  // store sB at 0x3F
  // store sA at 0x3E
  push2();
  spi_begin();
  // fetch sA from 0x3E (sA = address)
  pop1();
  spi_write_byte();
  // fetch sA from 0x3F (sB = data)
  pop1();
  spi_write_byte();
  spi_stop();
}
