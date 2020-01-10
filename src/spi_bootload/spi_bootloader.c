#define sSpare sF
#include "soft_spi_flash.h"

#define IF_CMD_PENDING 0x10
#define IF_CMD_STATUS  0x11
#define IF_CMD         0x12
#define IF_ARG0        0x14
#define IF_ARG1        0x16

// this is 1110, meaning registers 1, 2, 3 have been written to
#define CMD_PENDING 0xE
#define CMD_COMPLETE   0x2
#define CMD_ERROR      0x4
#define CMD_TIMEOUT    0x8

#define FIFO           0x20
#define RESET          0x30
#define RESET_WBSTAR   0x34
#define RESET_BIT      0x1
#define IPROG_BIT      0x80

// we support:
#define PAGE_PROGRAM   0x02
#define READ           0x03
// PAGE_PROGRAM  0x02
// 4PAGE_PROGRAM 0x12
// READ          0x03
// 4READ         0x13
// these are all combinations of 000x001x,
// but testing this does require two operations.
// so what we do is sB = sA
// sB &= PP_READ_MASK
// if (sB == PAGE_PROGRAM)
#define PP_READ_MASK    0xEE
// bit set in PP/READ to use 4-byte address
#define PP_READ_4BIT    0x10
#define SECTOR_ERASE    0xDE  //1101_1110
#define SECTOR_ERASE_4  0xDC  //1101_1100
#define SECTOR_ERASE_4BIT 0x02

// this is the mask for either of the two
#define SECTOR_ERASE_MASK ((~(SECTOR_ERASE ^ SECTOR_ERASE_4BIT) ) & 0xFF)

#define READ_ID 0x9E
#define WRITE_NONVOLATILE_LOCK_BITS 0xE3
#define ERASE_NONVOLATILE_LOCK_BITS 0xE4
#define ICAP_REBOOT 0xFF

void init() {
  // switch STARTUPE2 over to our control
  SPI_STARTUP_initialize();
}

void loop() {
  check_command();
}

// no return at the end, this function either returns
// directly or through command_finish()
void check_command(void) __attribute__((noreturn));
void check_command() {
  // We're a top level function, we can use
  // top-level registers fine.
  
  input( IF_CMD_PENDING, &s0);
  // check to see if nothing is going on.
  // if ANY of these bits are NOT set, this will be true
  if (s0 ^ CMD_PENDING)
    return;
  
  // yes, check to see if it validates.
  // To do this we input everything from 12-17,
  // and XOR them all together, and it must be zero.
#define pointer s0
#define checksum s1
  
  // pointer
  pointer = IF_CMD;
  checksum = 0;
  do {
    // read byte into s2...
    input( pointer , &sSpare );
    // xor it with the sum...
    checksum ^= sSpare;
    // and increment pointer
    pointer++;
  } while (pointer < (IF_ARG1 + 2));
  if (checksum != 0) {
    // check didn't work
    sSpare = (CMD_COMPLETE | CMD_ERROR);
    psm("jump command_finish");
  }
  // done with pointer/checksum
#undef pointer
#undef checksum

  // use s0 as cmd, s1 as counter
#define cmd s0
#define counter s1
  input( IF_CMD, &cmd);
  sSpare = cmd;
  sSpare &= PP_READ_MASK;
  if (sSpare == PAGE_PROGRAM) {
    // cmd is a page program or read command
    // get all arguments into sD/sA/sB/sC
    get_arguments();
    if (cmd ^ PP_READ_4BIT) {
      // this is a 3-byte command, abandon sD
      sD = 0xFF;
    }
    // clear the 'use 4 byte address' bit
    cmd &= ((~PP_READ_4BIT) & 0xFF);
    if (cmd == PAGE_PROGRAM) {
      // begin write...
      SPI_Flash_write_begin();
      // want to write 256 bytes, so start with 255 and do_while(counter--)
      counter = 255;
      do {
	input( FIFO , &sA );
	SPI_Flash_write_byte();
      } while (counter--);
      SPI_Flash_write_complete();
      psm("jump command_complete_with_timeout");
    }
    // must be READ instead!
    SPI_Flash_read_begin();
    counter = 255;
    do {
      SPI_Flash_read_byte();
      output( FIFO, &sA);      
    } while (counter--);
    SPI_Flash_read_complete();
    // read always works.
    sSpare = CMD_COMPLETE;
    psm("jump command_finish");
  }
  // check sector erase and its 4 bit variant
  sSpare = cmd;
  sSpare &= SECTOR_ERASE_MASK;
  if (sSpare == SECTOR_ERASE) {
    get_arguments();
    // now check to see if the 4BIT is SET
    // 3-byte operation = 0xDE (bit is SET)
    // 4-byte operation = 0xDC (bit is NOT SET)x
    // because, god damnit, nothing can be easy
    if (cmd & SECTOR_ERASE_4BIT) {
      // Must be a 3 byte operation
      sD = 0xFF;
    }
    SPI_Flash_erase_sector();
    psm("jump command_complete_with_timeout");
  }
  // check read ID...
  if (cmd == READ_ID) {
    // no arguments
    SPI_Flash_read_ID();
    // now in sC/sB/sA
    output( IF_ARG1, &sC);
    output( IF_ARG0+1, &sB);
    output( IF_ARG0, &sA);
    sSpare = CMD_COMPLETE;
    psm("jump command_finish");
  }
  if (cmd == WRITE_NONVOLATILE_LOCK_BITS) {
    get_arguments();
    SPI_Flash_write_nonvolatile_lock_bits();
    psm("jump command_complete_with_timeout");
  }
  if (cmd == ERASE_NONVOLATILE_LOCK_BITS) {
    // no arguments
    SPI_Flash_erase_nonvolatile_lock_bits();
    psm("jump command_complete_with_timeout");
  }
  if (cmd == ICAP_REBOOT) {
    get_arguments();
    output( RESET_WBSTAR, &sC);
    output( RESET_WBSTAR+1, &sB);
    output( RESET_WBSTAR+2, &sA);
    output( RESET_WBSTAR+3, &sD);
    sSpare = IPROG_BIT;
    // bye-bye, folks
    output( RESET, &sSpare);
    sSpare = CMD_COMPLETE;
    // this will probably go out before IPROG finishes, mind you
    psm("jump command_finish");
  }
  // not a valid command
  sSpare = (CMD_ERROR | CMD_COMPLETE);
  psm("jump command_finish");
}

// this has an embedded function command_finish inside it
void command_complete_with_timeout() {
  sSpare = CMD_COMPLETE;
  if (sA != 0) sSpare |= CMD_TIMEOUT;
 command_finish:
  output( IF_CMD_STATUS , sSpare);
  // just write something to the pending port, which clears it
  output( IF_CMD_PENDING, sSpare);
}
    
// reads arguments into sD/sA/sB/sC
// sA is 
void get_arguments() {
  input( IF_ARG1+1, &sD);
  input( IF_ARG1, &sA);
  input( IF_ARG0+1, &sB);
  input( IF_ARG0, &sC);
}

// we got interrupted.
bool_t spiisr(void) __attribute__((interrupt("IRQ0")));
bool_t spiisr(void) {
  SPI_Flash_reset();
  sSpare = RESET_BIT;
  // that's all, folks
  output( RESET, sSpare);
}
