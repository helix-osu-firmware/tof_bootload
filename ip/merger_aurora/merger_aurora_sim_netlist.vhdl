-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Thu Jan  2 17:56:47 2020
-- Host        : PHY-NC121402 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/allison.122/Box/firmware/tof_bootload/ip/merger_aurora/merger_aurora_sim_netlist.vhdl
-- Design      : merger_aurora
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_AXI_TO_LL is
  port (
    \crcreg_reg[0]\ : out STD_LOGIC;
    new_pkt_r : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_AXI_TO_LL : entity is "merger_aurora_AXI_TO_LL";
end merger_aurora_merger_aurora_AXI_TO_LL;

architecture STRUCTURE of merger_aurora_merger_aurora_AXI_TO_LL is
begin
new_pkt_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => new_pkt_r,
      Q => \crcreg_reg[0]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_CHANNEL_ERR_DETECT is
  port (
    soft_err : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    reset_channel_i : out STD_LOGIC;
    \soft_err_r_reg[1]\ : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    hard_err_i : in STD_LOGIC;
    lane_up : in STD_LOGIC;
    power_down : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_CHANNEL_ERR_DETECT : entity is "merger_aurora_CHANNEL_ERR_DETECT";
end merger_aurora_merger_aurora_CHANNEL_ERR_DETECT;

architecture STRUCTURE of merger_aurora_merger_aurora_CHANNEL_ERR_DETECT is
  signal RESET_CHANNEL_i_1_n_0 : STD_LOGIC;
  signal hard_err_r : STD_LOGIC;
  signal lane_up_r : STD_LOGIC;
  signal soft_err_r_reg_srl3_n_0 : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of soft_err_r_reg_srl3 : label is "inst/\merger_aurora_core_i/global_logic_i/channel_err_detect_i/soft_err_r_reg_srl3 ";
begin
CHANNEL_HARD_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => hard_err_r,
      Q => hard_err,
      R => '0'
    );
CHANNEL_SOFT_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => soft_err_r_reg_srl3_n_0,
      Q => soft_err,
      R => '0'
    );
RESET_CHANNEL_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => power_down,
      I1 => lane_up_r,
      O => RESET_CHANNEL_i_1_n_0
    );
RESET_CHANNEL_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RESET_CHANNEL_i_1_n_0,
      Q => reset_channel_i,
      R => '0'
    );
hard_err_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => hard_err_i,
      Q => hard_err_r,
      R => '0'
    );
lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => lane_up,
      Q => lane_up_r,
      R => '0'
    );
soft_err_r_reg_srl3: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => \soft_err_r_reg[1]\,
      Q => soft_err_r_reg_srl3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_CHANNEL_INIT_SM is
  port (
    gen_ver_i : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    channel_up : out STD_LOGIC;
    gtrxreset_i : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    ready_r_reg0 : out STD_LOGIC;
    new_pkt_r : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    txver_count_r0 : in STD_LOGIC;
    got_v_i : in STD_LOGIC;
    wait_for_lane_up_r0 : in STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_channel_i : in STD_LOGIC;
    hard_err_reset_i : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    \count_reg[1]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_CHANNEL_INIT_SM : entity is "merger_aurora_CHANNEL_INIT_SM";
end merger_aurora_merger_aurora_CHANNEL_INIT_SM;

architecture STRUCTURE of merger_aurora_merger_aurora_CHANNEL_INIT_SM is
  signal GTRXRESET_OUT_i_1_n_0 : STD_LOGIC;
  signal GTRXRESET_OUT_i_2_n_0 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal all_lanes_v_r : STD_LOGIC;
  signal bad_v_r : STD_LOGIC;
  signal bad_v_r0 : STD_LOGIC;
  signal \^channel_up\ : STD_LOGIC;
  signal \free_count_r[13]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[13]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[13]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[13]_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[1]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[5]_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r[9]_i_5_n_0\ : STD_LOGIC;
  signal free_count_r_reg : STD_LOGIC_VECTOR ( 0 to 13 );
  signal \free_count_r_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[13]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[1]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[1]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[1]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[5]_i_1_n_7\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_1\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_2\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_3\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_4\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_5\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_6\ : STD_LOGIC;
  signal \free_count_r_reg[9]_i_1_n_7\ : STD_LOGIC;
  signal \^gen_ver_i\ : STD_LOGIC;
  signal got_first_v_r : STD_LOGIC;
  signal got_first_v_r_i_1_n_0 : STD_LOGIC;
  signal gtreset_c : STD_LOGIC;
  signal gtrxreset_extend_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gtrxreset_nxt : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_verify_c : STD_LOGIC;
  signal p_2_out : STD_LOGIC_VECTOR ( 31 to 31 );
  signal ready_r : STD_LOGIC;
  signal ready_r2 : STD_LOGIC;
  signal reset_lanes_c : STD_LOGIC;
  signal rxver_count_r0 : STD_LOGIC;
  signal \rxver_count_r_reg[1]_srl2_n_0\ : STD_LOGIC;
  signal \rxver_count_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \txver_count_r_reg[6]_srl7_n_0\ : STD_LOGIC;
  signal \txver_count_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \v_count_r_reg[30]_srl31_n_0\ : STD_LOGIC;
  signal \v_count_r_reg_n_0_[31]\ : STD_LOGIC;
  signal verify_watchdog_r0 : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_2_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_3_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_4_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg_n_0_[15]\ : STD_LOGIC;
  signal wait_for_lane_up_r : STD_LOGIC;
  signal \NLW_free_count_r_reg[1]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_free_count_r_reg[1]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_v_count_r_reg[30]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of got_first_v_r_i_1 : label is "soft_lutpair33";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtreset_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gtreset_flop_0_i : label is "FD";
  attribute SOFT_HLUTNM of \ready_r_i_1__0\ : label is "soft_lutpair34";
  attribute BOX_TYPE of reset_lanes_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of reset_lanes_flop_i : label is "FD";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \rxver_count_r_reg[1]_srl2\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/rxver_count_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \rxver_count_r_reg[1]_srl2\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/rxver_count_r_reg[1]_srl2 ";
  attribute srl_bus_name of \txver_count_r_reg[6]_srl7\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/txver_count_r_reg ";
  attribute srl_name of \txver_count_r_reg[6]_srl7\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/txver_count_r_reg[6]_srl7 ";
  attribute srl_bus_name of \v_count_r_reg[30]_srl31\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/v_count_r_reg ";
  attribute srl_name of \v_count_r_reg[30]_srl31\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/v_count_r_reg[30]_srl31 ";
  attribute SOFT_HLUTNM of \v_count_r_reg[30]_srl31_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of verify_r_i_2 : label is "soft_lutpair34";
  attribute srl_bus_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/verify_watchdog_r_reg ";
  attribute srl_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\merger_aurora_core_i/global_logic_i/channel_init_sm_i/verify_watchdog_r_reg[14]_srl15 ";
begin
  SR(0) <= \^sr\(0);
  channel_up <= \^channel_up\;
  gen_ver_i <= \^gen_ver_i\;
CHANNEL_UP_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => ready_r2,
      Q => \^channel_up\,
      R => '0'
    );
GTRXRESET_OUT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => gtrxreset_extend_r(2),
      I1 => gtrxreset_extend_r(3),
      I2 => gtrxreset_extend_r(0),
      I3 => gtrxreset_extend_r(1),
      I4 => GTRXRESET_OUT_i_2_n_0,
      O => GTRXRESET_OUT_i_1_n_0
    );
GTRXRESET_OUT_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gtrxreset_extend_r(5),
      I1 => gtrxreset_extend_r(4),
      I2 => gtrxreset_extend_r(7),
      I3 => gtrxreset_extend_r(6),
      O => GTRXRESET_OUT_i_2_n_0
    );
GTRXRESET_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => GTRXRESET_OUT_i_1_n_0,
      Q => gtrxreset_i,
      R => '0'
    );
START_RX_reg_inv: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => wait_for_lane_up_r,
      Q => SS(0),
      S => SYSTEM_RESET_reg(0)
    );
align_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sr\(0),
      I1 => hard_err_reset_i,
      O => ready_r_reg0
    );
all_lanes_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => got_v_i,
      Q => all_lanes_v_r,
      R => '0'
    );
bad_v_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => all_lanes_v_r,
      I1 => got_first_v_r,
      I2 => \v_count_r_reg_n_0_[31]\,
      O => bad_v_r0
    );
bad_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => bad_v_r0,
      Q => bad_v_r,
      R => '0'
    );
do_nfc_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^channel_up\,
      O => p_0_in
    );
\free_count_r[13]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(10),
      O => \free_count_r[13]_i_2_n_0\
    );
\free_count_r[13]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(11),
      O => \free_count_r[13]_i_3_n_0\
    );
\free_count_r[13]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(12),
      O => \free_count_r[13]_i_4_n_0\
    );
\free_count_r[13]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(13),
      O => \free_count_r[13]_i_5_n_0\
    );
\free_count_r[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(0),
      O => \free_count_r[1]_i_2_n_0\
    );
\free_count_r[1]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(1),
      O => \free_count_r[1]_i_3_n_0\
    );
\free_count_r[5]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(2),
      O => \free_count_r[5]_i_2_n_0\
    );
\free_count_r[5]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(3),
      O => \free_count_r[5]_i_3_n_0\
    );
\free_count_r[5]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(4),
      O => \free_count_r[5]_i_4_n_0\
    );
\free_count_r[5]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(5),
      O => \free_count_r[5]_i_5_n_0\
    );
\free_count_r[9]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(6),
      O => \free_count_r[9]_i_2_n_0\
    );
\free_count_r[9]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(7),
      O => \free_count_r[9]_i_3_n_0\
    );
\free_count_r[9]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(8),
      O => \free_count_r[9]_i_4_n_0\
    );
\free_count_r[9]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => free_count_r_reg(9),
      O => \free_count_r[9]_i_5_n_0\
    );
\free_count_r_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[1]_i_1_n_6\,
      Q => free_count_r_reg(0),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_4\,
      Q => free_count_r_reg(10),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_5\,
      Q => free_count_r_reg(11),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_6\,
      Q => free_count_r_reg(12),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[13]_i_1_n_7\,
      Q => free_count_r_reg(13),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[13]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \free_count_r_reg[13]_i_1_n_0\,
      CO(2) => \free_count_r_reg[13]_i_1_n_1\,
      CO(1) => \free_count_r_reg[13]_i_1_n_2\,
      CO(0) => \free_count_r_reg[13]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[13]_i_1_n_4\,
      O(2) => \free_count_r_reg[13]_i_1_n_5\,
      O(1) => \free_count_r_reg[13]_i_1_n_6\,
      O(0) => \free_count_r_reg[13]_i_1_n_7\,
      S(3) => \free_count_r[13]_i_2_n_0\,
      S(2) => \free_count_r[13]_i_3_n_0\,
      S(1) => \free_count_r[13]_i_4_n_0\,
      S(0) => \free_count_r[13]_i_5_n_0\
    );
\free_count_r_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[1]_i_1_n_7\,
      Q => free_count_r_reg(1),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[1]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[5]_i_1_n_0\,
      CO(3 downto 1) => \NLW_free_count_r_reg[1]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \free_count_r_reg[1]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3 downto 2) => \NLW_free_count_r_reg[1]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \free_count_r_reg[1]_i_1_n_6\,
      O(0) => \free_count_r_reg[1]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \free_count_r[1]_i_2_n_0\,
      S(0) => \free_count_r[1]_i_3_n_0\
    );
\free_count_r_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_4\,
      Q => free_count_r_reg(2),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_5\,
      Q => free_count_r_reg(3),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_6\,
      Q => free_count_r_reg(4),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[5]_i_1_n_7\,
      Q => free_count_r_reg(5),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[5]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[9]_i_1_n_0\,
      CO(3) => \free_count_r_reg[5]_i_1_n_0\,
      CO(2) => \free_count_r_reg[5]_i_1_n_1\,
      CO(1) => \free_count_r_reg[5]_i_1_n_2\,
      CO(0) => \free_count_r_reg[5]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[5]_i_1_n_4\,
      O(2) => \free_count_r_reg[5]_i_1_n_5\,
      O(1) => \free_count_r_reg[5]_i_1_n_6\,
      O(0) => \free_count_r_reg[5]_i_1_n_7\,
      S(3) => \free_count_r[5]_i_2_n_0\,
      S(2) => \free_count_r[5]_i_3_n_0\,
      S(1) => \free_count_r[5]_i_4_n_0\,
      S(0) => \free_count_r[5]_i_5_n_0\
    );
\free_count_r_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_4\,
      Q => free_count_r_reg(6),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_5\,
      Q => free_count_r_reg(7),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_6\,
      Q => free_count_r_reg(8),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \free_count_r_reg[9]_i_1_n_7\,
      Q => free_count_r_reg(9),
      S => wait_for_lane_up_r0
    );
\free_count_r_reg[9]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \free_count_r_reg[13]_i_1_n_0\,
      CO(3) => \free_count_r_reg[9]_i_1_n_0\,
      CO(2) => \free_count_r_reg[9]_i_1_n_1\,
      CO(1) => \free_count_r_reg[9]_i_1_n_2\,
      CO(0) => \free_count_r_reg[9]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \free_count_r_reg[9]_i_1_n_4\,
      O(2) => \free_count_r_reg[9]_i_1_n_5\,
      O(1) => \free_count_r_reg[9]_i_1_n_6\,
      O(0) => \free_count_r_reg[9]_i_1_n_7\,
      S(3) => \free_count_r[9]_i_2_n_0\,
      S(2) => \free_count_r[9]_i_3_n_0\,
      S(1) => \free_count_r[9]_i_4_n_0\,
      S(0) => \free_count_r[9]_i_5_n_0\
    );
got_first_v_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => got_first_v_r,
      I1 => all_lanes_v_r,
      I2 => \^gen_ver_i\,
      O => got_first_v_r_i_1_n_0
    );
got_first_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => got_first_v_r_i_1_n_0,
      Q => got_first_v_r,
      R => '0'
    );
gtreset_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtreset_c,
      Q => gtrxreset_nxt,
      R => '0'
    );
gtreset_flop_0_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AE00"
    )
        port map (
      I0 => \verify_watchdog_r_reg_n_0_[15]\,
      I1 => bad_v_r,
      I2 => \rxver_count_r_reg_n_0_[2]\,
      I3 => \^gen_ver_i\,
      O => gtreset_c
    );
\gtrxreset_extend_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(1),
      Q => gtrxreset_extend_r(0),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(2),
      Q => gtrxreset_extend_r(1),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(3),
      Q => gtrxreset_extend_r(2),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(4),
      Q => gtrxreset_extend_r(3),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(5),
      Q => gtrxreset_extend_r(4),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(6),
      Q => gtrxreset_extend_r(5),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_extend_r(7),
      Q => gtrxreset_extend_r(6),
      R => SYSTEM_RESET_reg(0)
    );
\gtrxreset_extend_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_nxt,
      Q => gtrxreset_extend_r(7),
      R => SYSTEM_RESET_reg(0)
    );
new_pkt_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0022202020202020"
    )
        port map (
      I0 => \^channel_up\,
      I1 => SYSTEM_RESET_reg(0),
      I2 => new_pkt_r_reg,
      I3 => s_axi_tx_tlast,
      I4 => s_axi_tx_tvalid,
      I5 => \count_reg[1]\,
      O => new_pkt_r
    );
ready_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => ready_r,
      Q => ready_r2,
      R => '0'
    );
\ready_r_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => \txver_count_r_reg_n_0_[7]\,
      I1 => \rxver_count_r_reg_n_0_[2]\,
      I2 => \^gen_ver_i\,
      I3 => ready_r,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_ready_c,
      Q => ready_r,
      R => wait_for_lane_up_r0
    );
reset_lanes_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_lanes_c,
      Q => \^sr\(0),
      R => '0'
    );
reset_lanes_flop_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => SYSTEM_RESET_reg(0),
      I1 => reset_channel_i,
      I2 => wait_for_lane_up_r,
      I3 => gtreset_c,
      O => reset_lanes_c
    );
\rxver_count_r_reg[1]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => rxver_count_r0,
      CLK => gtrxreset_o_reg,
      D => \^gen_ver_i\,
      Q => \rxver_count_r_reg[1]_srl2_n_0\
    );
\rxver_count_r_reg[1]_srl2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => all_lanes_v_r,
      I1 => \v_count_r_reg_n_0_[31]\,
      I2 => \^gen_ver_i\,
      O => rxver_count_r0
    );
\rxver_count_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => rxver_count_r0,
      D => \rxver_count_r_reg[1]_srl2_n_0\,
      Q => \rxver_count_r_reg_n_0_[2]\,
      R => '0'
    );
\txver_count_r_reg[6]_srl7\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => txver_count_r0,
      CLK => gtrxreset_o_reg,
      D => \^gen_ver_i\,
      Q => \txver_count_r_reg[6]_srl7_n_0\
    );
\txver_count_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => txver_count_r0,
      D => \txver_count_r_reg[6]_srl7_n_0\,
      Q => \txver_count_r_reg_n_0_[7]\,
      R => '0'
    );
\v_count_r_reg[30]_srl31\: unisim.vcomponents.SRLC32E
     port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => p_2_out(31),
      Q => \v_count_r_reg[30]_srl31_n_0\,
      Q31 => \NLW_v_count_r_reg[30]_srl31_Q31_UNCONNECTED\
    );
\v_count_r_reg[30]_srl31_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \^gen_ver_i\,
      I1 => \v_count_r_reg_n_0_[31]\,
      I2 => got_first_v_r,
      I3 => all_lanes_v_r,
      O => p_2_out(31)
    );
\v_count_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \v_count_r_reg[30]_srl31_n_0\,
      Q => \v_count_r_reg_n_0_[31]\,
      R => '0'
    );
verify_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF2A"
    )
        port map (
      I0 => \^gen_ver_i\,
      I1 => \txver_count_r_reg_n_0_[7]\,
      I2 => \rxver_count_r_reg_n_0_[2]\,
      I3 => wait_for_lane_up_r,
      O => next_verify_c
    );
verify_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_verify_c,
      Q => \^gen_ver_i\,
      R => wait_for_lane_up_r0
    );
\verify_watchdog_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => verify_watchdog_r0,
      CLK => gtrxreset_o_reg,
      D => \^gen_ver_i\,
      Q => \verify_watchdog_r_reg[14]_srl15_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80FF"
    )
        port map (
      I0 => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\,
      I1 => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\,
      I2 => \verify_watchdog_r_reg[14]_srl15_i_4_n_0\,
      I3 => \^gen_ver_i\,
      O => verify_watchdog_r0
    );
\verify_watchdog_r_reg[14]_srl15_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => free_count_r_reg(5),
      I1 => free_count_r_reg(4),
      I2 => free_count_r_reg(3),
      I3 => free_count_r_reg(2),
      I4 => free_count_r_reg(0),
      I5 => free_count_r_reg(1),
      O => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => free_count_r_reg(12),
      I1 => free_count_r_reg(13),
      I2 => free_count_r_reg(10),
      I3 => free_count_r_reg(11),
      O => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => free_count_r_reg(6),
      I1 => free_count_r_reg(7),
      I2 => free_count_r_reg(8),
      I3 => free_count_r_reg(9),
      O => \verify_watchdog_r_reg[14]_srl15_i_4_n_0\
    );
\verify_watchdog_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => verify_watchdog_r0,
      D => \verify_watchdog_r_reg[14]_srl15_n_0\,
      Q => \verify_watchdog_r_reg_n_0_[15]\,
      R => '0'
    );
wait_for_lane_up_r_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_channel_i,
      Q => wait_for_lane_up_r,
      S => SYSTEM_RESET_reg(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_CLOCK_MODULE is
  port (
    user_clk_out : out STD_LOGIC;
    tx_out_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_CLOCK_MODULE : entity is "merger_aurora_CLOCK_MODULE";
end merger_aurora_merger_aurora_CLOCK_MODULE;

architecture STRUCTURE of merger_aurora_merger_aurora_CLOCK_MODULE is
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of user_clk_buf_i : label is "PRIMITIVE";
begin
user_clk_buf_i: unisim.vcomponents.BUFG
     port map (
      I => tx_out_clk,
      O => user_clk_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_CRC_TOP is
  port (
    CRC_DATAVALID1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \CRC_reg_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    tx_dst_rdy_crc : in STD_LOGIC;
    count : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_tx_tvalid : in STD_LOGIC;
    eof_sc_r_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rem_in_reg : in STD_LOGIC;
    \CRC_reg_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SYSTEM_RESET_reg : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_CRC_TOP : entity is "merger_aurora_CRC_TOP";
end merger_aurora_merger_aurora_CRC_TOP;

architecture STRUCTURE of merger_aurora_merger_aurora_CRC_TOP is
  signal \^crc_datavalid1\ : STD_LOGIC;
  signal CRC_DATAWIDTH1 : STD_LOGIC;
  signal CRC_RESET : STD_LOGIC;
  signal crc_data_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \crcreg[10]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[11]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[11]_i_3_n_0\ : STD_LOGIC;
  signal \crcreg[12]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[12]_i_3_n_0\ : STD_LOGIC;
  signal \crcreg[13]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[13]_i_3_n_0\ : STD_LOGIC;
  signal \crcreg[13]_i_4_n_0\ : STD_LOGIC;
  signal \crcreg[14]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[14]_i_3_n_0\ : STD_LOGIC;
  signal \crcreg[14]_i_4_n_0\ : STD_LOGIC;
  signal \crcreg[15]_i_3_n_0\ : STD_LOGIC;
  signal \crcreg[15]_i_4_n_0\ : STD_LOGIC;
  signal \crcreg[15]_i_5_n_0\ : STD_LOGIC;
  signal \crcreg[1]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[2]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[3]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[9]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg_reg_n_0_[0]\ : STD_LOGIC;
  signal \crcreg_reg_n_0_[8]\ : STD_LOGIC;
  signal data_valid : STD_LOGIC;
  signal data_width : STD_LOGIC;
  signal msg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_0_out0 : STD_LOGIC;
  signal p_10_in : STD_LOGIC;
  signal p_11_in : STD_LOGIC;
  signal p_12_in : STD_LOGIC;
  signal p_13_in : STD_LOGIC;
  signal p_14_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  signal p_6_in : STD_LOGIC;
  signal p_8_in : STD_LOGIC;
  signal p_9_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CRC_reg[11]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \CRC_reg[12]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \CRC_reg[13]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \CRC_reg[14]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \CRC_reg[15]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \CRC_reg[3]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \crcreg[10]_i_2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \crcreg[11]_i_2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \crcreg[11]_i_3\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \crcreg[12]_i_2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \crcreg[13]_i_3\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \crcreg[13]_i_4\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \crcreg[14]_i_3\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \crcreg[14]_i_4\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \crcreg[15]_i_4\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \crcreg[15]_i_5\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \crcreg[4]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \crcreg[9]_i_2\ : label is "soft_lutpair104";
begin
  CRC_DATAVALID1 <= \^crc_datavalid1\;
\CRC_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in,
      O => \CRC_reg_reg[15]\(0)
    );
\CRC_reg[10]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_in,
      O => \CRC_reg_reg[15]\(10)
    );
\CRC_reg[11]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_11_in,
      O => \CRC_reg_reg[15]\(11)
    );
\CRC_reg[12]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_12_in,
      O => \CRC_reg_reg[15]\(12)
    );
\CRC_reg[13]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_13_in,
      O => \CRC_reg_reg[15]\(13)
    );
\CRC_reg[14]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_14_in,
      O => \CRC_reg_reg[15]\(14)
    );
\CRC_reg[15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \crcreg_reg_n_0_[8]\,
      O => \CRC_reg_reg[15]\(15)
    );
\CRC_reg[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_1_in,
      O => \CRC_reg_reg[15]\(1)
    );
\CRC_reg[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_2_in,
      O => \CRC_reg_reg[15]\(2)
    );
\CRC_reg[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_3_in,
      O => \CRC_reg_reg[15]\(3)
    );
\CRC_reg[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_4_in,
      O => \CRC_reg_reg[15]\(4)
    );
\CRC_reg[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_5_in,
      O => \CRC_reg_reg[15]\(5)
    );
\CRC_reg[6]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_6_in,
      O => \CRC_reg_reg[15]\(6)
    );
\CRC_reg[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \crcreg_reg_n_0_[0]\,
      O => \CRC_reg_reg[15]\(7)
    );
\CRC_reg[8]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_8_in,
      O => \CRC_reg_reg[15]\(8)
    );
\CRC_reg[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_9_in,
      O => \CRC_reg_reg[15]\(9)
    );
\DATA_DS[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(0),
      I2 => rem_in_reg,
      I3 => p_8_in,
      I4 => \CRC_reg_reg[7]\(0),
      I5 => SYSTEM_RESET_reg,
      O => D(0)
    );
\DATA_DS[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(1),
      I2 => rem_in_reg,
      I3 => p_9_in,
      I4 => \CRC_reg_reg[7]\(1),
      I5 => SYSTEM_RESET_reg,
      O => D(1)
    );
\DATA_DS[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(2),
      I2 => rem_in_reg,
      I3 => p_10_in,
      I4 => \CRC_reg_reg[7]\(2),
      I5 => SYSTEM_RESET_reg,
      O => D(2)
    );
\DATA_DS[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(3),
      I2 => rem_in_reg,
      I3 => p_11_in,
      I4 => \CRC_reg_reg[7]\(3),
      I5 => SYSTEM_RESET_reg,
      O => D(3)
    );
\DATA_DS[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(4),
      I2 => rem_in_reg,
      I3 => p_12_in,
      I4 => \CRC_reg_reg[7]\(4),
      I5 => SYSTEM_RESET_reg,
      O => D(4)
    );
\DATA_DS[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(5),
      I2 => rem_in_reg,
      I3 => p_13_in,
      I4 => \CRC_reg_reg[7]\(5),
      I5 => SYSTEM_RESET_reg,
      O => D(5)
    );
\DATA_DS[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(6),
      I2 => rem_in_reg,
      I3 => p_14_in,
      I4 => \CRC_reg_reg[7]\(6),
      I5 => SYSTEM_RESET_reg,
      O => D(6)
    );
\DATA_DS[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => eof_sc_r_reg,
      I1 => Q(7),
      I2 => rem_in_reg,
      I3 => \crcreg_reg_n_0_[8]\,
      I4 => \CRC_reg_reg[7]\(7),
      I5 => SYSTEM_RESET_reg,
      O => D(7)
    );
\crc_data_i[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s_axi_tx_tkeep(0),
      I1 => s_axi_tx_tkeep(1),
      I2 => s_axi_tx_tlast,
      I3 => \^crc_datavalid1\,
      O => p_0_out0
    );
\crc_data_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(8),
      Q => crc_data_i(0),
      R => p_0_out0
    );
\crc_data_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(2),
      Q => crc_data_i(10),
      R => '0'
    );
\crc_data_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(3),
      Q => crc_data_i(11),
      R => '0'
    );
\crc_data_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(4),
      Q => crc_data_i(12),
      R => '0'
    );
\crc_data_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(5),
      Q => crc_data_i(13),
      R => '0'
    );
\crc_data_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(6),
      Q => crc_data_i(14),
      R => '0'
    );
\crc_data_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(7),
      Q => crc_data_i(15),
      R => '0'
    );
\crc_data_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(9),
      Q => crc_data_i(1),
      R => p_0_out0
    );
\crc_data_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(10),
      Q => crc_data_i(2),
      R => p_0_out0
    );
\crc_data_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(11),
      Q => crc_data_i(3),
      R => p_0_out0
    );
\crc_data_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(12),
      Q => crc_data_i(4),
      R => p_0_out0
    );
\crc_data_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(13),
      Q => crc_data_i(5),
      R => p_0_out0
    );
\crc_data_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(14),
      Q => crc_data_i(6),
      R => p_0_out0
    );
\crc_data_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(15),
      Q => crc_data_i(7),
      R => p_0_out0
    );
\crc_data_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(0),
      Q => crc_data_i(8),
      R => '0'
    );
\crc_data_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_tx_tdata(1),
      Q => crc_data_i(9),
      R => '0'
    );
\crcreg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2EE2E22EE22E2EE2"
    )
        port map (
      I0 => \crcreg[13]_i_3_n_0\,
      I1 => data_width,
      I2 => \crcreg[12]_i_2_n_0\,
      I3 => \crcreg[11]_i_3_n_0\,
      I4 => crc_data_i(0),
      I5 => \crcreg_reg_n_0_[0]\,
      O => msg(0)
    );
\crcreg[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFF0096969696"
    )
        port map (
      I0 => \crcreg[10]_i_2_n_0\,
      I1 => crc_data_i(2),
      I2 => p_5_in,
      I3 => \crcreg[13]_i_2_n_0\,
      I4 => \crcreg[15]_i_4_n_0\,
      I5 => data_width,
      O => msg(10)
    );
\crcreg[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => crc_data_i(13),
      I1 => p_10_in,
      O => \crcreg[10]_i_2_n_0\
    );
\crcreg[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFF0096969696"
    )
        port map (
      I0 => \crcreg[11]_i_2_n_0\,
      I1 => crc_data_i(3),
      I2 => p_4_in,
      I3 => \crcreg[14]_i_2_n_0\,
      I4 => \crcreg[11]_i_3_n_0\,
      I5 => data_width,
      O => msg(11)
    );
\crcreg[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => crc_data_i(14),
      I1 => p_9_in,
      O => \crcreg[11]_i_2_n_0\
    );
\crcreg[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_12_in,
      I1 => crc_data_i(11),
      I2 => p_8_in,
      I3 => crc_data_i(15),
      O => \crcreg[11]_i_3_n_0\
    );
\crcreg[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A66A6AA66AA6A66A"
    )
        port map (
      I0 => \crcreg[12]_i_2_n_0\,
      I1 => data_width,
      I2 => p_11_in,
      I3 => crc_data_i(12),
      I4 => \crcreg[15]_i_3_n_0\,
      I5 => \crcreg[12]_i_3_n_0\,
      O => msg(12)
    );
\crcreg[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => p_3_in,
      I1 => crc_data_i(4),
      I2 => crc_data_i(15),
      I3 => p_8_in,
      I4 => \crcreg[13]_i_3_n_0\,
      O => \crcreg[12]_i_2_n_0\
    );
\crcreg[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => \crcreg_reg_n_0_[0]\,
      I1 => crc_data_i(0),
      I2 => crc_data_i(15),
      I3 => p_8_in,
      I4 => crc_data_i(11),
      I5 => p_12_in,
      O => \crcreg[12]_i_3_n_0\
    );
\crcreg[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2EE2E22EE22E2EE2"
    )
        port map (
      I0 => \crcreg[13]_i_2_n_0\,
      I1 => data_width,
      I2 => crc_data_i(13),
      I3 => p_10_in,
      I4 => \crcreg[13]_i_3_n_0\,
      I5 => \crcreg[13]_i_4_n_0\,
      O => msg(13)
    );
\crcreg[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => p_2_in,
      I1 => crc_data_i(5),
      I2 => crc_data_i(13),
      I3 => p_10_in,
      I4 => crc_data_i(9),
      I5 => p_14_in,
      O => \crcreg[13]_i_2_n_0\
    );
\crcreg[13]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \crcreg_reg_n_0_[8]\,
      I1 => crc_data_i(8),
      I2 => p_11_in,
      I3 => crc_data_i(12),
      O => \crcreg[13]_i_3_n_0\
    );
\crcreg[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[13]_i_2_n_0\,
      I1 => crc_data_i(12),
      I2 => p_11_in,
      I3 => crc_data_i(1),
      I4 => p_6_in,
      O => \crcreg[13]_i_4_n_0\
    );
\crcreg[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2EE2E22EE22E2EE2"
    )
        port map (
      I0 => \crcreg[14]_i_2_n_0\,
      I1 => data_width,
      I2 => crc_data_i(14),
      I3 => p_9_in,
      I4 => \crcreg[14]_i_3_n_0\,
      I5 => \crcreg[14]_i_4_n_0\,
      O => msg(14)
    );
\crcreg[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => p_1_in,
      I1 => crc_data_i(6),
      I2 => crc_data_i(14),
      I3 => p_9_in,
      I4 => crc_data_i(10),
      I5 => p_13_in,
      O => \crcreg[14]_i_2_n_0\
    );
\crcreg[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_14_in,
      I1 => crc_data_i(9),
      I2 => p_10_in,
      I3 => crc_data_i(13),
      O => \crcreg[14]_i_3_n_0\
    );
\crcreg[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[14]_i_2_n_0\,
      I1 => crc_data_i(13),
      I2 => p_10_in,
      I3 => crc_data_i(2),
      I4 => p_5_in,
      O => \crcreg[14]_i_4_n_0\
    );
\crcreg[15]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => tx_dst_rdy_crc,
      I1 => count(0),
      I2 => count(1),
      I3 => s_axi_tx_tvalid,
      I4 => new_pkt_r_reg,
      O => CRC_RESET
    );
\crcreg[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2EE2E22EE22E2EE2"
    )
        port map (
      I0 => \crcreg[15]_i_3_n_0\,
      I1 => data_width,
      I2 => crc_data_i(15),
      I3 => p_8_in,
      I4 => \crcreg[15]_i_4_n_0\,
      I5 => \crcreg[15]_i_5_n_0\,
      O => msg(15)
    );
\crcreg[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => p_0_in,
      I1 => crc_data_i(7),
      I2 => crc_data_i(15),
      I3 => p_8_in,
      I4 => crc_data_i(11),
      I5 => p_12_in,
      O => \crcreg[15]_i_3_n_0\
    );
\crcreg[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_13_in,
      I1 => crc_data_i(10),
      I2 => p_9_in,
      I3 => crc_data_i(14),
      O => \crcreg[15]_i_4_n_0\
    );
\crcreg[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[15]_i_3_n_0\,
      I1 => crc_data_i(14),
      I2 => p_9_in,
      I3 => crc_data_i(3),
      I4 => p_4_in,
      O => \crcreg[15]_i_5_n_0\
    );
\crcreg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14414114"
    )
        port map (
      I0 => data_width,
      I1 => p_14_in,
      I2 => crc_data_i(9),
      I3 => p_10_in,
      I4 => crc_data_i(13),
      I5 => \crcreg[1]_i_2_n_0\,
      O => msg(1)
    );
\crcreg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699600000000"
    )
        port map (
      I0 => p_6_in,
      I1 => crc_data_i(1),
      I2 => p_11_in,
      I3 => crc_data_i(12),
      I4 => \crcreg[13]_i_2_n_0\,
      I5 => data_width,
      O => \crcreg[1]_i_2_n_0\
    );
\crcreg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14414114"
    )
        port map (
      I0 => data_width,
      I1 => p_13_in,
      I2 => crc_data_i(10),
      I3 => p_9_in,
      I4 => crc_data_i(14),
      I5 => \crcreg[2]_i_2_n_0\,
      O => msg(2)
    );
\crcreg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699600000000"
    )
        port map (
      I0 => p_5_in,
      I1 => crc_data_i(2),
      I2 => p_10_in,
      I3 => crc_data_i(13),
      I4 => \crcreg[14]_i_2_n_0\,
      I5 => data_width,
      O => \crcreg[2]_i_2_n_0\
    );
\crcreg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14414114"
    )
        port map (
      I0 => data_width,
      I1 => p_12_in,
      I2 => crc_data_i(11),
      I3 => p_8_in,
      I4 => crc_data_i(15),
      I5 => \crcreg[3]_i_2_n_0\,
      O => msg(3)
    );
\crcreg[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8228288228828228"
    )
        port map (
      I0 => data_width,
      I1 => p_4_in,
      I2 => crc_data_i(3),
      I3 => p_9_in,
      I4 => crc_data_i(14),
      I5 => \crcreg[15]_i_3_n_0\,
      O => \crcreg[3]_i_2_n_0\
    );
\crcreg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => \crcreg[12]_i_2_n_0\,
      I1 => data_width,
      I2 => crc_data_i(12),
      I3 => p_11_in,
      O => msg(4)
    );
\crcreg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0660F660F66F066"
    )
        port map (
      I0 => \crcreg[10]_i_2_n_0\,
      I1 => \crcreg[13]_i_3_n_0\,
      I2 => \crcreg[13]_i_2_n_0\,
      I3 => data_width,
      I4 => \crcreg[12]_i_3_n_0\,
      I5 => \crcreg[12]_i_2_n_0\,
      O => msg(5)
    );
\crcreg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF9696FF009696"
    )
        port map (
      I0 => crc_data_i(14),
      I1 => p_9_in,
      I2 => \crcreg[14]_i_3_n_0\,
      I3 => \crcreg[14]_i_2_n_0\,
      I4 => data_width,
      I5 => \crcreg[13]_i_4_n_0\,
      O => msg(6)
    );
\crcreg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF9696FF009696"
    )
        port map (
      I0 => crc_data_i(15),
      I1 => p_8_in,
      I2 => \crcreg[15]_i_4_n_0\,
      I3 => \crcreg[15]_i_3_n_0\,
      I4 => data_width,
      I5 => \crcreg[14]_i_4_n_0\,
      O => msg(7)
    );
\crcreg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF9696FF009696"
    )
        port map (
      I0 => \crcreg[11]_i_3_n_0\,
      I1 => crc_data_i(0),
      I2 => \crcreg_reg_n_0_[0]\,
      I3 => \crcreg[13]_i_3_n_0\,
      I4 => data_width,
      I5 => \crcreg[15]_i_5_n_0\,
      O => msg(8)
    );
\crcreg[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFF0096969696"
    )
        port map (
      I0 => \crcreg[9]_i_2_n_0\,
      I1 => crc_data_i(1),
      I2 => p_6_in,
      I3 => \crcreg[12]_i_2_n_0\,
      I4 => \crcreg[14]_i_3_n_0\,
      I5 => data_width,
      O => msg(9)
    );
\crcreg[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => crc_data_i(12),
      I1 => p_11_in,
      O => \crcreg[9]_i_2_n_0\
    );
\crcreg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(0),
      Q => \crcreg_reg_n_0_[0]\,
      S => CRC_RESET
    );
\crcreg_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(10),
      Q => p_13_in,
      S => CRC_RESET
    );
\crcreg_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(11),
      Q => p_12_in,
      S => CRC_RESET
    );
\crcreg_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(12),
      Q => p_11_in,
      S => CRC_RESET
    );
\crcreg_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(13),
      Q => p_10_in,
      S => CRC_RESET
    );
\crcreg_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(14),
      Q => p_9_in,
      S => CRC_RESET
    );
\crcreg_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(15),
      Q => p_8_in,
      S => CRC_RESET
    );
\crcreg_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(1),
      Q => p_6_in,
      S => CRC_RESET
    );
\crcreg_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(2),
      Q => p_5_in,
      S => CRC_RESET
    );
\crcreg_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(3),
      Q => p_4_in,
      S => CRC_RESET
    );
\crcreg_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(4),
      Q => p_3_in,
      S => CRC_RESET
    );
\crcreg_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(5),
      Q => p_2_in,
      S => CRC_RESET
    );
\crcreg_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(6),
      Q => p_1_in,
      S => CRC_RESET
    );
\crcreg_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(7),
      Q => p_0_in,
      S => CRC_RESET
    );
\crcreg_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(8),
      Q => \crcreg_reg_n_0_[8]\,
      S => CRC_RESET
    );
\crcreg_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(9),
      Q => p_14_in,
      S => CRC_RESET
    );
data_valid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => tx_dst_rdy_crc,
      I1 => count(0),
      I2 => count(1),
      I3 => s_axi_tx_tvalid,
      O => \^crc_datavalid1\
    );
data_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_datavalid1\,
      Q => data_valid,
      R => '0'
    );
data_width_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7FF"
    )
        port map (
      I0 => \^crc_datavalid1\,
      I1 => s_axi_tx_tlast,
      I2 => s_axi_tx_tkeep(1),
      I3 => s_axi_tx_tkeep(0),
      O => CRC_DATAWIDTH1
    );
data_width_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC_DATAWIDTH1,
      Q => data_width,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_CRC_TOP_2 is
  port (
    p_13_in : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    crc_pass_fail_n : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    \count_reg[0]\ : in STD_LOGIC;
    CRC_RESET_r_reg : in STD_LOGIC;
    EOF_N_US_r : in STD_LOGIC;
    \count_reg[0]_0\ : in STD_LOGIC;
    rx_src_rdy_crc : in STD_LOGIC;
    ll_valid_r : in STD_LOGIC;
    SOF_N_US_r : in STD_LOGIC;
    rx_sof_crc : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \RX_REM_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \DATA_US_r_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_CRC_TOP_2 : entity is "merger_aurora_CRC_TOP";
end merger_aurora_merger_aurora_CRC_TOP_2;

architecture STRUCTURE of merger_aurora_merger_aurora_CRC_TOP_2 is
  signal CRC_DATAVALID : STD_LOGIC;
  signal CRC_RESET : STD_LOGIC;
  signal crc_data_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \crcreg[10]_i_2__0_n_0\ : STD_LOGIC;
  signal \crcreg[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \crcreg[11]_i_3__0_n_0\ : STD_LOGIC;
  signal \crcreg[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \crcreg[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \crcreg[13]_i_2__0_n_0\ : STD_LOGIC;
  signal \crcreg[13]_i_3__0_n_0\ : STD_LOGIC;
  signal \crcreg[13]_i_4__0_n_0\ : STD_LOGIC;
  signal \crcreg[14]_i_2__0_n_0\ : STD_LOGIC;
  signal \crcreg[14]_i_3__0_n_0\ : STD_LOGIC;
  signal \crcreg[14]_i_4__0_n_0\ : STD_LOGIC;
  signal \crcreg[15]_i_3__0_n_0\ : STD_LOGIC;
  signal \crcreg[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \crcreg[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \crcreg[5]_i_2_n_0\ : STD_LOGIC;
  signal \crcreg[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \crcreg_reg_n_0_[0]\ : STD_LOGIC;
  signal \crcreg_reg_n_0_[8]\ : STD_LOGIC;
  signal data_valid : STD_LOGIC;
  signal data_width : STD_LOGIC;
  signal msg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_10_in : STD_LOGIC;
  signal p_11_in : STD_LOGIC;
  signal p_12_in : STD_LOGIC;
  signal \^p_13_in\ : STD_LOGIC;
  signal p_13_in_0 : STD_LOGIC;
  signal p_14_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  signal p_6_in : STD_LOGIC;
  signal p_8_in : STD_LOGIC;
  signal p_9_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \crcreg[10]_i_2__0\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \crcreg[11]_i_3__0\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \crcreg[13]_i_2__0\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \crcreg[14]_i_2__0\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \crcreg[15]_i_3__0\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \crcreg[9]_i_2__0\ : label is "soft_lutpair81";
begin
  p_13_in <= \^p_13_in\;
\CRC_PASS_FAIL_N_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \crcreg_reg_n_0_[8]\,
      I1 => Q(15),
      O => S(1)
    );
\CRC_PASS_FAIL_N_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => Q(12),
      I1 => p_12_in,
      I2 => p_14_in,
      I3 => Q(14),
      I4 => p_13_in_0,
      I5 => Q(13),
      O => S(0)
    );
CRC_PASS_FAIL_N_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => Q(9),
      I1 => p_9_in,
      I2 => p_11_in,
      I3 => Q(11),
      I4 => p_10_in,
      I5 => Q(10),
      O => crc_pass_fail_n(3)
    );
CRC_PASS_FAIL_N_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => Q(6),
      I1 => p_6_in,
      I2 => p_8_in,
      I3 => Q(8),
      I4 => \crcreg_reg_n_0_[0]\,
      I5 => Q(7),
      O => crc_pass_fail_n(2)
    );
CRC_PASS_FAIL_N_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => Q(3),
      I1 => p_3_in,
      I2 => p_5_in,
      I3 => Q(5),
      I4 => p_4_in,
      I5 => Q(4),
      O => crc_pass_fail_n(1)
    );
CRC_PASS_FAIL_N_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000066006600000"
    )
        port map (
      I0 => Q(0),
      I1 => p_0_in,
      I2 => p_2_in,
      I3 => Q(2),
      I4 => p_1_in,
      I5 => Q(1),
      O => crc_pass_fail_n(0)
    );
\DATA_US_r[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg[0]_0\,
      I1 => rx_src_rdy_crc,
      O => \^p_13_in\
    );
\crc_data_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(7),
      Q => crc_data_i(0),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(13),
      Q => crc_data_i(10),
      R => '0'
    );
\crc_data_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(12),
      Q => crc_data_i(11),
      R => '0'
    );
\crc_data_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(11),
      Q => crc_data_i(12),
      R => '0'
    );
\crc_data_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(10),
      Q => crc_data_i(13),
      R => '0'
    );
\crc_data_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(9),
      Q => crc_data_i(14),
      R => '0'
    );
\crc_data_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(8),
      Q => crc_data_i(15),
      R => '0'
    );
\crc_data_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(6),
      Q => crc_data_i(1),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(5),
      Q => crc_data_i(2),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(4),
      Q => crc_data_i(3),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(3),
      Q => crc_data_i(4),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(2),
      Q => crc_data_i(5),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(1),
      Q => crc_data_i(6),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(0),
      Q => crc_data_i(7),
      R => \RX_REM_reg[0]\(0)
    );
\crc_data_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(15),
      Q => crc_data_i(8),
      R => '0'
    );
\crc_data_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg[15]\(14),
      Q => crc_data_i(9),
      R => '0'
    );
\crcreg[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
        port map (
      I0 => \crcreg[12]_i_3__0_n_0\,
      I1 => crc_data_i(0),
      I2 => \crcreg_reg_n_0_[0]\,
      I3 => \crcreg[11]_i_2__0_n_0\,
      I4 => data_width,
      I5 => \crcreg[13]_i_3__0_n_0\,
      O => msg(0)
    );
\crcreg[10]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \crcreg[13]_i_4__0_n_0\,
      I1 => \crcreg[15]_i_4__0_n_0\,
      I2 => data_width,
      I3 => \crcreg[10]_i_2__0_n_0\,
      I4 => p_5_in,
      I5 => crc_data_i(2),
      O => msg(10)
    );
\crcreg[10]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => crc_data_i(13),
      I1 => p_10_in,
      O => \crcreg[10]_i_2__0_n_0\
    );
\crcreg[11]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \crcreg[14]_i_4__0_n_0\,
      I1 => \crcreg[11]_i_2__0_n_0\,
      I2 => data_width,
      I3 => \crcreg[11]_i_3__0_n_0\,
      I4 => p_4_in,
      I5 => crc_data_i(3),
      O => msg(11)
    );
\crcreg[11]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_8_in,
      I1 => crc_data_i(15),
      I2 => p_12_in,
      I3 => crc_data_i(11),
      O => \crcreg[11]_i_2__0_n_0\
    );
\crcreg[11]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => crc_data_i(14),
      I1 => p_9_in,
      O => \crcreg[11]_i_3__0_n_0\
    );
\crcreg[12]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669FFFF69960000"
    )
        port map (
      I0 => \crcreg[12]_i_2__0_n_0\,
      I1 => crc_data_i(12),
      I2 => p_11_in,
      I3 => \crcreg[15]_i_5__0_n_0\,
      I4 => data_width,
      I5 => \crcreg[12]_i_3__0_n_0\,
      O => msg(12)
    );
\crcreg[12]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => crc_data_i(11),
      I1 => p_12_in,
      I2 => crc_data_i(15),
      I3 => p_8_in,
      I4 => \crcreg_reg_n_0_[0]\,
      I5 => crc_data_i(0),
      O => \crcreg[12]_i_2__0_n_0\
    );
\crcreg[12]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[13]_i_3__0_n_0\,
      I1 => crc_data_i(4),
      I2 => p_3_in,
      I3 => crc_data_i(15),
      I4 => p_8_in,
      O => \crcreg[12]_i_3__0_n_0\
    );
\crcreg[13]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
        port map (
      I0 => \crcreg[13]_i_2__0_n_0\,
      I1 => crc_data_i(13),
      I2 => p_10_in,
      I3 => \crcreg[13]_i_3__0_n_0\,
      I4 => data_width,
      I5 => \crcreg[13]_i_4__0_n_0\,
      O => msg(13)
    );
\crcreg[13]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[13]_i_4__0_n_0\,
      I1 => crc_data_i(1),
      I2 => p_6_in,
      I3 => crc_data_i(12),
      I4 => p_11_in,
      O => \crcreg[13]_i_2__0_n_0\
    );
\crcreg[13]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_11_in,
      I1 => crc_data_i(12),
      I2 => \crcreg_reg_n_0_[8]\,
      I3 => crc_data_i(8),
      O => \crcreg[13]_i_3__0_n_0\
    );
\crcreg[13]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => crc_data_i(9),
      I1 => p_14_in,
      I2 => crc_data_i(13),
      I3 => p_10_in,
      I4 => p_2_in,
      I5 => crc_data_i(5),
      O => \crcreg[13]_i_4__0_n_0\
    );
\crcreg[14]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
        port map (
      I0 => \crcreg[14]_i_2__0_n_0\,
      I1 => crc_data_i(14),
      I2 => p_9_in,
      I3 => \crcreg[14]_i_3__0_n_0\,
      I4 => data_width,
      I5 => \crcreg[14]_i_4__0_n_0\,
      O => msg(14)
    );
\crcreg[14]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[14]_i_4__0_n_0\,
      I1 => crc_data_i(2),
      I2 => p_5_in,
      I3 => crc_data_i(13),
      I4 => p_10_in,
      O => \crcreg[14]_i_2__0_n_0\
    );
\crcreg[14]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_10_in,
      I1 => crc_data_i(13),
      I2 => p_14_in,
      I3 => crc_data_i(9),
      O => \crcreg[14]_i_3__0_n_0\
    );
\crcreg[14]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => crc_data_i(10),
      I1 => p_13_in_0,
      I2 => crc_data_i(14),
      I3 => p_9_in,
      I4 => p_1_in,
      I5 => crc_data_i(6),
      O => \crcreg[14]_i_4__0_n_0\
    );
\crcreg[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000A000A333F000A"
    )
        port map (
      I0 => CRC_RESET_r_reg,
      I1 => EOF_N_US_r,
      I2 => \count_reg[0]_0\,
      I3 => rx_src_rdy_crc,
      I4 => ll_valid_r,
      I5 => SOF_N_US_r,
      O => CRC_RESET
    );
\crcreg[15]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
        port map (
      I0 => \crcreg[15]_i_3__0_n_0\,
      I1 => crc_data_i(15),
      I2 => p_8_in,
      I3 => \crcreg[15]_i_4__0_n_0\,
      I4 => data_width,
      I5 => \crcreg[15]_i_5__0_n_0\,
      O => msg(15)
    );
\crcreg[15]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \crcreg[15]_i_5__0_n_0\,
      I1 => crc_data_i(3),
      I2 => p_4_in,
      I3 => crc_data_i(14),
      I4 => p_9_in,
      O => \crcreg[15]_i_3__0_n_0\
    );
\crcreg[15]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => p_9_in,
      I1 => crc_data_i(14),
      I2 => p_13_in_0,
      I3 => crc_data_i(10),
      O => \crcreg[15]_i_4__0_n_0\
    );
\crcreg[15]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => crc_data_i(11),
      I1 => p_12_in,
      I2 => crc_data_i(15),
      I3 => p_8_in,
      I4 => p_0_in,
      I5 => crc_data_i(7),
      O => \crcreg[15]_i_5__0_n_0\
    );
\crcreg[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B88BB88B8BB8"
    )
        port map (
      I0 => \crcreg[13]_i_2__0_n_0\,
      I1 => data_width,
      I2 => p_10_in,
      I3 => crc_data_i(13),
      I4 => p_14_in,
      I5 => crc_data_i(9),
      O => msg(1)
    );
\crcreg[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B88BB88B8BB8"
    )
        port map (
      I0 => \crcreg[14]_i_2__0_n_0\,
      I1 => data_width,
      I2 => p_9_in,
      I3 => crc_data_i(14),
      I4 => p_13_in_0,
      I5 => crc_data_i(10),
      O => msg(2)
    );
\crcreg[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B88BB88B8BB8"
    )
        port map (
      I0 => \crcreg[15]_i_3__0_n_0\,
      I1 => data_width,
      I2 => p_8_in,
      I3 => crc_data_i(15),
      I4 => p_12_in,
      I5 => crc_data_i(11),
      O => msg(3)
    );
\crcreg[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => \crcreg[12]_i_3__0_n_0\,
      I1 => data_width,
      I2 => crc_data_i(12),
      I3 => p_11_in,
      O => msg(4)
    );
\crcreg[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96FF9600"
    )
        port map (
      I0 => \crcreg[12]_i_2__0_n_0\,
      I1 => \crcreg[12]_i_3__0_n_0\,
      I2 => \crcreg[13]_i_4__0_n_0\,
      I3 => data_width,
      I4 => \crcreg[5]_i_2_n_0\,
      O => msg(5)
    );
\crcreg[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => crc_data_i(8),
      I1 => \crcreg_reg_n_0_[8]\,
      I2 => crc_data_i(12),
      I3 => p_11_in,
      I4 => p_10_in,
      I5 => crc_data_i(13),
      O => \crcreg[5]_i_2_n_0\
    );
\crcreg[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \crcreg[13]_i_2__0_n_0\,
      I1 => \crcreg[14]_i_4__0_n_0\,
      I2 => data_width,
      I3 => \crcreg[14]_i_3__0_n_0\,
      I4 => p_9_in,
      I5 => crc_data_i(14),
      O => msg(6)
    );
\crcreg[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \crcreg[14]_i_2__0_n_0\,
      I1 => \crcreg[15]_i_5__0_n_0\,
      I2 => data_width,
      I3 => \crcreg[15]_i_4__0_n_0\,
      I4 => p_8_in,
      I5 => crc_data_i(15),
      O => msg(7)
    );
\crcreg[8]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \crcreg[15]_i_3__0_n_0\,
      I1 => \crcreg[13]_i_3__0_n_0\,
      I2 => data_width,
      I3 => \crcreg[11]_i_2__0_n_0\,
      I4 => \crcreg_reg_n_0_[0]\,
      I5 => crc_data_i(0),
      O => msg(8)
    );
\crcreg[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \crcreg[12]_i_3__0_n_0\,
      I1 => \crcreg[14]_i_3__0_n_0\,
      I2 => data_width,
      I3 => \crcreg[9]_i_2__0_n_0\,
      I4 => p_6_in,
      I5 => crc_data_i(1),
      O => msg(9)
    );
\crcreg[9]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => crc_data_i(12),
      I1 => p_11_in,
      O => \crcreg[9]_i_2__0_n_0\
    );
\crcreg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(0),
      Q => \crcreg_reg_n_0_[0]\,
      S => CRC_RESET
    );
\crcreg_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(10),
      Q => p_13_in_0,
      S => CRC_RESET
    );
\crcreg_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(11),
      Q => p_12_in,
      S => CRC_RESET
    );
\crcreg_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(12),
      Q => p_11_in,
      S => CRC_RESET
    );
\crcreg_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(13),
      Q => p_10_in,
      S => CRC_RESET
    );
\crcreg_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(14),
      Q => p_9_in,
      S => CRC_RESET
    );
\crcreg_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(15),
      Q => p_8_in,
      S => CRC_RESET
    );
\crcreg_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(1),
      Q => p_6_in,
      S => CRC_RESET
    );
\crcreg_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(2),
      Q => p_5_in,
      S => CRC_RESET
    );
\crcreg_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(3),
      Q => p_4_in,
      S => CRC_RESET
    );
\crcreg_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(4),
      Q => p_3_in,
      S => CRC_RESET
    );
\crcreg_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(5),
      Q => p_2_in,
      S => CRC_RESET
    );
\crcreg_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(6),
      Q => p_1_in,
      S => CRC_RESET
    );
\crcreg_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(7),
      Q => p_0_in,
      S => CRC_RESET
    );
\crcreg_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(8),
      Q => \crcreg_reg_n_0_[8]\,
      S => CRC_RESET
    );
\crcreg_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => data_valid,
      D => msg(9),
      Q => p_14_in,
      S => CRC_RESET
    );
\data_valid_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80A0"
    )
        port map (
      I0 => rx_sof_crc,
      I1 => EOF_N_US_r,
      I2 => \^p_13_in\,
      I3 => ll_valid_r,
      O => CRC_DATAVALID
    );
data_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC_DATAVALID,
      Q => data_valid,
      R => '0'
    );
data_width_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \count_reg[0]\,
      Q => data_width,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_ERR_DETECT is
  port (
    hard_err_flop_r_reg_0 : out STD_LOGIC;
    hard_err_reset_i : out STD_LOGIC;
    hard_err_i : out STD_LOGIC;
    CHANNEL_SOFT_ERR_reg : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    hard_err_flop_r0 : in STD_LOGIC;
    gtrxreset_o_reg_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_ERR_DETECT : entity is "merger_aurora_ERR_DETECT";
end merger_aurora_merger_aurora_ERR_DETECT;

architecture STRUCTURE of merger_aurora_merger_aurora_ERR_DETECT is
  signal bucket_full_r_n_0 : STD_LOGIC;
  signal \count_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \good_count_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \good_count_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \^hard_err_reset_i\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \good_count_r[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of soft_err_r_reg_srl3_i_1 : label is "soft_lutpair0";
begin
  hard_err_reset_i <= \^hard_err_reset_i\;
HARD_ERR_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^hard_err_reset_i\,
      Q => hard_err_i,
      R => SR(0)
    );
bucket_full_r: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA888808880000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(3),
      I3 => p_0_in(2),
      I4 => p_0_in(4),
      I5 => p_0_in(5),
      O => bucket_full_r_n_0
    );
bucket_full_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => bucket_full_r_n_0,
      Q => hard_err_flop_r_reg_0,
      R => SR(0)
    );
\count_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFAFFF2FAA0A0"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      I2 => p_0_in(5),
      I3 => p_0_in(3),
      I4 => p_0_in(4),
      I5 => p_0_in(1),
      O => \count_r[0]_i_1_n_0\
    );
\count_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFCC0CFC5CFFCF0"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => p_0_in(5),
      I3 => p_0_in(3),
      I4 => p_0_in(4),
      I5 => p_0_in(0),
      O => \count_r[1]_i_1_n_0\
    );
\count_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \count_r[0]_i_1_n_0\,
      Q => p_0_in(1),
      R => SR(0)
    );
\count_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \count_r[1]_i_1_n_0\,
      Q => p_0_in(0),
      R => SR(0)
    );
\good_count_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => p_0_in(4),
      I1 => p_0_in(3),
      I2 => p_0_in(5),
      O => \good_count_r[0]_i_1_n_0\
    );
\good_count_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => p_0_in(4),
      I1 => p_0_in(5),
      I2 => p_0_in(2),
      O => \good_count_r[1]_i_1_n_0\
    );
\good_count_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \good_count_r[0]_i_1_n_0\,
      Q => p_0_in(3),
      R => SR(0)
    );
\good_count_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \good_count_r[1]_i_1_n_0\,
      Q => p_0_in(2),
      R => SR(0)
    );
hard_err_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => hard_err_flop_r0,
      Q => \^hard_err_reset_i\,
      R => SR(0)
    );
\soft_err_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_o_reg_0(1),
      Q => p_0_in(5),
      R => SR(0)
    );
\soft_err_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_o_reg_0(0),
      Q => p_0_in(4),
      R => SR(0)
    );
soft_err_r_reg_srl3_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in(4),
      I1 => p_0_in(5),
      O => CHANNEL_SOFT_ERR_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_IDLE_AND_VER_GEN is
  port (
    \gen_v_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_a_i : out STD_LOGIC;
    \gen_k_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_r_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txver_count_r0 : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    gen_ver_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_IDLE_AND_VER_GEN : entity is "merger_aurora_IDLE_AND_VER_GEN";
end merger_aurora_merger_aurora_IDLE_AND_VER_GEN;

architecture STRUCTURE of merger_aurora_merger_aurora_IDLE_AND_VER_GEN is
  signal did_ver_i : STD_LOGIC;
  signal \downcounter_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[3]\ : STD_LOGIC;
  signal gen_a_flop_c : STD_LOGIC;
  signal gen_k_flop_c_0 : STD_LOGIC;
  signal gen_k_flop_c_1 : STD_LOGIC;
  signal gen_r_flop_c_0 : STD_LOGIC;
  signal gen_r_flop_c_1 : STD_LOGIC;
  signal gen_v_flop_c_0 : STD_LOGIC;
  signal gen_ver_word_1_r : STD_LOGIC;
  signal insert_ver_c : STD_LOGIC;
  signal lfsr_last_flop_r : STD_LOGIC;
  signal \lfsr_shift_register_r_reg[2]_srl3_n_0\ : STD_LOGIC;
  signal lfsr_taps_c : STD_LOGIC;
  signal lfsr_taps_r : STD_LOGIC;
  signal prev_cycle_gen_ver_r : STD_LOGIC;
  signal recycle_gen_ver_c : STD_LOGIC;
  signal ver_counter_r_1 : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gen_a_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gen_a_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_1_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_1_i : label is "FD";
  attribute BOX_TYPE of gen_v_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_0_i : label is "FD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of gen_v_flop_0_i_i_1 : label is "soft_lutpair36";
  attribute BOX_TYPE of gen_v_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_1_i : label is "FD";
  attribute SOFT_HLUTNM of gen_v_flop_1_i_i_1 : label is "soft_lutpair35";
  attribute BOX_TYPE of lfsr_last_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of lfsr_last_flop_i : label is "FDR";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \lfsr_shift_register_r_reg[2]_srl3\ : label is "inst/\merger_aurora_core_i/global_logic_i/idle_and_ver_gen_i/lfsr_shift_register_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \lfsr_shift_register_r_reg[2]_srl3\ : label is "inst/\merger_aurora_core_i/global_logic_i/idle_and_ver_gen_i/lfsr_shift_register_r_reg[2]_srl3 ";
  attribute BOX_TYPE of lfsr_taps_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of lfsr_taps_i : label is "FDR";
  attribute SOFT_HLUTNM of \txver_count_r_reg[6]_srl7_i_1\ : label is "soft_lutpair36";
  attribute BOX_TYPE of ver_counter_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of ver_counter_0_i : label is "SRL16";
  attribute srl_name of ver_counter_0_i : label is "inst/\merger_aurora_core_i/global_logic_i/idle_and_ver_gen_i/ver_counter_0_i ";
  attribute SOFT_HLUTNM of ver_counter_0_i_i_1 : label is "soft_lutpair35";
  attribute BOX_TYPE of ver_counter_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of ver_counter_1_i : label is "SRL16";
  attribute srl_name of ver_counter_1_i : label is "inst/\merger_aurora_core_i/global_logic_i/idle_and_ver_gen_i/ver_counter_1_i ";
begin
\downcounter_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FE01"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[2]\,
      I1 => \downcounter_r_reg_n_0_[3]\,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      I4 => SYSTEM_RESET_reg(0),
      O => \downcounter_r[0]_i_1_n_0\
    );
\downcounter_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF0000E"
    )
        port map (
      I0 => lfsr_taps_r,
      I1 => \downcounter_r_reg_n_0_[0]\,
      I2 => \downcounter_r_reg_n_0_[2]\,
      I3 => \downcounter_r_reg_n_0_[3]\,
      I4 => \downcounter_r_reg_n_0_[1]\,
      I5 => SYSTEM_RESET_reg(0),
      O => \downcounter_r[1]_i_1_n_0\
    );
\downcounter_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F00FF00E"
    )
        port map (
      I0 => gen_k_flop_c_0,
      I1 => \downcounter_r_reg_n_0_[0]\,
      I2 => \downcounter_r_reg_n_0_[2]\,
      I3 => \downcounter_r_reg_n_0_[3]\,
      I4 => \downcounter_r_reg_n_0_[1]\,
      I5 => SYSTEM_RESET_reg(0),
      O => \downcounter_r[2]_i_1_n_0\
    );
\downcounter_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033333332"
    )
        port map (
      I0 => lfsr_last_flop_r,
      I1 => \downcounter_r_reg_n_0_[3]\,
      I2 => \downcounter_r_reg_n_0_[0]\,
      I3 => \downcounter_r_reg_n_0_[2]\,
      I4 => \downcounter_r_reg_n_0_[1]\,
      I5 => SYSTEM_RESET_reg(0),
      O => \downcounter_r[3]_i_1_n_0\
    );
\downcounter_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \downcounter_r[0]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[0]\,
      R => '0'
    );
\downcounter_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \downcounter_r[1]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[1]\,
      R => '0'
    );
\downcounter_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \downcounter_r[2]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[2]\,
      R => '0'
    );
\downcounter_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \downcounter_r[3]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[3]\,
      R => '0'
    );
gen_a_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_a_flop_c,
      Q => gen_a_i,
      R => '0'
    );
gen_a_flop_0_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[0]\,
      I1 => \downcounter_r_reg_n_0_[2]\,
      I2 => \downcounter_r_reg_n_0_[3]\,
      I3 => \downcounter_r_reg_n_0_[1]\,
      I4 => gen_ver_word_1_r,
      O => gen_a_flop_c
    );
gen_k_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_k_flop_c_1,
      Q => \gen_k_r_reg[0]\(1),
      R => '0'
    );
gen_k_flop_0_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[1]\,
      I1 => \downcounter_r_reg_n_0_[3]\,
      I2 => \downcounter_r_reg_n_0_[2]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      I4 => lfsr_taps_r,
      I5 => gen_ver_word_1_r,
      O => gen_k_flop_c_1
    );
gen_k_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_k_flop_c_0,
      Q => \gen_k_r_reg[0]\(0),
      R => '0'
    );
gen_r_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_r_flop_c_1,
      Q => \gen_r_r_reg[0]\(1),
      R => '0'
    );
gen_r_flop_0_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111111110"
    )
        port map (
      I0 => lfsr_taps_r,
      I1 => gen_ver_word_1_r,
      I2 => \downcounter_r_reg_n_0_[0]\,
      I3 => \downcounter_r_reg_n_0_[2]\,
      I4 => \downcounter_r_reg_n_0_[3]\,
      I5 => \downcounter_r_reg_n_0_[1]\,
      O => gen_r_flop_c_1
    );
gen_r_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_r_flop_c_0,
      Q => \gen_r_r_reg[0]\(0),
      R => '0'
    );
gen_r_flop_1_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gen_k_flop_c_0,
      O => gen_r_flop_c_0
    );
gen_v_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => recycle_gen_ver_c,
      Q => \gen_v_r_reg[0]\(1),
      R => '0'
    );
gen_v_flop_0_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => did_ver_i,
      I1 => gen_ver_i,
      O => recycle_gen_ver_c
    );
gen_v_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_v_flop_c_0,
      Q => \gen_v_r_reg[0]\(0),
      R => '0'
    );
gen_v_flop_1_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => gen_ver_word_1_r,
      I1 => did_ver_i,
      I2 => gen_ver_i,
      O => gen_v_flop_c_0
    );
gen_ver_word_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_ver_word_1_r,
      Q => did_ver_i,
      R => '0'
    );
lfsr_last_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_k_flop_c_0,
      Q => lfsr_last_flop_r,
      R => SYSTEM_RESET_reg(0)
    );
\lfsr_shift_register_r_reg[2]_srl3\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => lfsr_taps_r,
      Q => \lfsr_shift_register_r_reg[2]_srl3_n_0\
    );
\lfsr_shift_register_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \lfsr_shift_register_r_reg[2]_srl3_n_0\,
      Q => gen_k_flop_c_0,
      R => '0'
    );
lfsr_taps_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => lfsr_taps_c,
      Q => lfsr_taps_r,
      R => SYSTEM_RESET_reg(0)
    );
lfsr_taps_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => lfsr_last_flop_r,
      I1 => gen_k_flop_c_0,
      O => lfsr_taps_c
    );
prev_cycle_gen_ver_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_ver_i,
      Q => prev_cycle_gen_ver_r,
      R => '0'
    );
\txver_count_r_reg[6]_srl7_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => did_ver_i,
      I1 => gen_ver_i,
      O => txver_count_r0
    );
ver_counter_0_i: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => insert_ver_c,
      Q => ver_counter_r_1
    );
ver_counter_0_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B0"
    )
        port map (
      I0 => did_ver_i,
      I1 => prev_cycle_gen_ver_r,
      I2 => gen_ver_i,
      O => insert_ver_c
    );
ver_counter_1_i: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => ver_counter_r_1,
      Q => gen_ver_word_1_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_LANE_INIT_SM is
  port (
    ready_r : out STD_LOGIC;
    ack_r : out STD_LOGIC;
    lane_up : out STD_LOGIC;
    realign_r_reg_0 : out STD_LOGIC;
    reset_count_r_reg_0 : out STD_LOGIC;
    hard_err_flop_r_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    rx_polarity_i : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_spa_data_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    gen_k_i : out STD_LOGIC;
    left_aligned_r_reg : out STD_LOGIC;
    counter4_r0 : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    counter3_r0 : in STD_LOGIC;
    \gen_spa_data_r_reg[1]\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ready_r_reg0 : in STD_LOGIC;
    RX_NEG : in STD_LOGIC;
    rx_realign_i : in STD_LOGIC;
    rst_r_reg_0 : in STD_LOGIC;
    first_v_received_r : in STD_LOGIC;
    gtrxreset_o_reg_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_LANE_INIT_SM : entity is "merger_aurora_LANE_INIT_SM";
end merger_aurora_merger_aurora_LANE_INIT_SM;

architecture STRUCTURE of merger_aurora_merger_aurora_LANE_INIT_SM is
  signal ENABLE_ERR_DETECT0 : STD_LOGIC;
  signal RX_CHAR_IS_COMMA_R : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^ack_r\ : STD_LOGIC;
  signal ack_r_i_2_n_0 : STD_LOGIC;
  signal begin_r : STD_LOGIC;
  signal begin_r_i_2_n_0 : STD_LOGIC;
  signal comma_over_two_cycles_r : STD_LOGIC;
  signal comma_over_two_cycles_r0 : STD_LOGIC;
  signal count_128d_done_r : STD_LOGIC;
  signal count_32d_done_r : STD_LOGIC;
  signal count_8d_done_r : STD_LOGIC;
  signal counter1_r0 : STD_LOGIC;
  signal \counter1_r[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter2_r_reg[14]_srl14_n_0\ : STD_LOGIC;
  signal \counter2_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \counter3_r_reg[2]_srl3_n_0\ : STD_LOGIC;
  signal \counter3_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter4_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \counter4_r_reg_n_0_[15]\ : STD_LOGIC;
  signal counter5_r0 : STD_LOGIC;
  signal \counter5_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \counter5_r_reg_n_0_[15]\ : STD_LOGIC;
  signal do_watchdog_count_r : STD_LOGIC;
  signal do_watchdog_count_r0 : STD_LOGIC;
  signal inc_count_c : STD_LOGIC;
  signal inc_count_c1 : STD_LOGIC;
  signal next_ack_c : STD_LOGIC;
  signal next_ack_c16_in : STD_LOGIC;
  signal next_align_c : STD_LOGIC;
  signal next_begin_c : STD_LOGIC;
  signal next_polarity_c : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_realign_c : STD_LOGIC;
  signal next_rst_c : STD_LOGIC;
  signal odd_word_r : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal polarity_r : STD_LOGIC;
  signal prev_char_was_comma_r : STD_LOGIC;
  signal prev_count_128d_done_r : STD_LOGIC;
  signal \^ready_r\ : STD_LOGIC;
  signal realign_r : STD_LOGIC;
  signal \^realign_r_reg_0\ : STD_LOGIC;
  signal reset_count_r : STD_LOGIC;
  signal reset_count_r0 : STD_LOGIC;
  signal \^reset_count_r_reg_0\ : STD_LOGIC;
  signal \^rx_polarity_i\ : STD_LOGIC;
  signal rx_polarity_r_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ENABLE_ERR_DETECT_inv_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of align_r_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of begin_r_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of comma_over_two_cycles_r_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter1_r[0]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter1_r[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter1_r[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter1_r[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter1_r[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter1_r[6]_i_1\ : label is "soft_lutpair7";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \counter2_r_reg[14]_srl14\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter2_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \counter2_r_reg[14]_srl14\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter2_r_reg[14]_srl14 ";
  attribute srl_bus_name of \counter3_r_reg[2]_srl3\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter3_r_reg ";
  attribute srl_name of \counter3_r_reg[2]_srl3\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter3_r_reg[2]_srl3 ";
  attribute srl_bus_name of \counter4_r_reg[14]_srl15\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter4_r_reg ";
  attribute srl_name of \counter4_r_reg[14]_srl15\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter4_r_reg[14]_srl15 ";
  attribute srl_bus_name of \counter5_r_reg[14]_srl15\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter5_r_reg ";
  attribute srl_name of \counter5_r_reg[14]_srl15\ : label is "inst/\merger_aurora_core_i/aurora_lane_0_i/lane_init_sm_i/counter5_r_reg[14]_srl15 ";
  attribute SOFT_HLUTNM of gen_k_fsm_r_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gen_sp_data_r[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gen_sp_data_r[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gen_spa_data_r[0]_i_1\ : label is "soft_lutpair8";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of lane_up_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of lane_up_flop_i : label is "FDR";
  attribute SOFT_HLUTNM of prev_char_was_comma_r_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of rst_r_i_1 : label is "soft_lutpair2";
begin
  ack_r <= \^ack_r\;
  ready_r <= \^ready_r\;
  realign_r_reg_0 <= \^realign_r_reg_0\;
  reset_count_r_reg_0 <= \^reset_count_r_reg_0\;
  rx_polarity_i <= \^rx_polarity_i\;
ENABLE_ERR_DETECT_inv_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^ack_r\,
      I1 => \^ready_r\,
      O => ENABLE_ERR_DETECT0
    );
ENABLE_ERR_DETECT_reg_inv: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => ENABLE_ERR_DETECT0,
      Q => hard_err_flop_r_reg(0),
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_o_reg_0(0),
      Q => RX_CHAR_IS_COMMA_R(0),
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_o_reg_0(1),
      Q => RX_CHAR_IS_COMMA_R(1),
      R => '0'
    );
ack_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808080808FF0808"
    )
        port map (
      I0 => ack_r_i_2_n_0,
      I1 => \^ack_r\,
      I2 => \counter5_r_reg_n_0_[15]\,
      I3 => RX_NEG,
      I4 => polarity_r,
      I5 => odd_word_r,
      O => next_ack_c
    );
ack_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \counter3_r_reg_n_0_[3]\,
      I1 => \counter2_r_reg_n_0_[15]\,
      O => ack_r_i_2_n_0
    );
ack_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_ack_c,
      Q => \^ack_r\,
      R => ready_r_reg0
    );
align_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => count_128d_done_r,
      I1 => \^realign_r_reg_0\,
      I2 => \^reset_count_r_reg_0\,
      I3 => count_8d_done_r,
      O => next_align_c
    );
align_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_align_c,
      Q => \^realign_r_reg_0\,
      R => ready_r_reg0
    );
begin_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \counter5_r_reg_n_0_[15]\,
      I1 => \^ack_r\,
      I2 => polarity_r,
      I3 => RX_NEG,
      I4 => begin_r_i_2_n_0,
      O => next_begin_c
    );
begin_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^ready_r\,
      I1 => \counter4_r_reg_n_0_[15]\,
      I2 => realign_r,
      I3 => rx_realign_i,
      O => begin_r_i_2_n_0
    );
begin_r_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_begin_c,
      Q => begin_r,
      S => ready_r_reg0
    );
comma_over_two_cycles_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56FF"
    )
        port map (
      I0 => prev_char_was_comma_r,
      I1 => RX_CHAR_IS_COMMA_R(1),
      I2 => RX_CHAR_IS_COMMA_R(0),
      I3 => \^realign_r_reg_0\,
      O => comma_over_two_cycles_r0
    );
comma_over_two_cycles_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => comma_over_two_cycles_r0,
      Q => comma_over_two_cycles_r,
      R => '0'
    );
\counter1_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => reset_count_r,
      I1 => \^ready_r\,
      O => counter1_r0
    );
\counter1_r[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => RX_CHAR_IS_COMMA_R(0),
      I1 => RX_CHAR_IS_COMMA_R(1),
      I2 => \^realign_r_reg_0\,
      O => inc_count_c
    );
\counter1_r[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[1]\,
      I1 => \counter1_r[0]_i_4_n_0\,
      I2 => count_128d_done_r,
      O => p_0_in(7)
    );
\counter1_r[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => count_32d_done_r,
      I1 => \counter1_r_reg_n_0_[5]\,
      I2 => \counter1_r_reg_n_0_[6]\,
      I3 => \counter1_r_reg_n_0_[7]\,
      I4 => count_8d_done_r,
      I5 => \counter1_r_reg_n_0_[3]\,
      O => \counter1_r[0]_i_4_n_0\
    );
\counter1_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \counter1_r[0]_i_4_n_0\,
      I1 => \counter1_r_reg_n_0_[1]\,
      O => p_0_in(6)
    );
\counter1_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[5]\,
      I1 => \counter1_r_reg_n_0_[6]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => count_8d_done_r,
      I4 => \counter1_r_reg_n_0_[3]\,
      I5 => count_32d_done_r,
      O => p_0_in(5)
    );
\counter1_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => \counter1_r_reg_n_0_[7]\,
      I2 => \counter1_r_reg_n_0_[6]\,
      I3 => \counter1_r_reg_n_0_[5]\,
      I4 => \counter1_r_reg_n_0_[3]\,
      O => p_0_in(4)
    );
\counter1_r[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[5]\,
      I1 => \counter1_r_reg_n_0_[6]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => count_8d_done_r,
      O => p_0_in(3)
    );
\counter1_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      I1 => \counter1_r_reg_n_0_[6]\,
      I2 => \counter1_r_reg_n_0_[5]\,
      O => p_0_in(2)
    );
\counter1_r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      I1 => \counter1_r_reg_n_0_[6]\,
      O => p_0_in(1)
    );
\counter1_r[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      O => p_0_in(0)
    );
\counter1_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(7),
      Q => count_128d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(6),
      Q => \counter1_r_reg_n_0_[1]\,
      R => counter1_r0
    );
\counter1_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(5),
      Q => count_32d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(4),
      Q => \counter1_r_reg_n_0_[3]\,
      R => counter1_r0
    );
\counter1_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(3),
      Q => count_8d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(2),
      Q => \counter1_r_reg_n_0_[5]\,
      R => counter1_r0
    );
\counter1_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(1),
      Q => \counter1_r_reg_n_0_[6]\,
      R => counter1_r0
    );
\counter1_r_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => inc_count_c,
      D => p_0_in(0),
      Q => \counter1_r_reg_n_0_[7]\,
      S => counter1_r0
    );
\counter2_r_reg[14]_srl14\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => \gen_spa_data_r_reg[1]\,
      Q => \counter2_r_reg[14]_srl14_n_0\
    );
\counter2_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \counter2_r_reg[14]_srl14_n_0\,
      Q => \counter2_r_reg_n_0_[15]\,
      R => '0'
    );
\counter3_r_reg[2]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => counter3_r0,
      CLK => gtrxreset_o_reg,
      D => \^ack_r\,
      Q => \counter3_r_reg[2]_srl3_n_0\
    );
\counter3_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => counter3_r0,
      D => \counter3_r_reg[2]_srl3_n_0\,
      Q => \counter3_r_reg_n_0_[3]\,
      R => '0'
    );
\counter4_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => counter4_r0,
      CLK => gtrxreset_o_reg,
      D => \^ready_r\,
      Q => \counter4_r_reg[14]_srl15_n_0\
    );
\counter4_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => counter4_r0,
      D => \counter4_r_reg[14]_srl15_n_0\,
      Q => \counter4_r_reg_n_0_[15]\,
      R => '0'
    );
\counter5_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => counter5_r0,
      CLK => gtrxreset_o_reg,
      D => \^ack_r\,
      Q => \counter5_r_reg[14]_srl15_n_0\
    );
\counter5_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => do_watchdog_count_r,
      I1 => \^ack_r\,
      O => counter5_r0
    );
\counter5_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => counter5_r0,
      D => \counter5_r_reg[14]_srl15_n_0\,
      Q => \counter5_r_reg_n_0_[15]\,
      R => '0'
    );
do_watchdog_count_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count_128d_done_r,
      I1 => prev_count_128d_done_r,
      O => do_watchdog_count_r0
    );
do_watchdog_count_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => do_watchdog_count_r0,
      Q => do_watchdog_count_r,
      R => '0'
    );
gen_k_fsm_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B0"
    )
        port map (
      I0 => \^ack_r\,
      I1 => \^ready_r\,
      I2 => odd_word_r,
      O => gen_k_i
    );
\gen_sp_data_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^ready_r\,
      I1 => \^ack_r\,
      I2 => odd_word_r,
      O => D(1)
    );
\gen_sp_data_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^ready_r\,
      I1 => \^ack_r\,
      O => D(0)
    );
\gen_spa_data_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^ack_r\,
      I1 => odd_word_r,
      O => gen_spa_data_i(0)
    );
lane_up_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^ready_r\,
      Q => lane_up,
      R => SR(0)
    );
left_aligned_r_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14141400"
    )
        port map (
      I0 => first_v_received_r,
      I1 => gtrxreset_o_reg_0(1),
      I2 => gtrxreset_o_reg_0(0),
      I3 => \^ready_r\,
      I4 => \^realign_r_reg_0\,
      O => left_aligned_r_reg
    );
odd_word_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => odd_word_r,
      O => next_ack_c16_in
    );
odd_word_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_ack_c16_in,
      Q => odd_word_r,
      R => '0'
    );
polarity_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40404040FF404040"
    )
        port map (
      I0 => RX_NEG,
      I1 => odd_word_r,
      I2 => polarity_r,
      I3 => realign_r,
      I4 => count_32d_done_r,
      I5 => rx_realign_i,
      O => next_polarity_c
    );
polarity_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_polarity_c,
      Q => polarity_r,
      R => ready_r_reg0
    );
prev_char_was_comma_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => RX_CHAR_IS_COMMA_R(1),
      I1 => RX_CHAR_IS_COMMA_R(0),
      O => inc_count_c1
    );
prev_char_was_comma_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => inc_count_c1,
      Q => prev_char_was_comma_r,
      R => '0'
    );
prev_count_128d_done_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_128d_done_r,
      Q => prev_count_128d_done_r,
      R => '0'
    );
ready_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080FFFF00800080"
    )
        port map (
      I0 => \counter3_r_reg_n_0_[3]\,
      I1 => \counter2_r_reg_n_0_[15]\,
      I2 => \^ack_r\,
      I3 => \counter5_r_reg_n_0_[15]\,
      I4 => \counter4_r_reg_n_0_[15]\,
      I5 => \^ready_r\,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_ready_c,
      Q => \^ready_r\,
      R => ready_r_reg0
    );
realign_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF020202"
    )
        port map (
      I0 => realign_r,
      I1 => rx_realign_i,
      I2 => count_32d_done_r,
      I3 => count_128d_done_r,
      I4 => \^realign_r_reg_0\,
      O => next_realign_c
    );
realign_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_realign_c,
      Q => realign_r,
      R => ready_r_reg0
    );
reset_count_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFFFFEFEEFFEEEF"
    )
        port map (
      I0 => SR(0),
      I1 => rst_r_reg_0,
      I2 => comma_over_two_cycles_r,
      I3 => \^reset_count_r_reg_0\,
      I4 => begin_r,
      I5 => count_8d_done_r,
      O => reset_count_r0
    );
reset_count_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_count_r0,
      Q => reset_count_r,
      R => '0'
    );
rst_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => \^reset_count_r_reg_0\,
      I2 => begin_r,
      O => next_rst_c
    );
rst_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => next_rst_c,
      Q => \^reset_count_r_reg_0\,
      R => ready_r_reg0
    );
rx_polarity_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => RX_NEG,
      I1 => polarity_r,
      I2 => \^rx_polarity_i\,
      O => rx_polarity_r_i_1_n_0
    );
rx_polarity_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_polarity_r_i_1_n_0,
      Q => \^rx_polarity_i\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_RX_LL_NFC is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_snf : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_dst_rdy_crc : in STD_LOGIC;
    do_cc_r : in STD_LOGIC;
    \RX_FC_NB_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_RX_LL_NFC : entity is "merger_aurora_RX_LL_NFC";
end merger_aurora_merger_aurora_RX_LL_NFC;

architecture STRUCTURE of merger_aurora_merger_aurora_RX_LL_NFC is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fcnb_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal load_nfc_r : STD_LOGIC;
  signal \nfc_counter_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[0]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[0]_i_4_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[1]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[3]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[4]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[6]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[6]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal xoff_r : STD_LOGIC;
  signal xoff_r_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \nfc_counter_r[0]_i_3\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \nfc_counter_r[1]_i_3\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \nfc_counter_r[2]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \nfc_counter_r[2]_i_2\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \nfc_counter_r[3]_i_2\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \nfc_counter_r[3]_i_3\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \nfc_counter_r[4]_i_2\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \nfc_counter_r[5]_i_2\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \nfc_counter_r[6]_i_2\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \nfc_counter_r[8]_i_1\ : label is "soft_lutpair89";
begin
  Q(0) <= \^q\(0);
\fcnb_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \RX_FC_NB_reg[0]\(3),
      Q => fcnb_r(0),
      R => '0'
    );
\fcnb_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \RX_FC_NB_reg[0]\(2),
      Q => fcnb_r(1),
      R => '0'
    );
\fcnb_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \RX_FC_NB_reg[0]\(1),
      Q => fcnb_r(2),
      R => '0'
    );
\fcnb_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \RX_FC_NB_reg[0]\(0),
      Q => fcnb_r(3),
      R => '0'
    );
load_nfc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => m_axi_rx_snf,
      Q => load_nfc_r,
      R => '0'
    );
\nfc_counter_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0002"
    )
        port map (
      I0 => tx_dst_rdy_crc,
      I1 => do_cc_r,
      I2 => xoff_r,
      I3 => \^q\(0),
      I4 => load_nfc_r,
      O => \nfc_counter_r[0]_i_1_n_0\
    );
\nfc_counter_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAEABAEAEAEAEAE"
    )
        port map (
      I0 => \nfc_counter_r[0]_i_3_n_0\,
      I1 => \^q\(0),
      I2 => load_nfc_r,
      I3 => \nfc_counter_r_reg_n_0_[1]\,
      I4 => \nfc_counter_r[0]_i_4_n_0\,
      I5 => \nfc_counter_r_reg_n_0_[2]\,
      O => \p_0_in__0\(8)
    );
\nfc_counter_r[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7000E100"
    )
        port map (
      I0 => fcnb_r(2),
      I1 => fcnb_r(3),
      I2 => fcnb_r(0),
      I3 => load_nfc_r,
      I4 => fcnb_r(1),
      O => \nfc_counter_r[0]_i_3_n_0\
    );
\nfc_counter_r[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[3]\,
      I1 => \nfc_counter_r_reg_n_0_[6]\,
      I2 => \nfc_counter_r_reg_n_0_[7]\,
      I3 => \nfc_counter_r_reg_n_0_[8]\,
      I4 => \nfc_counter_r_reg_n_0_[5]\,
      I5 => \nfc_counter_r_reg_n_0_[4]\,
      O => \nfc_counter_r[0]_i_4_n_0\
    );
\nfc_counter_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54FF5400540054FF"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => \nfc_counter_r[1]_i_2_n_0\,
      I2 => fcnb_r(1),
      I3 => load_nfc_r,
      I4 => \nfc_counter_r_reg_n_0_[1]\,
      I5 => \nfc_counter_r[1]_i_3_n_0\,
      O => \p_0_in__0\(7)
    );
\nfc_counter_r[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => fcnb_r(2),
      I1 => fcnb_r(3),
      O => \nfc_counter_r[1]_i_2_n_0\
    );
\nfc_counter_r[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \nfc_counter_r[0]_i_4_n_0\,
      I1 => \nfc_counter_r_reg_n_0_[2]\,
      O => \nfc_counter_r[1]_i_3_n_0\
    );
\nfc_counter_r[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09F90909"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[2]\,
      I1 => \nfc_counter_r[0]_i_4_n_0\,
      I2 => load_nfc_r,
      I3 => fcnb_r(0),
      I4 => \nfc_counter_r[2]_i_2_n_0\,
      O => \p_0_in__0\(6)
    );
\nfc_counter_r[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7E"
    )
        port map (
      I0 => fcnb_r(3),
      I1 => fcnb_r(2),
      I2 => fcnb_r(1),
      O => \nfc_counter_r[2]_i_2_n_0\
    );
\nfc_counter_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"06F60606"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[3]\,
      I1 => \nfc_counter_r[3]_i_2_n_0\,
      I2 => load_nfc_r,
      I3 => fcnb_r(0),
      I4 => \nfc_counter_r[3]_i_3_n_0\,
      O => \p_0_in__0\(5)
    );
\nfc_counter_r[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[4]\,
      I1 => \nfc_counter_r_reg_n_0_[5]\,
      I2 => \nfc_counter_r_reg_n_0_[8]\,
      I3 => \nfc_counter_r_reg_n_0_[7]\,
      I4 => \nfc_counter_r_reg_n_0_[6]\,
      O => \nfc_counter_r[3]_i_2_n_0\
    );
\nfc_counter_r[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"76"
    )
        port map (
      I0 => fcnb_r(1),
      I1 => fcnb_r(2),
      I2 => fcnb_r(3),
      O => \nfc_counter_r[3]_i_3_n_0\
    );
\nfc_counter_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"12FF1200120012FF"
    )
        port map (
      I0 => fcnb_r(1),
      I1 => fcnb_r(0),
      I2 => \nfc_counter_r[1]_i_2_n_0\,
      I3 => load_nfc_r,
      I4 => \nfc_counter_r_reg_n_0_[4]\,
      I5 => \nfc_counter_r[4]_i_2_n_0\,
      O => \p_0_in__0\(4)
    );
\nfc_counter_r[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[6]\,
      I1 => \nfc_counter_r_reg_n_0_[7]\,
      I2 => \nfc_counter_r_reg_n_0_[8]\,
      I3 => \nfc_counter_r_reg_n_0_[5]\,
      O => \nfc_counter_r[4]_i_2_n_0\
    );
\nfc_counter_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14444444"
    )
        port map (
      I0 => load_nfc_r,
      I1 => \nfc_counter_r_reg_n_0_[5]\,
      I2 => \nfc_counter_r_reg_n_0_[6]\,
      I3 => \nfc_counter_r_reg_n_0_[7]\,
      I4 => \nfc_counter_r_reg_n_0_[8]\,
      I5 => \nfc_counter_r[5]_i_2_n_0\,
      O => \p_0_in__0\(3)
    );
\nfc_counter_r[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04040400"
    )
        port map (
      I0 => fcnb_r(1),
      I1 => load_nfc_r,
      I2 => fcnb_r(0),
      I3 => fcnb_r(3),
      I4 => fcnb_r(2),
      O => \nfc_counter_r[5]_i_2_n_0\
    );
\nfc_counter_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"60FF6060606060FF"
    )
        port map (
      I0 => fcnb_r(3),
      I1 => fcnb_r(2),
      I2 => \nfc_counter_r[6]_i_2_n_0\,
      I3 => load_nfc_r,
      I4 => \nfc_counter_r_reg_n_0_[6]\,
      I5 => \nfc_counter_r[6]_i_3_n_0\,
      O => \p_0_in__0\(2)
    );
\nfc_counter_r[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => load_nfc_r,
      I2 => fcnb_r(1),
      O => \nfc_counter_r[6]_i_2_n_0\
    );
\nfc_counter_r[6]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[7]\,
      I1 => \nfc_counter_r_reg_n_0_[8]\,
      O => \nfc_counter_r[6]_i_3_n_0\
    );
\nfc_counter_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14141414FF141414"
    )
        port map (
      I0 => load_nfc_r,
      I1 => \nfc_counter_r_reg_n_0_[7]\,
      I2 => \nfc_counter_r_reg_n_0_[8]\,
      I3 => \nfc_counter_r[6]_i_2_n_0\,
      I4 => fcnb_r(3),
      I5 => fcnb_r(2),
      O => \p_0_in__0\(1)
    );
\nfc_counter_r[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[8]\,
      I1 => load_nfc_r,
      O => \p_0_in__0\(0)
    );
\nfc_counter_r_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(8),
      Q => \^q\(0),
      S => SS(0)
    );
\nfc_counter_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(7),
      Q => \nfc_counter_r_reg_n_0_[1]\,
      R => SS(0)
    );
\nfc_counter_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(6),
      Q => \nfc_counter_r_reg_n_0_[2]\,
      R => SS(0)
    );
\nfc_counter_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(5),
      Q => \nfc_counter_r_reg_n_0_[3]\,
      R => SS(0)
    );
\nfc_counter_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(4),
      Q => \nfc_counter_r_reg_n_0_[4]\,
      R => SS(0)
    );
\nfc_counter_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(3),
      Q => \nfc_counter_r_reg_n_0_[5]\,
      R => SS(0)
    );
\nfc_counter_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(2),
      Q => \nfc_counter_r_reg_n_0_[6]\,
      R => SS(0)
    );
\nfc_counter_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(1),
      Q => \nfc_counter_r_reg_n_0_[7]\,
      R => SS(0)
    );
\nfc_counter_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => \p_0_in__0\(0),
      Q => \nfc_counter_r_reg_n_0_[8]\,
      R => SS(0)
    );
xoff_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000FFFF80000000"
    )
        port map (
      I0 => fcnb_r(2),
      I1 => fcnb_r(3),
      I2 => fcnb_r(0),
      I3 => fcnb_r(1),
      I4 => load_nfc_r,
      I5 => xoff_r,
      O => xoff_r_i_1_n_0
    );
xoff_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => xoff_r_i_1_n_0,
      Q => xoff_r,
      R => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_RX_LL_PDU_DATAPATH is
  port (
    rem_in_reg : out STD_LOGIC;
    FRAME_ERR_reg_0 : out STD_LOGIC;
    sof_ds_r_reg : out STD_LOGIC;
    rx_sof_crc : out STD_LOGIC;
    EOF_N_US_r_reg : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    FRAME_ERR_reg_1 : out STD_LOGIC;
    \crc_data_i_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    sof_ds_c : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \DATA_US_r_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    data_width_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    rx_pad_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    RX_ECP_reg : in STD_LOGIC;
    RX_ECP_reg_0 : in STD_LOGIC;
    rx_ecp_i : in STD_LOGIC;
    rx_pe_data_v_i : in STD_LOGIC;
    rx_scp_i : in STD_LOGIC;
    RX_SCP_reg : in STD_LOGIC;
    \count_reg[0]\ : in STD_LOGIC;
    wait_r : in STD_LOGIC;
    \DATA_US_r_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \RX_PE_DATA_reg[0]\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_RX_LL_PDU_DATAPATH : entity is "merger_aurora_RX_LL_PDU_DATAPATH";
end merger_aurora_merger_aurora_RX_LL_PDU_DATAPATH;

architecture STRUCTURE of merger_aurora_merger_aurora_RX_LL_PDU_DATAPATH is
  signal \^data_us_r_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^eof_n_us_r_reg\ : STD_LOGIC;
  signal \FRAME_ERR0__0\ : STD_LOGIC;
  signal \^frame_err_reg_0\ : STD_LOGIC;
  signal \^frame_err_reg_1\ : STD_LOGIC;
  signal RX_SOF_N_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal pad_in_storage_r : STD_LOGIC;
  signal \^rem_in_reg\ : STD_LOGIC;
  signal \^sof_ds_r_reg\ : STD_LOGIC;
  signal sof_in_storage_r : STD_LOGIC;
  signal sof_in_storage_r_i_1_n_0 : STD_LOGIC;
  signal \src_rdy_n_c__0\ : STD_LOGIC;
  signal storage_ce_c : STD_LOGIC;
  signal storage_r : STD_LOGIC_VECTOR ( 0 to 15 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \crc_data_i[7]_i_1__0\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \data_width_i_1__0\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \received_CRC[0]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \received_CRC[10]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \received_CRC[11]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \received_CRC[12]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \received_CRC[13]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \received_CRC[14]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \received_CRC[15]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \received_CRC[1]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \received_CRC[2]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \received_CRC[3]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \received_CRC[4]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \received_CRC[5]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \received_CRC[6]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \received_CRC[7]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \received_CRC[8]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \received_CRC[9]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \rem_in_i_1__0\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \sof_ds_r_i_1__0\ : label is "soft_lutpair91";
begin
  \DATA_US_r_reg[15]\(15 downto 0) <= \^data_us_r_reg[15]\(15 downto 0);
  EOF_N_US_r_reg <= \^eof_n_us_r_reg\;
  FRAME_ERR_reg_0 <= \^frame_err_reg_0\;
  FRAME_ERR_reg_1 <= \^frame_err_reg_1\;
  rem_in_reg <= \^rem_in_reg\;
  sof_ds_r_reg <= \^sof_ds_r_reg\;
FRAME_ERR0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACEC"
    )
        port map (
      I0 => rx_scp_i,
      I1 => rx_ecp_i,
      I2 => \^frame_err_reg_1\,
      I3 => \^frame_err_reg_0\,
      O => \FRAME_ERR0__0\
    );
FRAME_ERR_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \FRAME_ERR0__0\,
      Q => frame_err,
      R => '0'
    );
\RX_D_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(0),
      Q => \^data_us_r_reg[15]\(15),
      R => '0'
    );
\RX_D_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(10),
      Q => \^data_us_r_reg[15]\(5),
      R => '0'
    );
\RX_D_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(11),
      Q => \^data_us_r_reg[15]\(4),
      R => '0'
    );
\RX_D_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(12),
      Q => \^data_us_r_reg[15]\(3),
      R => '0'
    );
\RX_D_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(13),
      Q => \^data_us_r_reg[15]\(2),
      R => '0'
    );
\RX_D_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(14),
      Q => \^data_us_r_reg[15]\(1),
      R => '0'
    );
\RX_D_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(15),
      Q => \^data_us_r_reg[15]\(0),
      R => '0'
    );
\RX_D_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(1),
      Q => \^data_us_r_reg[15]\(14),
      R => '0'
    );
\RX_D_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(2),
      Q => \^data_us_r_reg[15]\(13),
      R => '0'
    );
\RX_D_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(3),
      Q => \^data_us_r_reg[15]\(12),
      R => '0'
    );
\RX_D_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(4),
      Q => \^data_us_r_reg[15]\(11),
      R => '0'
    );
\RX_D_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(5),
      Q => \^data_us_r_reg[15]\(10),
      R => '0'
    );
\RX_D_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(6),
      Q => \^data_us_r_reg[15]\(9),
      R => '0'
    );
\RX_D_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(7),
      Q => \^data_us_r_reg[15]\(8),
      R => '0'
    );
\RX_D_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(8),
      Q => \^data_us_r_reg[15]\(7),
      R => '0'
    );
\RX_D_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => storage_r(9),
      Q => \^data_us_r_reg[15]\(6),
      R => '0'
    );
RX_EOF_N_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_ECP_reg_0,
      Q => \^eof_n_us_r_reg\,
      R => '0'
    );
\RX_REM[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pad_in_storage_r,
      O => p_0_in
    );
\RX_REM_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_0_in,
      Q => \^rem_in_reg\,
      R => '0'
    );
RX_SOF_N_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sof_in_storage_r,
      O => RX_SOF_N_i_1_n_0
    );
RX_SOF_N_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_SOF_N_i_1_n_0,
      Q => rx_sof_crc,
      R => '0'
    );
RX_SRC_RDY_N_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \src_rdy_n_c__0\,
      Q => \^sof_ds_r_reg\,
      S => SS(0)
    );
\crc_data_i[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^rem_in_reg\,
      I1 => \^eof_n_us_r_reg\,
      I2 => \^sof_ds_r_reg\,
      I3 => \count_reg[0]\,
      O => \crc_data_i_reg[0]\(0)
    );
\data_width_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \count_reg[0]\,
      I1 => \^sof_ds_r_reg\,
      I2 => \^eof_n_us_r_reg\,
      I3 => \^rem_in_reg\,
      O => data_width_reg
    );
in_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_SCP_reg,
      Q => \^frame_err_reg_1\,
      R => SS(0)
    );
pad_in_storage_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => rx_pad_i,
      Q => pad_in_storage_r,
      R => '0'
    );
\received_CRC[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(0),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(8),
      O => D(0)
    );
\received_CRC[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(10),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(2),
      O => D(10)
    );
\received_CRC[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(11),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(3),
      O => D(11)
    );
\received_CRC[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(12),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(4),
      O => D(12)
    );
\received_CRC[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(13),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(5),
      O => D(13)
    );
\received_CRC[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(14),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(6),
      O => D(14)
    );
\received_CRC[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(15),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(7),
      O => D(15)
    );
\received_CRC[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(1),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(9),
      O => D(1)
    );
\received_CRC[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(2),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(10),
      O => D(2)
    );
\received_CRC[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(3),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(11),
      O => D(3)
    );
\received_CRC[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(4),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(12),
      O => D(4)
    );
\received_CRC[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(5),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(13),
      O => D(5)
    );
\received_CRC[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(6),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(14),
      O => D(6)
    );
\received_CRC[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(7),
      I1 => \^rem_in_reg\,
      I2 => \^data_us_r_reg[15]\(15),
      O => D(7)
    );
\received_CRC[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(8),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(0),
      O => D(8)
    );
\received_CRC[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^data_us_r_reg[15]\(9),
      I1 => \^rem_in_reg\,
      I2 => \DATA_US_r_reg[7]\(1),
      O => D(9)
    );
\rem_in_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \count_reg[0]\,
      I1 => \^sof_ds_r_reg\,
      I2 => \^eof_n_us_r_reg\,
      O => E(0)
    );
\sof_ds_r_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^eof_n_us_r_reg\,
      I1 => wait_r,
      I2 => \^sof_ds_r_reg\,
      I3 => \count_reg[0]\,
      O => sof_ds_c
    );
sof_in_storage_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF57770000"
    )
        port map (
      I0 => \^frame_err_reg_0\,
      I1 => rx_ecp_i,
      I2 => \^frame_err_reg_1\,
      I3 => rx_pe_data_v_i,
      I4 => sof_in_storage_r,
      I5 => rx_scp_i,
      O => sof_in_storage_r_i_1_n_0
    );
sof_in_storage_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => sof_in_storage_r_i_1_n_0,
      Q => sof_in_storage_r,
      R => '0'
    );
src_rdy_n_c: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5777"
    )
        port map (
      I0 => \^frame_err_reg_0\,
      I1 => rx_ecp_i,
      I2 => \^frame_err_reg_1\,
      I3 => rx_pe_data_v_i,
      O => \src_rdy_n_c__0\
    );
\storage_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^frame_err_reg_1\,
      I1 => rx_pe_data_v_i,
      O => storage_ce_c
    );
\storage_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(15),
      Q => storage_r(0),
      R => '0'
    );
\storage_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(5),
      Q => storage_r(10),
      R => '0'
    );
\storage_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(4),
      Q => storage_r(11),
      R => '0'
    );
\storage_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(3),
      Q => storage_r(12),
      R => '0'
    );
\storage_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(2),
      Q => storage_r(13),
      R => '0'
    );
\storage_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(1),
      Q => storage_r(14),
      R => '0'
    );
\storage_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(0),
      Q => storage_r(15),
      R => '0'
    );
\storage_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(14),
      Q => storage_r(1),
      R => '0'
    );
\storage_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(13),
      Q => storage_r(2),
      R => '0'
    );
\storage_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(12),
      Q => storage_r(3),
      R => '0'
    );
\storage_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(11),
      Q => storage_r(4),
      R => '0'
    );
\storage_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(10),
      Q => storage_r(5),
      R => '0'
    );
\storage_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(9),
      Q => storage_r(6),
      R => '0'
    );
\storage_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(8),
      Q => storage_r(7),
      R => '0'
    );
\storage_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(7),
      Q => storage_r(8),
      R => '0'
    );
\storage_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => storage_ce_c,
      D => \RX_PE_DATA_reg[0]\(6),
      Q => storage_r(9),
      R => '0'
    );
storage_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_ECP_reg,
      Q => \^frame_err_reg_0\,
      R => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_STANDARD_CC_MODULE is
  port (
    warn_cc : out STD_LOGIC;
    do_nfc_r : out STD_LOGIC;
    Q : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    do_nfc_r_reg : in STD_LOGIC;
    s_axi_nfc_req : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_STANDARD_CC_MODULE : entity is "merger_aurora_STANDARD_CC_MODULE";
end merger_aurora_merger_aurora_STANDARD_CC_MODULE;

architecture STRUCTURE of merger_aurora_merger_aurora_STANDARD_CC_MODULE is
  signal DO_CC0_n_0 : STD_LOGIC;
  signal DO_CC_i_1_n_0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC;
  signal WARN_CC_i_1_n_0 : STD_LOGIC;
  signal \cc_count_r_reg_n_0_[5]\ : STD_LOGIC;
  signal cc_idle_count_done_c : STD_LOGIC;
  signal count_13d_flop_r_reg_r_n_0 : STD_LOGIC;
  signal \count_13d_srl_r_reg[10]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\ : STD_LOGIC;
  signal \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\ : STD_LOGIC;
  signal \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\ : STD_LOGIC;
  signal count_13d_srl_r_reg_gate_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_0_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_1_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_2_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_3_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_4_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_5_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_6_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_7_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_8_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_9_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_n_0 : STD_LOGIC;
  signal count_16d_flop_r : STD_LOGIC;
  signal count_16d_flop_r_i_1_n_0 : STD_LOGIC;
  signal count_16d_srl_r0 : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[9]\ : STD_LOGIC;
  signal count_24d_flop_r : STD_LOGIC;
  signal count_24d_flop_r_i_1_n_0 : STD_LOGIC;
  signal count_24d_srl_r0 : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[16]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[17]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[18]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[19]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[20]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[21]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[22]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[9]\ : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_3_out : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0\ : STD_LOGIC;
  signal \prepare_count_r_reg[8]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0\ : STD_LOGIC;
  signal prepare_count_r_reg_gate_n_0 : STD_LOGIC;
  signal reset_r : STD_LOGIC;
  signal \^warn_cc\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8\ : label is "inst/\merger_aurora_core_i/standard_cc_module_i/count_13d_srl_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8\ : label is "inst/\merger_aurora_core_i/standard_cc_module_i/count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of count_16d_flop_r_i_1 : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of count_24d_flop_r_i_1 : label is "soft_lutpair100";
  attribute srl_bus_name of \prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5\ : label is "inst/\merger_aurora_core_i/standard_cc_module_i/prepare_count_r_reg ";
  attribute srl_name of \prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5\ : label is "inst/\merger_aurora_core_i/standard_cc_module_i/prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5 ";
  attribute SOFT_HLUTNM of \prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_i_1\ : label is "soft_lutpair100";
begin
  Q <= \^q\;
  warn_cc <= \^warn_cc\;
DO_CC0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => p_2_in(0),
      I1 => \cc_count_r_reg_n_0_[5]\,
      I2 => p_2_in(3),
      I3 => p_2_in(4),
      I4 => p_2_in(1),
      I5 => p_2_in(2),
      O => DO_CC0_n_0
    );
DO_CC_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => DO_CC0_n_0,
      I1 => p_3_out(5),
      I2 => reset_r,
      O => DO_CC_i_1_n_0
    );
DO_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DO_CC_i_1_n_0,
      Q => \^q\,
      R => SR(0)
    );
WARN_CC_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8080"
    )
        port map (
      I0 => \count_24d_srl_r_reg_n_0_[22]\,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      I2 => count_16d_srl_r0,
      I3 => p_3_out(5),
      I4 => \^warn_cc\,
      O => WARN_CC_i_1_n_0
    );
WARN_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => WARN_CC_i_1_n_0,
      Q => \^warn_cc\,
      R => SR(0)
    );
\cc_count_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_3_out(5),
      Q => p_2_in(4),
      R => SR(0)
    );
\cc_count_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_2_in(4),
      Q => p_2_in(3),
      R => SR(0)
    );
\cc_count_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_2_in(3),
      Q => p_2_in(2),
      R => SR(0)
    );
\cc_count_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_2_in(2),
      Q => p_2_in(1),
      R => SR(0)
    );
\cc_count_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_2_in(1),
      Q => p_2_in(0),
      R => SR(0)
    );
\cc_count_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_2_in(0),
      Q => \cc_count_r_reg_n_0_[5]\,
      R => SR(0)
    );
count_13d_flop_r_reg_r: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => '1',
      Q => count_13d_flop_r_reg_r_n_0,
      R => SR(0)
    );
\count_13d_srl_r_reg[10]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\,
      Q => \count_13d_srl_r_reg[10]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\,
      R => '0'
    );
\count_13d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_gate_n_0,
      Q => count_16d_srl_r0,
      R => SR(0)
    );
\count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\,
      Q => \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\
    );
\count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => reset_r,
      O => \count_13d_srl_r_reg[9]_srl11___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\
    );
count_13d_srl_r_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count_13d_srl_r_reg[10]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\,
      I1 => count_13d_srl_r_reg_r_9_n_0,
      O => count_13d_srl_r_reg_gate_n_0
    );
count_13d_srl_r_reg_r: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_flop_r_reg_r_n_0,
      Q => count_13d_srl_r_reg_r_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_0: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_n_0,
      Q => count_13d_srl_r_reg_r_0_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_1: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_0_n_0,
      Q => count_13d_srl_r_reg_r_1_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_2: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_1_n_0,
      Q => count_13d_srl_r_reg_r_2_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_3: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_2_n_0,
      Q => count_13d_srl_r_reg_r_3_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_4: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_3_n_0,
      Q => count_13d_srl_r_reg_r_4_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_5: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_4_n_0,
      Q => count_13d_srl_r_reg_r_5_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_6: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_5_n_0,
      Q => count_13d_srl_r_reg_r_6_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_7: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_6_n_0,
      Q => count_13d_srl_r_reg_r_7_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_8: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_7_n_0,
      Q => count_13d_srl_r_reg_r_8_n_0,
      R => SR(0)
    );
count_13d_srl_r_reg_r_9: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_13d_srl_r_reg_r_8_n_0,
      Q => count_13d_srl_r_reg_r_9_n_0,
      R => SR(0)
    );
count_16d_flop_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBF8"
    )
        port map (
      I0 => \count_16d_srl_r_reg_n_0_[14]\,
      I1 => count_16d_srl_r0,
      I2 => reset_r,
      I3 => count_16d_flop_r,
      O => count_16d_flop_r_i_1_n_0
    );
count_16d_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_16d_flop_r_i_1_n_0,
      Q => count_16d_flop_r,
      R => SR(0)
    );
\count_16d_srl_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => count_16d_flop_r,
      Q => \count_16d_srl_r_reg_n_0_[0]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[9]\,
      Q => \count_16d_srl_r_reg_n_0_[10]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[10]\,
      Q => \count_16d_srl_r_reg_n_0_[11]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[11]\,
      Q => \count_16d_srl_r_reg_n_0_[12]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[12]\,
      Q => \count_16d_srl_r_reg_n_0_[13]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[13]\,
      Q => \count_16d_srl_r_reg_n_0_[14]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[0]\,
      Q => \count_16d_srl_r_reg_n_0_[1]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[1]\,
      Q => \count_16d_srl_r_reg_n_0_[2]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[2]\,
      Q => \count_16d_srl_r_reg_n_0_[3]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[3]\,
      Q => \count_16d_srl_r_reg_n_0_[4]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[4]\,
      Q => \count_16d_srl_r_reg_n_0_[5]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[5]\,
      Q => \count_16d_srl_r_reg_n_0_[6]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[6]\,
      Q => \count_16d_srl_r_reg_n_0_[7]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[7]\,
      Q => \count_16d_srl_r_reg_n_0_[8]\,
      R => SR(0)
    );
\count_16d_srl_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[8]\,
      Q => \count_16d_srl_r_reg_n_0_[9]\,
      R => SR(0)
    );
count_24d_flop_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFF80"
    )
        port map (
      I0 => \count_24d_srl_r_reg_n_0_[22]\,
      I1 => count_16d_srl_r0,
      I2 => \count_16d_srl_r_reg_n_0_[14]\,
      I3 => reset_r,
      I4 => count_24d_flop_r,
      O => count_24d_flop_r_i_1_n_0
    );
count_24d_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => count_24d_flop_r_i_1_n_0,
      Q => count_24d_flop_r,
      R => SR(0)
    );
\count_24d_srl_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      O => count_24d_srl_r0
    );
\count_24d_srl_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => count_24d_flop_r,
      Q => \count_24d_srl_r_reg_n_0_[0]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[9]\,
      Q => \count_24d_srl_r_reg_n_0_[10]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[10]\,
      Q => \count_24d_srl_r_reg_n_0_[11]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[11]\,
      Q => \count_24d_srl_r_reg_n_0_[12]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[12]\,
      Q => \count_24d_srl_r_reg_n_0_[13]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[13]\,
      Q => \count_24d_srl_r_reg_n_0_[14]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[14]\,
      Q => \count_24d_srl_r_reg_n_0_[15]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[15]\,
      Q => \count_24d_srl_r_reg_n_0_[16]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[16]\,
      Q => \count_24d_srl_r_reg_n_0_[17]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[17]\,
      Q => \count_24d_srl_r_reg_n_0_[18]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[18]\,
      Q => \count_24d_srl_r_reg_n_0_[19]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[0]\,
      Q => \count_24d_srl_r_reg_n_0_[1]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[19]\,
      Q => \count_24d_srl_r_reg_n_0_[20]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[20]\,
      Q => \count_24d_srl_r_reg_n_0_[21]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[21]\,
      Q => \count_24d_srl_r_reg_n_0_[22]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[1]\,
      Q => \count_24d_srl_r_reg_n_0_[2]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[2]\,
      Q => \count_24d_srl_r_reg_n_0_[3]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[3]\,
      Q => \count_24d_srl_r_reg_n_0_[4]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[4]\,
      Q => \count_24d_srl_r_reg_n_0_[5]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[5]\,
      Q => \count_24d_srl_r_reg_n_0_[6]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[6]\,
      Q => \count_24d_srl_r_reg_n_0_[7]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[7]\,
      Q => \count_24d_srl_r_reg_n_0_[8]\,
      R => SR(0)
    );
\count_24d_srl_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[8]\,
      Q => \count_24d_srl_r_reg_n_0_[9]\,
      R => SR(0)
    );
do_nfc_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => do_nfc_r_reg,
      I1 => s_axi_nfc_req,
      I2 => \^warn_cc\,
      I3 => \^q\,
      O => do_nfc_r
    );
\prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => cc_idle_count_done_c,
      Q => \prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0\
    );
\prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      I2 => \count_24d_srl_r_reg_n_0_[22]\,
      O => cc_idle_count_done_c
    );
\prepare_count_r_reg[8]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \prepare_count_r_reg[7]_srl8___merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_5_n_0\,
      Q => \prepare_count_r_reg[8]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0\,
      R => '0'
    );
\prepare_count_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prepare_count_r_reg_gate_n_0,
      Q => p_3_out(5),
      R => SR(0)
    );
prepare_count_r_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \prepare_count_r_reg[8]_merger_aurora_core_i_standard_cc_module_i_count_13d_srl_r_reg_r_6_n_0\,
      I1 => count_13d_srl_r_reg_r_6_n_0,
      O => prepare_count_r_reg_gate_n_0
    );
reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => SR(0),
      Q => reset_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_SYM_DEC is
  port (
    RX_NEG : out STD_LOGIC;
    rx_pad_i : out STD_LOGIC;
    rx_scp_i : out STD_LOGIC;
    RX_EOF_N_reg : out STD_LOGIC;
    m_axi_rx_snf : out STD_LOGIC;
    got_v_i : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \storage_r_reg[0]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    left_aligned_r_reg_0 : out STD_LOGIC;
    first_v_received_r : out STD_LOGIC;
    rx_pe_data_v_i : out STD_LOGIC;
    counter4_r0 : out STD_LOGIC;
    counter3_r0 : out STD_LOGIC;
    RX_EOF_N_reg_0 : out STD_LOGIC;
    in_frame_r_reg : out STD_LOGIC;
    storage_v_r_reg : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    left_aligned_r_reg_1 : in STD_LOGIC;
    left_aligned_r_reg_2 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    left_aligned_r_reg_3 : in STD_LOGIC;
    ready_r : in STD_LOGIC;
    ack_r : in STD_LOGIC;
    in_frame_r : in STD_LOGIC;
    storage_v_r : in STD_LOGIC;
    left_aligned_r_reg_4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg_5 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_SYM_DEC : entity is "merger_aurora_SYM_DEC";
end merger_aurora_merger_aurora_SYM_DEC;

architecture STRUCTURE of merger_aurora_merger_aurora_SYM_DEC is
  signal RX_CC_i_1_n_0 : STD_LOGIC;
  signal RX_ECP_i_1_n_0 : STD_LOGIC;
  signal \^rx_eof_n_reg\ : STD_LOGIC;
  signal RX_NEG0 : STD_LOGIC;
  signal RX_PAD0 : STD_LOGIC;
  signal RX_PE_DATA_V_i_1_n_0 : STD_LOGIC;
  signal RX_SCP_i_1_n_0 : STD_LOGIC;
  signal RX_SNF_i_1_n_0 : STD_LOGIC;
  signal RX_SPA0 : STD_LOGIC;
  signal \^first_v_received_r\ : STD_LOGIC;
  signal first_v_received_r_i_1_n_0 : STD_LOGIC;
  signal got_v_c : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in5_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_5_out : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal prev_beat_sp_d_r05_out : STD_LOGIC;
  signal prev_beat_sp_d_r08_out : STD_LOGIC;
  signal \prev_beat_sp_d_r0__0\ : STD_LOGIC;
  signal prev_beat_sp_d_r16_in : STD_LOGIC;
  signal \prev_beat_sp_d_r1__0\ : STD_LOGIC;
  signal prev_beat_sp_r : STD_LOGIC;
  signal prev_beat_sp_r0 : STD_LOGIC;
  signal \prev_beat_spa_d_r0__0\ : STD_LOGIC;
  signal prev_beat_spa_r : STD_LOGIC;
  signal prev_beat_spa_r0 : STD_LOGIC;
  signal prev_beat_v_d_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \prev_beat_v_d_r0__0\ : STD_LOGIC;
  signal prev_beat_v_d_r0_n_0 : STD_LOGIC;
  signal prev_beat_v_r : STD_LOGIC;
  signal prev_beat_v_r0 : STD_LOGIC;
  signal rx_cc_r : STD_LOGIC_VECTOR ( 1 to 3 );
  signal \rx_cc_r0__0\ : STD_LOGIC;
  signal rx_cc_r0_n_0 : STD_LOGIC;
  signal rx_ecp_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_ecp_d_r0__0\ : STD_LOGIC;
  signal \rx_ecp_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal rx_ecp_d_r0_n_0 : STD_LOGIC;
  signal rx_pad_d_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \rx_pad_d_r0__0\ : STD_LOGIC;
  signal rx_pad_d_r0_n_0 : STD_LOGIC;
  signal \rx_pe_control_r_reg_n_0_[1]\ : STD_LOGIC;
  signal rx_pe_data_r : STD_LOGIC_VECTOR ( 0 to 15 );
  signal \^rx_pe_data_v_i\ : STD_LOGIC;
  signal rx_scp_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_scp_d_r0__0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__2/i__n_0\ : STD_LOGIC;
  signal \^rx_scp_i\ : STD_LOGIC;
  signal rx_snf_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \rx_snf_d_r0__0\ : STD_LOGIC;
  signal rx_sp_c : STD_LOGIC;
  signal rx_sp_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal rx_sp_i : STD_LOGIC;
  signal rx_sp_neg_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_spa_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_spa_d_r0__0\ : STD_LOGIC;
  signal rx_spa_i : STD_LOGIC;
  signal rx_spa_neg_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \rx_spa_neg_d_r0__0\ : STD_LOGIC;
  signal rx_spa_neg_d_r0_n_0 : STD_LOGIC;
  signal rx_v_d_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \rx_v_d_r0__0\ : STD_LOGIC;
  signal rx_v_d_r0_n_0 : STD_LOGIC;
  signal word_aligned_control_bits_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal word_aligned_control_bits_r_reg : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[7]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of RX_PAD_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of RX_PE_DATA_V_i_1 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of RX_SNF_i_1 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of RX_SP_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \in_frame_r_i_1__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of prev_beat_sp_d_r0 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \prev_beat_sp_d_r0_inferred__0/i_\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \prev_beat_sp_d_r0_inferred__1/i_\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of prev_beat_sp_d_r1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \prev_beat_sp_d_r1_inferred__0/i_\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of prev_beat_spa_d_r0 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of prev_beat_v_d_r0 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \prev_beat_v_d_r0_inferred__0/i_\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of rx_cc_r0 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of rx_ecp_d_r0 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__0/i_\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__1/i_\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \rx_ll_pdu_datapath_i/storage_v_r_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of rx_pad_d_r0 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rx_pad_d_r0_inferred__0/i_\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of rx_scp_d_r0 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__0/i_\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__1/i_\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__2/i_\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of rx_snf_d_r0 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \rx_sp_d_r[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rx_sp_d_r[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of rx_spa_neg_d_r0 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of rx_v_d_r0 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__0/i_\ : label is "soft_lutpair18";
begin
  RX_EOF_N_reg <= \^rx_eof_n_reg\;
  first_v_received_r <= \^first_v_received_r\;
  rx_pe_data_v_i <= \^rx_pe_data_v_i\;
  rx_scp_i <= \^rx_scp_i\;
GOT_V_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => prev_beat_v_r,
      I1 => p_0_in5_in,
      I2 => rx_v_d_r(0),
      I3 => rx_v_d_r(1),
      I4 => rx_v_d_r(3),
      I5 => rx_v_d_r(2),
      O => got_v_c
    );
GOT_V_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => got_v_c,
      Q => got_v_i,
      R => '0'
    );
RX_CC_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(2),
      I1 => rx_cc_r(3),
      I2 => rx_cc_r(1),
      I3 => rx_ecp_d_r(0),
      I4 => p_2_in,
      I5 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_CC_i_1_n_0
    );
RX_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_CC_i_1_n_0,
      Q => D(0),
      R => '0'
    );
RX_ECP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(2),
      I1 => rx_ecp_d_r(3),
      I2 => \rx_pe_control_r_reg_n_0_[1]\,
      I3 => p_2_in,
      I4 => rx_ecp_d_r(1),
      I5 => rx_ecp_d_r(0),
      O => RX_ECP_i_1_n_0
    );
RX_ECP_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_ECP_i_1_n_0,
      Q => \^rx_eof_n_reg\,
      R => '0'
    );
RX_EOF_N_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_eof_n_reg\,
      O => RX_EOF_N_reg_0
    );
\RX_FC_NB_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(8),
      Q => \storage_r_reg[0]\(7),
      R => '0'
    );
\RX_FC_NB_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(9),
      Q => \storage_r_reg[0]\(6),
      R => '0'
    );
\RX_FC_NB_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(10),
      Q => \storage_r_reg[0]\(5),
      R => '0'
    );
\RX_FC_NB_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(11),
      Q => \storage_r_reg[0]\(4),
      R => '0'
    );
RX_NEG_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F888"
    )
        port map (
      I0 => rx_spa_neg_d_r(1),
      I1 => rx_spa_neg_d_r(0),
      I2 => rx_sp_neg_d_r(1),
      I3 => rx_sp_neg_d_r(0),
      I4 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_NEG0
    );
RX_NEG_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_NEG0,
      Q => RX_NEG,
      R => '0'
    );
RX_PAD_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => rx_pad_d_r(0),
      I1 => rx_spa_d_r(3),
      I2 => p_2_in,
      I3 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_PAD0
    );
RX_PAD_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_PAD0,
      Q => rx_pad_i,
      R => '0'
    );
RX_PE_DATA_V_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => got_v_c,
      I1 => rx_sp_c,
      I2 => p_2_in,
      O => RX_PE_DATA_V_i_1_n_0
    );
RX_PE_DATA_V_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_PE_DATA_V_i_1_n_0,
      Q => \^rx_pe_data_v_i\,
      R => '0'
    );
\RX_PE_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(0),
      Q => \storage_r_reg[0]\(15),
      R => '0'
    );
\RX_PE_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(12),
      Q => \storage_r_reg[0]\(3),
      R => '0'
    );
\RX_PE_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(13),
      Q => \storage_r_reg[0]\(2),
      R => '0'
    );
\RX_PE_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(14),
      Q => \storage_r_reg[0]\(1),
      R => '0'
    );
\RX_PE_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(15),
      Q => \storage_r_reg[0]\(0),
      R => '0'
    );
\RX_PE_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(1),
      Q => \storage_r_reg[0]\(14),
      R => '0'
    );
\RX_PE_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(2),
      Q => \storage_r_reg[0]\(13),
      R => '0'
    );
\RX_PE_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(3),
      Q => \storage_r_reg[0]\(12),
      R => '0'
    );
\RX_PE_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(4),
      Q => \storage_r_reg[0]\(11),
      R => '0'
    );
\RX_PE_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(5),
      Q => \storage_r_reg[0]\(10),
      R => '0'
    );
\RX_PE_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(6),
      Q => \storage_r_reg[0]\(9),
      R => '0'
    );
\RX_PE_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pe_data_r(7),
      Q => \storage_r_reg[0]\(8),
      R => '0'
    );
RX_SCP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(2),
      I1 => rx_scp_d_r(3),
      I2 => \rx_pe_control_r_reg_n_0_[1]\,
      I3 => p_2_in,
      I4 => rx_snf_d_r(1),
      I5 => rx_scp_d_r(0),
      O => RX_SCP_i_1_n_0
    );
RX_SCP_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_SCP_i_1_n_0,
      Q => \^rx_scp_i\,
      R => '0'
    );
RX_SNF_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => rx_snf_d_r(1),
      I1 => p_2_in,
      I2 => rx_snf_d_r(0),
      O => RX_SNF_i_1_n_0
    );
RX_SNF_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_SNF_i_1_n_0,
      Q => m_axi_rx_snf,
      R => '0'
    );
RX_SPA_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => prev_beat_spa_r,
      I1 => p_0_in5_in,
      I2 => rx_spa_d_r(0),
      I3 => rx_snf_d_r(1),
      I4 => rx_spa_d_r(3),
      I5 => rx_spa_d_r(2),
      O => RX_SPA0
    );
RX_SPA_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => RX_SPA0,
      Q => rx_spa_i,
      R => '0'
    );
RX_SP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => prev_beat_sp_r,
      I1 => p_0_in5_in,
      I2 => rx_sp_d_r(0),
      I3 => rx_sp_d_r(1),
      I4 => rx_sp_d_r(3),
      I5 => rx_sp_d_r(2),
      O => rx_sp_c
    );
RX_SP_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[1]\,
      I1 => p_2_in,
      O => p_0_in5_in
    );
RX_SP_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_sp_c,
      Q => rx_sp_i,
      R => '0'
    );
\counter3_r_reg[2]_srl3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rx_spa_i,
      I1 => ack_r,
      O => counter3_r0
    );
\counter4_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rx_sp_i,
      I1 => ready_r,
      O => counter4_r0
    );
first_v_received_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => got_v_c,
      I1 => \^first_v_received_r\,
      O => first_v_received_r_i_1_n_0
    );
first_v_received_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => first_v_received_r_i_1_n_0,
      Q => \^first_v_received_r\,
      R => SR(0)
    );
\in_frame_r_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^rx_scp_i\,
      I1 => \^rx_eof_n_reg\,
      I2 => in_frame_r,
      O => in_frame_r_reg
    );
left_aligned_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_3,
      Q => left_aligned_r_reg_0,
      R => SR(0)
    );
prev_beat_sp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[1]\,
      I1 => \word_aligned_data_r_reg_n_0_[0]\,
      I2 => \word_aligned_data_r_reg_n_0_[2]\,
      I3 => \word_aligned_data_r_reg_n_0_[3]\,
      O => \prev_beat_sp_d_r0__0\
    );
\prev_beat_sp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[15]\,
      I1 => \word_aligned_data_r_reg_n_0_[13]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[12]\,
      O => prev_beat_sp_d_r05_out
    );
\prev_beat_sp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0180"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(2),
      O => prev_beat_sp_d_r08_out
    );
prev_beat_sp_d_r1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[12]\,
      I1 => \word_aligned_data_r_reg_n_0_[14]\,
      I2 => \word_aligned_data_r_reg_n_0_[13]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => \prev_beat_sp_d_r1__0\
    );
\prev_beat_sp_d_r1_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      O => prev_beat_sp_d_r16_in
    );
prev_beat_sp_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[1]\,
      I1 => p_2_in,
      I2 => rx_sp_d_r(2),
      I3 => rx_sp_d_r(3),
      I4 => rx_snf_d_r(1),
      I5 => prev_beat_v_d_r(0),
      O => prev_beat_sp_r0
    );
prev_beat_sp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_sp_r0,
      Q => prev_beat_sp_r,
      R => '0'
    );
prev_beat_spa_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      O => \prev_beat_spa_d_r0__0\
    );
prev_beat_spa_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[1]\,
      I1 => p_2_in,
      I2 => rx_spa_d_r(2),
      I3 => rx_spa_d_r(3),
      I4 => rx_snf_d_r(1),
      I5 => prev_beat_v_d_r(0),
      O => prev_beat_spa_r0
    );
prev_beat_spa_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_spa_r0,
      Q => prev_beat_spa_r,
      R => '0'
    );
prev_beat_v_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[13]\,
      I1 => \word_aligned_data_r_reg_n_0_[14]\,
      I2 => \word_aligned_data_r_reg_n_0_[12]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => prev_beat_v_d_r0_n_0
    );
\prev_beat_v_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      O => \prev_beat_v_d_r0__0\
    );
\prev_beat_v_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \prev_beat_sp_d_r0__0\,
      Q => prev_beat_v_d_r(0),
      R => '0'
    );
prev_beat_v_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[1]\,
      I1 => p_2_in,
      I2 => rx_v_d_r(2),
      I3 => rx_v_d_r(3),
      I4 => rx_snf_d_r(1),
      I5 => prev_beat_v_d_r(0),
      O => prev_beat_v_r0
    );
prev_beat_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_v_r0,
      Q => prev_beat_v_r,
      R => '0'
    );
rx_cc_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[12]\,
      I1 => \word_aligned_data_r_reg_n_0_[13]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => rx_cc_r0_n_0
    );
\rx_cc_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[4]\,
      I1 => \word_aligned_data_r_reg_n_0_[5]\,
      I2 => \word_aligned_data_r_reg_n_0_[6]\,
      I3 => \word_aligned_data_r_reg_n_0_[7]\,
      O => \rx_cc_r0__0\
    );
\rx_cc_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_cc_r0__0\,
      Q => rx_cc_r(1),
      R => '0'
    );
\rx_cc_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_r0_n_0,
      Q => rx_cc_r(3),
      R => '0'
    );
rx_ecp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[15]\,
      I1 => \word_aligned_data_r_reg_n_0_[13]\,
      I2 => \word_aligned_data_r_reg_n_0_[12]\,
      I3 => \word_aligned_data_r_reg_n_0_[14]\,
      O => rx_ecp_d_r0_n_0
    );
\rx_ecp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[6]\,
      I1 => \word_aligned_data_r_reg_n_0_[5]\,
      I2 => \word_aligned_data_r_reg_n_0_[4]\,
      I3 => \word_aligned_data_r_reg_n_0_[7]\,
      O => \rx_ecp_d_r0_inferred__0/i__n_0\
    );
\rx_ecp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[2]\,
      I1 => \word_aligned_data_r_reg_n_0_[3]\,
      I2 => \word_aligned_data_r_reg_n_0_[1]\,
      I3 => \word_aligned_data_r_reg_n_0_[0]\,
      O => \rx_ecp_d_r0__0\
    );
\rx_ecp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_ecp_d_r0__0\,
      Q => rx_ecp_d_r(0),
      R => '0'
    );
\rx_ecp_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_ecp_d_r0_inferred__0/i__n_0\,
      Q => rx_ecp_d_r(1),
      R => '0'
    );
\rx_ecp_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_scp_d_r0_inferred__1/i__n_0\,
      Q => rx_ecp_d_r(2),
      R => '0'
    );
\rx_ecp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_ecp_d_r0_n_0,
      Q => rx_ecp_d_r(3),
      R => '0'
    );
\rx_ll_pdu_datapath_i/storage_v_r_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => \^rx_eof_n_reg\,
      I1 => storage_v_r,
      I2 => \^rx_pe_data_v_i\,
      I3 => in_frame_r,
      O => storage_v_r_reg
    );
rx_pad_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[14]\,
      I1 => \word_aligned_data_r_reg_n_0_[15]\,
      I2 => \word_aligned_data_r_reg_n_0_[13]\,
      I3 => \word_aligned_data_r_reg_n_0_[12]\,
      O => rx_pad_d_r0_n_0
    );
\rx_pad_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => \rx_pad_d_r0__0\
    );
\rx_pad_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_pad_d_r0__0\,
      Q => rx_pad_d_r(0),
      R => '0'
    );
\rx_pe_control_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => word_aligned_control_bits_r(0),
      Q => p_2_in,
      R => '0'
    );
\rx_pe_control_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => word_aligned_control_bits_r_reg,
      Q => \rx_pe_control_r_reg_n_0_[1]\,
      R => '0'
    );
\rx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[0]\,
      Q => rx_pe_data_r(0),
      R => '0'
    );
\rx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_0_in(1),
      Q => rx_pe_data_r(10),
      R => '0'
    );
\rx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_0_in(0),
      Q => rx_pe_data_r(11),
      R => '0'
    );
\rx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[12]\,
      Q => rx_pe_data_r(12),
      R => '0'
    );
\rx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[13]\,
      Q => rx_pe_data_r(13),
      R => '0'
    );
\rx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[14]\,
      Q => rx_pe_data_r(14),
      R => '0'
    );
\rx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[15]\,
      Q => rx_pe_data_r(15),
      R => '0'
    );
\rx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[1]\,
      Q => rx_pe_data_r(1),
      R => '0'
    );
\rx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[2]\,
      Q => rx_pe_data_r(2),
      R => '0'
    );
\rx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[3]\,
      Q => rx_pe_data_r(3),
      R => '0'
    );
\rx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[4]\,
      Q => rx_pe_data_r(4),
      R => '0'
    );
\rx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[5]\,
      Q => rx_pe_data_r(5),
      R => '0'
    );
\rx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[6]\,
      Q => rx_pe_data_r(6),
      R => '0'
    );
\rx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \word_aligned_data_r_reg_n_0_[7]\,
      Q => rx_pe_data_r(7),
      R => '0'
    );
\rx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_0_in(3),
      Q => rx_pe_data_r(8),
      R => '0'
    );
\rx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_0_in(2),
      Q => rx_pe_data_r(9),
      R => '0'
    );
rx_scp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[6]\,
      I1 => \word_aligned_data_r_reg_n_0_[7]\,
      I2 => \word_aligned_data_r_reg_n_0_[5]\,
      I3 => \word_aligned_data_r_reg_n_0_[4]\,
      O => \rx_scp_d_r0__0\
    );
\rx_scp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[13]\,
      I1 => \word_aligned_data_r_reg_n_0_[12]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => \rx_scp_d_r0_inferred__0/i__n_0\
    );
\rx_scp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      I3 => p_0_in(3),
      O => \rx_scp_d_r0_inferred__1/i__n_0\
    );
\rx_scp_d_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[0]\,
      I1 => \word_aligned_data_r_reg_n_0_[2]\,
      I2 => \word_aligned_data_r_reg_n_0_[1]\,
      I3 => \word_aligned_data_r_reg_n_0_[3]\,
      O => \rx_scp_d_r0_inferred__2/i__n_0\
    );
\rx_scp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_scp_d_r0_inferred__2/i__n_0\,
      Q => rx_scp_d_r(0),
      R => '0'
    );
\rx_scp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_scp_d_r0_inferred__0/i__n_0\,
      Q => rx_scp_d_r(3),
      R => '0'
    );
rx_snf_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[2]\,
      I1 => \word_aligned_data_r_reg_n_0_[1]\,
      I2 => \word_aligned_data_r_reg_n_0_[0]\,
      I3 => \word_aligned_data_r_reg_n_0_[3]\,
      O => \rx_snf_d_r0__0\
    );
\rx_snf_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_snf_d_r0__0\,
      Q => rx_snf_d_r(0),
      R => '0'
    );
\rx_snf_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_scp_d_r0__0\,
      Q => rx_snf_d_r(1),
      R => '0'
    );
\rx_sp_d_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0180"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[3]\,
      I1 => \word_aligned_data_r_reg_n_0_[2]\,
      I2 => \word_aligned_data_r_reg_n_0_[0]\,
      I3 => \word_aligned_data_r_reg_n_0_[1]\,
      O => p_5_out(3)
    );
\rx_sp_d_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[5]\,
      I1 => \word_aligned_data_r_reg_n_0_[7]\,
      I2 => \word_aligned_data_r_reg_n_0_[6]\,
      I3 => \word_aligned_data_r_reg_n_0_[4]\,
      O => p_5_out(2)
    );
\rx_sp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_5_out(3),
      Q => rx_sp_d_r(0),
      R => '0'
    );
\rx_sp_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_5_out(2),
      Q => rx_sp_d_r(1),
      R => '0'
    );
\rx_sp_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_sp_d_r08_out,
      Q => rx_sp_d_r(2),
      R => '0'
    );
\rx_sp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_sp_d_r05_out,
      Q => rx_sp_d_r(3),
      R => '0'
    );
\rx_sp_neg_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_sp_d_r16_in,
      Q => rx_sp_neg_d_r(0),
      R => '0'
    );
\rx_sp_neg_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \prev_beat_sp_d_r1__0\,
      Q => rx_sp_neg_d_r(1),
      R => '0'
    );
rx_spa_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[1]\,
      I1 => \word_aligned_data_r_reg_n_0_[0]\,
      I2 => \word_aligned_data_r_reg_n_0_[2]\,
      I3 => \word_aligned_data_r_reg_n_0_[3]\,
      O => \rx_spa_d_r0__0\
    );
\rx_spa_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_spa_d_r0__0\,
      Q => rx_spa_d_r(0),
      R => '0'
    );
\rx_spa_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \prev_beat_spa_d_r0__0\,
      Q => rx_spa_d_r(2),
      R => '0'
    );
\rx_spa_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_pad_d_r0_n_0,
      Q => rx_spa_d_r(3),
      R => '0'
    );
rx_spa_neg_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[13]\,
      I1 => \word_aligned_data_r_reg_n_0_[12]\,
      I2 => \word_aligned_data_r_reg_n_0_[14]\,
      I3 => \word_aligned_data_r_reg_n_0_[15]\,
      O => rx_spa_neg_d_r0_n_0
    );
\rx_spa_neg_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => \rx_spa_neg_d_r0__0\
    );
\rx_spa_neg_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_spa_neg_d_r0__0\,
      Q => rx_spa_neg_d_r(0),
      R => '0'
    );
\rx_spa_neg_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_spa_neg_d_r0_n_0,
      Q => rx_spa_neg_d_r(1),
      R => '0'
    );
rx_v_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[5]\,
      I1 => \word_aligned_data_r_reg_n_0_[6]\,
      I2 => \word_aligned_data_r_reg_n_0_[4]\,
      I3 => \word_aligned_data_r_reg_n_0_[7]\,
      O => rx_v_d_r0_n_0
    );
\rx_v_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[3]\,
      I1 => \word_aligned_data_r_reg_n_0_[1]\,
      I2 => \word_aligned_data_r_reg_n_0_[0]\,
      I3 => \word_aligned_data_r_reg_n_0_[2]\,
      O => \rx_v_d_r0__0\
    );
\rx_v_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \rx_v_d_r0__0\,
      Q => rx_v_d_r(0),
      R => '0'
    );
\rx_v_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_v_d_r0_n_0,
      Q => rx_v_d_r(1),
      R => '0'
    );
\rx_v_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \prev_beat_v_d_r0__0\,
      Q => rx_v_d_r(2),
      R => '0'
    );
\rx_v_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => prev_beat_v_d_r0_n_0,
      Q => rx_v_d_r(3),
      R => '0'
    );
\word_aligned_control_bits_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_2,
      Q => word_aligned_control_bits_r(0),
      R => '0'
    );
\word_aligned_control_bits_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_1,
      Q => word_aligned_control_bits_r_reg,
      R => '0'
    );
\word_aligned_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(7),
      Q => \word_aligned_data_r_reg_n_0_[0]\,
      R => '0'
    );
\word_aligned_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(5),
      Q => p_0_in(1),
      R => '0'
    );
\word_aligned_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(4),
      Q => p_0_in(0),
      R => '0'
    );
\word_aligned_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(3),
      Q => \word_aligned_data_r_reg_n_0_[12]\,
      R => '0'
    );
\word_aligned_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(2),
      Q => \word_aligned_data_r_reg_n_0_[13]\,
      R => '0'
    );
\word_aligned_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(1),
      Q => \word_aligned_data_r_reg_n_0_[14]\,
      R => '0'
    );
\word_aligned_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(0),
      Q => \word_aligned_data_r_reg_n_0_[15]\,
      R => '0'
    );
\word_aligned_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(6),
      Q => \word_aligned_data_r_reg_n_0_[1]\,
      R => '0'
    );
\word_aligned_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(5),
      Q => \word_aligned_data_r_reg_n_0_[2]\,
      R => '0'
    );
\word_aligned_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(4),
      Q => \word_aligned_data_r_reg_n_0_[3]\,
      R => '0'
    );
\word_aligned_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(3),
      Q => \word_aligned_data_r_reg_n_0_[4]\,
      R => '0'
    );
\word_aligned_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(2),
      Q => \word_aligned_data_r_reg_n_0_[5]\,
      R => '0'
    );
\word_aligned_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(1),
      Q => \word_aligned_data_r_reg_n_0_[6]\,
      R => '0'
    );
\word_aligned_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_5(0),
      Q => \word_aligned_data_r_reg_n_0_[7]\,
      R => '0'
    );
\word_aligned_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(7),
      Q => p_0_in(3),
      R => '0'
    );
\word_aligned_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => left_aligned_r_reg_4(6),
      Q => p_0_in(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_SYM_GEN is
  port (
    TXCHARISK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \counter2_r_reg[15]\ : out STD_LOGIC;
    TXDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gen_pad_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    gen_spa_data_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_pe_data_v_i : in STD_LOGIC;
    gen_k_i : in STD_LOGIC;
    gen_cc_i : in STD_LOGIC;
    gen_snf_i : in STD_LOGIC;
    gen_ecp_i : in STD_LOGIC;
    gen_scp_i : in STD_LOGIC;
    gen_a_i : in STD_LOGIC;
    ack_r : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_v_flop_0_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_r_flop_0_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_k_flop_0_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \FC_NB_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_SYM_GEN : entity is "merger_aurora_SYM_GEN";
end merger_aurora_merger_aurora_SYM_GEN;

architecture STRUCTURE of merger_aurora_merger_aurora_SYM_GEN is
  signal \TX_CHAR_IS_K[0]_i_2_n_0\ : STD_LOGIC;
  signal TX_CHAR_IS_K_reg0 : STD_LOGIC;
  signal TX_CHAR_IS_K_reg04_out : STD_LOGIC;
  signal \TX_DATA[0]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[10]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[10]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[11]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_5_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_5_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_6_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_7_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_8_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_9_n_0\ : STD_LOGIC;
  signal \TX_DATA[1]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[2]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[3]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[4]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_5_n_0\ : STD_LOGIC;
  signal \TX_DATA[8]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[8]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[9]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[9]_i_2_n_0\ : STD_LOGIC;
  signal TX_DATA_reg0 : STD_LOGIC;
  signal \^counter2_r_reg[15]\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal fc_nb_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal gen_a_r : STD_LOGIC;
  signal gen_cc_r : STD_LOGIC;
  signal gen_ecp_r : STD_LOGIC;
  signal gen_k_fsm_r : STD_LOGIC;
  signal \gen_k_r_reg_n_0_[1]\ : STD_LOGIC;
  signal gen_pad_r : STD_LOGIC;
  signal \gen_r_r_reg_n_0_[1]\ : STD_LOGIC;
  signal gen_scp_r : STD_LOGIC;
  signal gen_snf_r : STD_LOGIC;
  signal \gen_sp_data_r_reg_n_0_[1]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_0_in4_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[9]\ : STD_LOGIC;
  signal tx_pe_data_v_r : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \TX_CHAR_IS_K[0]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \TX_CHAR_IS_K[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \TX_DATA[12]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \TX_DATA[12]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \TX_DATA[13]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \TX_DATA[14]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \TX_DATA[14]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_3\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_4\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_6\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_9\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \TX_DATA[5]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \TX_DATA[5]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \TX_DATA[7]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \TX_DATA[8]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \TX_DATA[9]_i_2\ : label is "soft_lutpair29";
begin
  \counter2_r_reg[15]\ <= \^counter2_r_reg[15]\;
\TX_CHAR_IS_K[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCFCCCD"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => gen_cc_r,
      I2 => \TX_CHAR_IS_K[0]_i_2_n_0\,
      I3 => gen_snf_r,
      I4 => gen_pad_r,
      I5 => \gen_sp_data_r_reg_n_0_[1]\,
      O => TX_CHAR_IS_K_reg0
    );
\TX_CHAR_IS_K[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^counter2_r_reg[15]\,
      I1 => p_3_in,
      O => \TX_CHAR_IS_K[0]_i_2_n_0\
    );
\TX_CHAR_IS_K[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => p_2_in,
      I1 => p_0_in1_in,
      I2 => p_1_in,
      I3 => tx_pe_data_v_r,
      I4 => gen_cc_r,
      O => TX_CHAR_IS_K_reg04_out
    );
\TX_CHAR_IS_K_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => TX_CHAR_IS_K_reg0,
      Q => TXCHARISK(1),
      R => '0'
    );
\TX_CHAR_IS_K_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => TX_CHAR_IS_K_reg04_out,
      Q => TXCHARISK(0),
      R => '0'
    );
\TX_DATA[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFAEAEAE"
    )
        port map (
      I0 => gen_scp_r,
      I1 => gen_cc_r,
      I2 => \TX_DATA[15]_i_3_n_0\,
      I3 => \TX_DATA[5]_i_2_n_0\,
      I4 => \tx_pe_data_r_reg_n_0_[15]\,
      I5 => gen_ecp_r,
      O => \TX_DATA[0]_i_1_n_0\
    );
\TX_DATA[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => gen_scp_r,
      I1 => gen_ecp_r,
      I2 => gen_snf_r,
      I3 => gen_k_fsm_r,
      I4 => gen_cc_r,
      I5 => \TX_DATA[10]_i_2_n_0\,
      O => \TX_DATA[10]_i_1_n_0\
    );
\TX_DATA[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCC00AA00FA"
    )
        port map (
      I0 => p_1_in,
      I1 => data0(2),
      I2 => \TX_DATA[15]_i_7_n_0\,
      I3 => p_0_in1_in,
      I4 => p_2_in,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[10]_i_2_n_0\
    );
\TX_DATA[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFFFFEEEEFFEF"
    )
        port map (
      I0 => \TX_DATA[15]_i_4_n_0\,
      I1 => gen_snf_r,
      I2 => tx_pe_data_v_r,
      I3 => gen_k_fsm_r,
      I4 => gen_cc_r,
      I5 => data0(3),
      O => \TX_DATA[11]_i_1_n_0\
    );
\TX_DATA[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF888"
    )
        port map (
      I0 => \TX_DATA[12]_i_2_n_0\,
      I1 => \TX_DATA[15]_i_7_n_0\,
      I2 => tx_pe_data_v_r,
      I3 => data0(4),
      I4 => \TX_DATA[12]_i_3_n_0\,
      I5 => \TX_DATA[15]_i_6_n_0\,
      O => \TX_DATA[12]_i_1_n_0\
    );
\TX_DATA[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => p_1_in,
      I2 => p_0_in1_in,
      I3 => p_2_in,
      O => \TX_DATA[12]_i_2_n_0\
    );
\TX_DATA[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => gen_scp_r,
      I1 => gen_ecp_r,
      I2 => gen_snf_r,
      O => \TX_DATA[12]_i_3_n_0\
    );
\TX_DATA[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE0"
    )
        port map (
      I0 => gen_a_r,
      I1 => p_0_in4_in,
      I2 => \TX_DATA[13]_i_2_n_0\,
      I3 => \TX_DATA[13]_i_3_n_0\,
      I4 => \TX_DATA[13]_i_4_n_0\,
      I5 => \TX_DATA[13]_i_5_n_0\,
      O => \TX_DATA[13]_i_1_n_0\
    );
\TX_DATA[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => gen_scp_r,
      I1 => p_0_in1_in,
      I2 => gen_snf_r,
      I3 => tx_pe_data_v_r,
      O => \TX_DATA[13]_i_2_n_0\
    );
\TX_DATA[13]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gen_ecp_r,
      I1 => gen_scp_r,
      O => \TX_DATA[13]_i_3_n_0\
    );
\TX_DATA[13]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0022000300220000"
    )
        port map (
      I0 => data0(5),
      I1 => gen_scp_r,
      I2 => p_0_in1_in,
      I3 => gen_snf_r,
      I4 => tx_pe_data_v_r,
      I5 => p_2_in,
      O => \TX_DATA[13]_i_4_n_0\
    );
\TX_DATA[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF10FFFF10101010"
    )
        port map (
      I0 => gen_scp_r,
      I1 => gen_snf_r,
      I2 => \TX_DATA[15]_i_6_n_0\,
      I3 => p_1_in,
      I4 => p_0_in,
      I5 => \TX_DATA[13]_i_2_n_0\,
      O => \TX_DATA[13]_i_5_n_0\
    );
\TX_DATA[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAAEA"
    )
        port map (
      I0 => gen_cc_r,
      I1 => data0(6),
      I2 => tx_pe_data_v_r,
      I3 => gen_k_fsm_r,
      I4 => \TX_DATA[14]_i_2_n_0\,
      O => \TX_DATA[14]_i_1_n_0\
    );
\TX_DATA[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAEEAAFE"
    )
        port map (
      I0 => \TX_DATA[12]_i_3_n_0\,
      I1 => p_0_in1_in,
      I2 => \TX_DATA[14]_i_3_n_0\,
      I3 => tx_pe_data_v_r,
      I4 => p_1_in,
      I5 => gen_k_fsm_r,
      O => \TX_DATA[14]_i_2_n_0\
    );
\TX_DATA[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF1"
    )
        port map (
      I0 => p_0_in,
      I1 => p_0_in4_in,
      I2 => gen_a_r,
      I3 => p_2_in,
      O => \TX_DATA[14]_i_3_n_0\
    );
\TX_DATA[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \TX_DATA[15]_i_3_n_0\,
      I1 => \TX_DATA[15]_i_4_n_0\,
      I2 => \TX_DATA[15]_i_5_n_0\,
      I3 => \TX_DATA[15]_i_6_n_0\,
      I4 => p_1_in,
      I5 => \TX_DATA[15]_i_7_n_0\,
      O => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFFFFAAAAFFFE"
    )
        port map (
      I0 => \TX_DATA[15]_i_8_n_0\,
      I1 => gen_cc_r,
      I2 => gen_k_fsm_r,
      I3 => gen_ecp_r,
      I4 => gen_scp_r,
      I5 => gen_snf_r,
      O => \TX_DATA[15]_i_2_n_0\
    );
\TX_DATA[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => gen_snf_r,
      O => \TX_DATA[15]_i_3_n_0\
    );
\TX_DATA[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gen_ecp_r,
      I1 => gen_scp_r,
      O => \TX_DATA[15]_i_4_n_0\
    );
\TX_DATA[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_2_in,
      I1 => p_0_in1_in,
      O => \TX_DATA[15]_i_5_n_0\
    );
\TX_DATA[15]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gen_k_fsm_r,
      I1 => gen_cc_r,
      O => \TX_DATA[15]_i_6_n_0\
    );
\TX_DATA[15]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_0_in4_in,
      I1 => gen_a_r,
      I2 => p_0_in,
      O => \TX_DATA[15]_i_7_n_0\
    );
\TX_DATA[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0A00000A0A000C"
    )
        port map (
      I0 => data0(7),
      I1 => \TX_DATA[15]_i_9_n_0\,
      I2 => gen_scp_r,
      I3 => p_0_in1_in,
      I4 => tx_pe_data_v_r,
      I5 => p_1_in,
      O => \TX_DATA[15]_i_8_n_0\
    );
\TX_DATA[15]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF45"
    )
        port map (
      I0 => gen_a_r,
      I1 => p_0_in4_in,
      I2 => p_0_in,
      I3 => p_2_in,
      O => \TX_DATA[15]_i_9_n_0\
    );
\TX_DATA[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F2F2F0F0FFF0"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[14]\,
      I1 => gen_pad_r,
      I2 => \TX_DATA[5]_i_3_n_0\,
      I3 => \gen_sp_data_r_reg_n_0_[1]\,
      I4 => gen_snf_r,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[1]_i_1_n_0\
    );
\TX_DATA[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAFAAAAAAAEAA"
    )
        port map (
      I0 => \TX_DATA[2]_i_2_n_0\,
      I1 => gen_pad_r,
      I2 => gen_snf_r,
      I3 => tx_pe_data_v_r,
      I4 => gen_scp_r,
      I5 => \tx_pe_data_r_reg_n_0_[13]\,
      O => \TX_DATA[2]_i_1_n_0\
    );
\TX_DATA[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEEFE"
    )
        port map (
      I0 => gen_ecp_r,
      I1 => gen_cc_r,
      I2 => \TX_DATA[6]_i_3_n_0\,
      I3 => \gen_sp_data_r_reg_n_0_[1]\,
      I4 => \TX_DATA[15]_i_3_n_0\,
      I5 => gen_scp_r,
      O => \TX_DATA[2]_i_2_n_0\
    );
\TX_DATA[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFF0F5F0FCF0F5"
    )
        port map (
      I0 => gen_cc_r,
      I1 => \tx_pe_data_r_reg_n_0_[12]\,
      I2 => \TX_DATA[15]_i_4_n_0\,
      I3 => gen_snf_r,
      I4 => tx_pe_data_v_r,
      I5 => gen_pad_r,
      O => \TX_DATA[3]_i_1_n_0\
    );
\TX_DATA[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFB888"
    )
        port map (
      I0 => fc_nb_r(3),
      I1 => gen_snf_r,
      I2 => \tx_pe_data_r_reg_n_0_[11]\,
      I3 => tx_pe_data_v_r,
      I4 => \TX_DATA[4]_i_2_n_0\,
      I5 => \TX_DATA[7]_i_5_n_0\,
      O => \TX_DATA[4]_i_1_n_0\
    );
\TX_DATA[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000E"
    )
        port map (
      I0 => \gen_r_r_reg_n_0_[1]\,
      I1 => \gen_k_r_reg_n_0_[1]\,
      I2 => \TX_DATA[15]_i_3_n_0\,
      I3 => \gen_sp_data_r_reg_n_0_[1]\,
      I4 => \^counter2_r_reg[15]\,
      I5 => p_3_in,
      O => \TX_DATA[4]_i_2_n_0\
    );
\TX_DATA[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF888"
    )
        port map (
      I0 => gen_snf_r,
      I1 => fc_nb_r(2),
      I2 => \tx_pe_data_r_reg_n_0_[10]\,
      I3 => \TX_DATA[5]_i_2_n_0\,
      I4 => \TX_DATA[5]_i_3_n_0\,
      I5 => \TX_DATA[5]_i_4_n_0\,
      O => \TX_DATA[5]_i_1_n_0\
    );
\TX_DATA[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => gen_snf_r,
      I1 => tx_pe_data_v_r,
      I2 => gen_pad_r,
      O => \TX_DATA[5]_i_2_n_0\
    );
\TX_DATA[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF10"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => gen_snf_r,
      I2 => gen_cc_r,
      I3 => gen_scp_r,
      I4 => gen_ecp_r,
      O => \TX_DATA[5]_i_3_n_0\
    );
\TX_DATA[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F000E000F000F"
    )
        port map (
      I0 => \^counter2_r_reg[15]\,
      I1 => p_3_in,
      I2 => \TX_DATA[15]_i_3_n_0\,
      I3 => \gen_sp_data_r_reg_n_0_[1]\,
      I4 => \gen_k_r_reg_n_0_[1]\,
      I5 => \gen_r_r_reg_n_0_[1]\,
      O => \TX_DATA[5]_i_4_n_0\
    );
\TX_DATA[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBBFFFFFFBA"
    )
        port map (
      I0 => \TX_DATA[6]_i_2_n_0\,
      I1 => \TX_DATA[15]_i_3_n_0\,
      I2 => gen_cc_r,
      I3 => gen_scp_r,
      I4 => gen_ecp_r,
      I5 => \gen_sp_data_r_reg_n_0_[1]\,
      O => \TX_DATA[6]_i_1_n_0\
    );
\TX_DATA[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F04400F0F044FF"
    )
        port map (
      I0 => gen_pad_r,
      I1 => \tx_pe_data_r_reg_n_0_[9]\,
      I2 => fc_nb_r(1),
      I3 => tx_pe_data_v_r,
      I4 => gen_snf_r,
      I5 => \TX_DATA[6]_i_3_n_0\,
      O => \TX_DATA[6]_i_2_n_0\
    );
\TX_DATA[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAFE"
    )
        port map (
      I0 => \^counter2_r_reg[15]\,
      I1 => \gen_k_r_reg_n_0_[1]\,
      I2 => \gen_r_r_reg_n_0_[1]\,
      I3 => p_3_in,
      O => \TX_DATA[6]_i_3_n_0\
    );
\TX_DATA[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[1]\,
      I1 => \gen_r_r_reg_n_0_[1]\,
      I2 => gen_cc_r,
      I3 => gen_scp_r,
      I4 => gen_ecp_r,
      I5 => \TX_DATA[7]_i_3_n_0\,
      O => TX_DATA_reg0
    );
\TX_DATA[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFB888"
    )
        port map (
      I0 => fc_nb_r(0),
      I1 => gen_snf_r,
      I2 => tx_pe_data_v_r,
      I3 => \tx_pe_data_r_reg_n_0_[8]\,
      I4 => \TX_DATA[7]_i_4_n_0\,
      I5 => \TX_DATA[7]_i_5_n_0\,
      O => \TX_DATA[7]_i_2_n_0\
    );
\TX_DATA[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => p_3_in,
      I1 => \^counter2_r_reg[15]\,
      I2 => \gen_sp_data_r_reg_n_0_[1]\,
      I3 => tx_pe_data_v_r,
      I4 => gen_snf_r,
      O => \TX_DATA[7]_i_3_n_0\
    );
\TX_DATA[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010001010101"
    )
        port map (
      I0 => \^counter2_r_reg[15]\,
      I1 => \TX_DATA[15]_i_3_n_0\,
      I2 => \gen_sp_data_r_reg_n_0_[1]\,
      I3 => p_3_in,
      I4 => \gen_k_r_reg_n_0_[1]\,
      I5 => \gen_r_r_reg_n_0_[1]\,
      O => \TX_DATA[7]_i_4_n_0\
    );
\TX_DATA[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFCFEFEFCFCFFFC"
    )
        port map (
      I0 => gen_pad_r,
      I1 => gen_ecp_r,
      I2 => gen_scp_r,
      I3 => gen_cc_r,
      I4 => gen_snf_r,
      I5 => tx_pe_data_v_r,
      O => \TX_DATA[7]_i_5_n_0\
    );
\TX_DATA[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \TX_DATA[8]_i_2_n_0\,
      I1 => gen_scp_r,
      I2 => gen_ecp_r,
      O => \TX_DATA[8]_i_1_n_0\
    );
\TX_DATA[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FF08"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => data0(0),
      I2 => gen_k_fsm_r,
      I3 => gen_cc_r,
      I4 => gen_snf_r,
      I5 => gen_scp_r,
      O => \TX_DATA[8]_i_2_n_0\
    );
\TX_DATA[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000F00020002"
    )
        port map (
      I0 => \TX_DATA[9]_i_2_n_0\,
      I1 => gen_k_fsm_r,
      I2 => gen_scp_r,
      I3 => gen_ecp_r,
      I4 => gen_snf_r,
      I5 => gen_cc_r,
      O => \TX_DATA[9]_i_1_n_0\
    );
\TX_DATA[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0B08"
    )
        port map (
      I0 => data0(1),
      I1 => tx_pe_data_v_r,
      I2 => gen_snf_r,
      I3 => p_0_in1_in,
      O => \TX_DATA[9]_i_2_n_0\
    );
\TX_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[0]_i_1_n_0\,
      Q => TXDATA(8),
      R => '0'
    );
\TX_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[10]_i_1_n_0\,
      Q => TXDATA(2),
      R => '0'
    );
\TX_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[11]_i_1_n_0\,
      Q => TXDATA(3),
      R => '0'
    );
\TX_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[12]_i_1_n_0\,
      Q => TXDATA(4),
      R => '0'
    );
\TX_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[13]_i_1_n_0\,
      Q => TXDATA(5),
      R => '0'
    );
\TX_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[14]_i_1_n_0\,
      Q => TXDATA(6),
      R => '0'
    );
\TX_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[15]_i_2_n_0\,
      Q => TXDATA(7),
      R => '0'
    );
\TX_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[1]_i_1_n_0\,
      Q => TXDATA(9),
      R => '0'
    );
\TX_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[2]_i_1_n_0\,
      Q => TXDATA(10),
      R => '0'
    );
\TX_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[3]_i_1_n_0\,
      Q => TXDATA(11),
      R => '0'
    );
\TX_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[4]_i_1_n_0\,
      Q => TXDATA(12),
      R => '0'
    );
\TX_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[5]_i_1_n_0\,
      Q => TXDATA(13),
      R => '0'
    );
\TX_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[6]_i_1_n_0\,
      Q => TXDATA(14),
      R => '0'
    );
\TX_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => TX_DATA_reg0,
      D => \TX_DATA[7]_i_2_n_0\,
      Q => TXDATA(15),
      R => '0'
    );
\TX_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[8]_i_1_n_0\,
      Q => TXDATA(0),
      R => '0'
    );
\TX_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \TX_DATA[15]_i_1_n_0\,
      D => \TX_DATA[9]_i_1_n_0\,
      Q => TXDATA(1),
      R => '0'
    );
\fc_nb_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \FC_NB_reg[0]\(3),
      Q => fc_nb_r(0),
      R => '0'
    );
\fc_nb_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \FC_NB_reg[0]\(2),
      Q => fc_nb_r(1),
      R => '0'
    );
\fc_nb_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \FC_NB_reg[0]\(1),
      Q => fc_nb_r(2),
      R => '0'
    );
\fc_nb_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \FC_NB_reg[0]\(0),
      Q => fc_nb_r(3),
      R => '0'
    );
gen_a_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_a_i,
      Q => gen_a_r,
      R => '0'
    );
gen_cc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_cc_i,
      Q => gen_cc_r,
      R => '0'
    );
gen_ecp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_ecp_i,
      Q => gen_ecp_r,
      R => '0'
    );
gen_k_fsm_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_k_i,
      Q => gen_k_fsm_r,
      R => '0'
    );
\gen_k_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_k_flop_0_i(1),
      Q => p_0_in4_in,
      R => '0'
    );
\gen_k_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_k_flop_0_i(0),
      Q => \gen_k_r_reg_n_0_[1]\,
      R => '0'
    );
gen_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_pad_i,
      Q => gen_pad_r,
      R => '0'
    );
\gen_r_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_r_flop_0_i(1),
      Q => p_0_in,
      R => '0'
    );
\gen_r_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_r_flop_0_i(0),
      Q => \gen_r_r_reg_n_0_[1]\,
      R => '0'
    );
gen_scp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_scp_i,
      Q => gen_scp_r,
      R => '0'
    );
gen_snf_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_snf_i,
      Q => gen_snf_r,
      R => '0'
    );
\gen_sp_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => D(1),
      Q => p_0_in1_in,
      R => '0'
    );
\gen_sp_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => D(0),
      Q => \gen_sp_data_r_reg_n_0_[1]\,
      R => '0'
    );
\gen_spa_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_spa_data_i(0),
      Q => p_1_in,
      R => '0'
    );
\gen_spa_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => ack_r,
      Q => \^counter2_r_reg[15]\,
      R => '0'
    );
\gen_v_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_v_flop_0_i(1),
      Q => p_2_in,
      R => '0'
    );
\gen_v_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gen_v_flop_0_i(0),
      Q => p_3_in,
      R => '0'
    );
\tx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(15),
      Q => data0(7),
      R => '0'
    );
\tx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(5),
      Q => \tx_pe_data_r_reg_n_0_[10]\,
      R => '0'
    );
\tx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(4),
      Q => \tx_pe_data_r_reg_n_0_[11]\,
      R => '0'
    );
\tx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(3),
      Q => \tx_pe_data_r_reg_n_0_[12]\,
      R => '0'
    );
\tx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(2),
      Q => \tx_pe_data_r_reg_n_0_[13]\,
      R => '0'
    );
\tx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(1),
      Q => \tx_pe_data_r_reg_n_0_[14]\,
      R => '0'
    );
\tx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(0),
      Q => \tx_pe_data_r_reg_n_0_[15]\,
      R => '0'
    );
\tx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(14),
      Q => data0(6),
      R => '0'
    );
\tx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(13),
      Q => data0(5),
      R => '0'
    );
\tx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(12),
      Q => data0(4),
      R => '0'
    );
\tx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(11),
      Q => data0(3),
      R => '0'
    );
\tx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(10),
      Q => data0(2),
      R => '0'
    );
\tx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(9),
      Q => data0(1),
      R => '0'
    );
\tx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(8),
      Q => data0(0),
      R => '0'
    );
\tx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(7),
      Q => \tx_pe_data_r_reg_n_0_[8]\,
      R => '0'
    );
\tx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q(6),
      Q => \tx_pe_data_r_reg_n_0_[9]\,
      R => '0'
    );
tx_pe_data_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_v_i,
      Q => tx_pe_data_v_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_TX_LL_CONTROL is
  port (
    gen_cc_i : out STD_LOGIC;
    gen_cc_flop_0_i_0 : out STD_LOGIC;
    s_axi_nfc_tx_tready : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    GEN_ECP_reg_0 : out STD_LOGIC;
    idle_r : out STD_LOGIC;
    GEN_ECP_reg_1 : out STD_LOGIC;
    storage_v_r_reg : out STD_LOGIC;
    gen_scp_i : out STD_LOGIC;
    gen_ecp_i : out STD_LOGIC;
    gen_snf_i : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    in_frame_c : out STD_LOGIC;
    GEN_PAD0 : out STD_LOGIC;
    TX_PE_DATA_V0 : out STD_LOGIC;
    \fc_nb_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    p_0_in_0 : in STD_LOGIC;
    do_nfc_r : in STD_LOGIC;
    Q : in STD_LOGIC;
    next_sof_data_eof_1_c : in STD_LOGIC;
    next_sof_c : in STD_LOGIC;
    \nfc_counter_r_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \do_eof_c__0\ : in STD_LOGIC;
    tx_eof_crc : in STD_LOGIC;
    tx_src_rdy_crc : in STD_LOGIC;
    tx_sof_crc : in STD_LOGIC;
    in_frame_r_reg : in STD_LOGIC;
    s_axi_nfc_req : in STD_LOGIC;
    warn_cc : in STD_LOGIC;
    gen_pad_r : in STD_LOGIC;
    tx_pe_data_v_r : in STD_LOGIC;
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_TX_LL_CONTROL : entity is "merger_aurora_TX_LL_CONTROL";
end merger_aurora_merger_aurora_TX_LL_CONTROL;

architecture STRUCTURE of merger_aurora_merger_aurora_TX_LL_CONTROL is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GEN_ECP0 : STD_LOGIC;
  signal \^gen_ecp_reg_0\ : STD_LOGIC;
  signal \^gen_ecp_reg_1\ : STD_LOGIC;
  signal GEN_SCP0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_2_n_0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_3_n_0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_4_n_0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_6_n_0 : STD_LOGIC;
  signal data_eof_1_r : STD_LOGIC;
  signal data_eof_2_r : STD_LOGIC;
  signal data_r : STD_LOGIC;
  signal \^gen_cc_flop_0_i_0\ : STD_LOGIC;
  signal \^idle_r\ : STD_LOGIC;
  signal next_data_c : STD_LOGIC;
  signal next_data_eof_1_c : STD_LOGIC;
  signal next_idle_c : STD_LOGIC;
  signal \^s_axi_nfc_tx_tready\ : STD_LOGIC;
  signal sof_data_eof_1_r : STD_LOGIC;
  signal sof_data_eof_2_r : STD_LOGIC;
  signal sof_r : STD_LOGIC;
  signal \^storage_v_r_reg\ : STD_LOGIC;
  signal tx_dst_rdy_n_c : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of GEN_ECP_i_1 : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of GEN_PAD_i_1 : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of GEN_SCP_i_1 : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of TX_DST_RDY_N_i_2 : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of TX_DST_RDY_N_i_6 : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of TX_PE_DATA_V_i_1 : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of data_eof_1_r_i_1 : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of data_r_i_1 : label is "soft_lutpair118";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gen_cc_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gen_cc_flop_0_i : label is "FDR";
  attribute SOFT_HLUTNM of idle_r_i_1 : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of storage_v_r_i_2 : label is "soft_lutpair122";
begin
  E(0) <= \^e\(0);
  GEN_ECP_reg_0 <= \^gen_ecp_reg_0\;
  GEN_ECP_reg_1 <= \^gen_ecp_reg_1\;
  gen_cc_flop_0_i_0 <= \^gen_cc_flop_0_i_0\;
  idle_r <= \^idle_r\;
  s_axi_nfc_tx_tready <= \^s_axi_nfc_tx_tready\;
  storage_v_r_reg <= \^storage_v_r_reg\;
\FC_NB_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_nfc_nb(0),
      Q => \fc_nb_r_reg[0]\(3),
      R => '0'
    );
\FC_NB_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_nfc_nb(1),
      Q => \fc_nb_r_reg[0]\(2),
      R => '0'
    );
\FC_NB_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_nfc_nb(2),
      Q => \fc_nb_r_reg[0]\(1),
      R => '0'
    );
\FC_NB_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_axi_nfc_nb(3),
      Q => \fc_nb_r_reg[0]\(0),
      R => '0'
    );
GEN_ECP_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000E"
    )
        port map (
      I0 => \^gen_ecp_reg_0\,
      I1 => \^gen_ecp_reg_1\,
      I2 => \^gen_cc_flop_0_i_0\,
      I3 => \^s_axi_nfc_tx_tready\,
      O => GEN_ECP0
    );
GEN_ECP_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => GEN_ECP0,
      Q => gen_ecp_i,
      R => p_0_in_0
    );
GEN_PAD_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => gen_pad_r,
      I1 => \^gen_cc_flop_0_i_0\,
      I2 => \^s_axi_nfc_tx_tready\,
      O => GEN_PAD0
    );
GEN_SCP_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0302"
    )
        port map (
      I0 => sof_r,
      I1 => \^s_axi_nfc_tx_tready\,
      I2 => \^gen_cc_flop_0_i_0\,
      I3 => sof_data_eof_1_r,
      O => GEN_SCP0
    );
GEN_SCP_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => GEN_SCP0,
      Q => gen_scp_i,
      R => p_0_in_0
    );
GEN_SNF_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^s_axi_nfc_tx_tready\,
      Q => gen_snf_i,
      R => p_0_in_0
    );
TX_DST_RDY_N_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => TX_DST_RDY_N_i_2_n_0,
      I1 => Q,
      I2 => sof_data_eof_1_r,
      I3 => \nfc_counter_r_reg[0]\(0),
      I4 => data_eof_1_r,
      I5 => TX_DST_RDY_N_i_3_n_0,
      O => tx_dst_rdy_n_c
    );
TX_DST_RDY_N_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA88AAF8"
    )
        port map (
      I0 => sof_data_eof_2_r,
      I1 => \^gen_cc_flop_0_i_0\,
      I2 => s_axi_nfc_req,
      I3 => \^s_axi_nfc_tx_tready\,
      I4 => warn_cc,
      O => TX_DST_RDY_N_i_2_n_0
    );
TX_DST_RDY_N_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFFC0000"
    )
        port map (
      I0 => data_eof_2_r,
      I1 => TX_DST_RDY_N_i_4_n_0,
      I2 => sof_r,
      I3 => data_r,
      I4 => \do_eof_c__0\,
      I5 => TX_DST_RDY_N_i_6_n_0,
      O => TX_DST_RDY_N_i_3_n_0
    );
TX_DST_RDY_N_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000FE"
    )
        port map (
      I0 => \^idle_r\,
      I1 => \^gen_ecp_reg_1\,
      I2 => \^gen_ecp_reg_0\,
      I3 => tx_sof_crc,
      I4 => tx_src_rdy_crc,
      I5 => \^storage_v_r_reg\,
      O => TX_DST_RDY_N_i_4_n_0
    );
TX_DST_RDY_N_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^s_axi_nfc_tx_tready\,
      I1 => \^gen_cc_flop_0_i_0\,
      O => TX_DST_RDY_N_i_6_n_0
    );
TX_DST_RDY_N_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_dst_rdy_n_c,
      Q => \^storage_v_r_reg\,
      S => p_0_in_0
    );
TX_PE_DATA_V_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => tx_pe_data_v_r,
      I1 => \^gen_cc_flop_0_i_0\,
      I2 => \^s_axi_nfc_tx_tready\,
      O => TX_PE_DATA_V0
    );
data_eof_1_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000000E"
    )
        port map (
      I0 => sof_r,
      I1 => data_r,
      I2 => tx_eof_crc,
      I3 => tx_src_rdy_crc,
      I4 => \^storage_v_r_reg\,
      O => next_data_eof_1_c
    );
data_eof_1_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => next_data_eof_1_c,
      Q => data_eof_1_r,
      R => p_0_in_0
    );
data_eof_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => data_eof_1_r,
      Q => data_eof_2_r,
      R => p_0_in_0
    );
data_eof_3_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => data_eof_2_r,
      Q => \^gen_ecp_reg_0\,
      R => p_0_in_0
    );
data_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEEEEEE0"
    )
        port map (
      I0 => sof_r,
      I1 => data_r,
      I2 => tx_eof_crc,
      I3 => tx_src_rdy_crc,
      I4 => \^storage_v_r_reg\,
      O => next_data_c
    );
data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => next_data_c,
      Q => data_r,
      R => p_0_in_0
    );
do_cc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => Q,
      Q => \^gen_cc_flop_0_i_0\,
      R => '0'
    );
do_nfc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => do_nfc_r,
      Q => \^s_axi_nfc_tx_tready\,
      R => p_0_in_0
    );
gen_cc_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^gen_cc_flop_0_i_0\,
      Q => gen_cc_i,
      R => '0'
    );
idle_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^storage_v_r_reg\,
      O => p_0_in
    );
\idle_r_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFEFEFE00"
    )
        port map (
      I0 => \^idle_r\,
      I1 => \^gen_ecp_reg_1\,
      I2 => \^gen_ecp_reg_0\,
      I3 => tx_sof_crc,
      I4 => tx_src_rdy_crc,
      I5 => \^storage_v_r_reg\,
      O => next_idle_c
    );
idle_r_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => next_idle_c,
      Q => \^idle_r\,
      S => p_0_in_0
    );
sof_data_eof_1_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => next_sof_data_eof_1_c,
      Q => sof_data_eof_1_r,
      R => p_0_in_0
    );
sof_data_eof_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => sof_data_eof_1_r,
      Q => sof_data_eof_2_r,
      R => p_0_in_0
    );
sof_data_eof_3_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => sof_data_eof_2_r,
      Q => \^gen_ecp_reg_1\,
      R => p_0_in_0
    );
sof_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => \^e\(0),
      D => next_sof_c,
      Q => sof_r,
      R => p_0_in_0
    );
storage_v_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^gen_cc_flop_0_i_0\,
      I1 => \^s_axi_nfc_tx_tready\,
      O => \^e\(0)
    );
storage_v_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1101"
    )
        port map (
      I0 => \^storage_v_r_reg\,
      I1 => tx_src_rdy_crc,
      I2 => tx_sof_crc,
      I3 => in_frame_r_reg,
      O => in_frame_c
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_TX_LL_DATAPATH is
  port (
    tx_pe_data_v_r : out STD_LOGIC;
    tx_pe_data_v_i : out STD_LOGIC;
    gen_pad_r : out STD_LOGIC;
    gen_pad_i : out STD_LOGIC;
    storage_v_r_reg_0 : out STD_LOGIC;
    \tx_pe_data_r_reg[0]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_frame_c : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    TX_PE_DATA_V0 : in STD_LOGIC;
    storage_pad_r0 : in STD_LOGIC;
    GEN_PAD0 : in STD_LOGIC;
    p_0_in_0 : in STD_LOGIC;
    EOF_N_DS_reg : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_TX_LL_DATAPATH : entity is "merger_aurora_TX_LL_DATAPATH";
end merger_aurora_merger_aurora_TX_LL_DATAPATH;

architecture STRUCTURE of merger_aurora_merger_aurora_TX_LL_DATAPATH is
  signal storage_pad_r : STD_LOGIC;
  signal storage_r : STD_LOGIC_VECTOR ( 0 to 15 );
  signal storage_v_r : STD_LOGIC;
  signal tx_pe_data_r : STD_LOGIC_VECTOR ( 0 to 15 );
begin
GEN_PAD_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => GEN_PAD0,
      Q => gen_pad_i,
      R => '0'
    );
TX_PE_DATA_V_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => TX_PE_DATA_V0,
      Q => tx_pe_data_v_i,
      R => '0'
    );
\TX_PE_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(0),
      Q => \tx_pe_data_r_reg[0]_0\(15),
      R => '0'
    );
\TX_PE_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(10),
      Q => \tx_pe_data_r_reg[0]_0\(5),
      R => '0'
    );
\TX_PE_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(11),
      Q => \tx_pe_data_r_reg[0]_0\(4),
      R => '0'
    );
\TX_PE_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(12),
      Q => \tx_pe_data_r_reg[0]_0\(3),
      R => '0'
    );
\TX_PE_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(13),
      Q => \tx_pe_data_r_reg[0]_0\(2),
      R => '0'
    );
\TX_PE_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(14),
      Q => \tx_pe_data_r_reg[0]_0\(1),
      R => '0'
    );
\TX_PE_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(15),
      Q => \tx_pe_data_r_reg[0]_0\(0),
      R => '0'
    );
\TX_PE_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(1),
      Q => \tx_pe_data_r_reg[0]_0\(14),
      R => '0'
    );
\TX_PE_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(2),
      Q => \tx_pe_data_r_reg[0]_0\(13),
      R => '0'
    );
\TX_PE_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(3),
      Q => \tx_pe_data_r_reg[0]_0\(12),
      R => '0'
    );
\TX_PE_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(4),
      Q => \tx_pe_data_r_reg[0]_0\(11),
      R => '0'
    );
\TX_PE_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(5),
      Q => \tx_pe_data_r_reg[0]_0\(10),
      R => '0'
    );
\TX_PE_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(6),
      Q => \tx_pe_data_r_reg[0]_0\(9),
      R => '0'
    );
\TX_PE_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(7),
      Q => \tx_pe_data_r_reg[0]_0\(8),
      R => '0'
    );
\TX_PE_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(8),
      Q => \tx_pe_data_r_reg[0]_0\(7),
      R => '0'
    );
\TX_PE_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => tx_pe_data_r(9),
      Q => \tx_pe_data_r_reg[0]_0\(6),
      R => '0'
    );
gen_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_pad_r,
      Q => gen_pad_r,
      R => '0'
    );
in_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => EOF_N_DS_reg,
      Q => storage_v_r_reg_0,
      R => p_0_in_0
    );
storage_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_pad_r0,
      Q => storage_pad_r,
      R => '0'
    );
\storage_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(15),
      Q => storage_r(0),
      R => '0'
    );
\storage_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(5),
      Q => storage_r(10),
      R => '0'
    );
\storage_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(4),
      Q => storage_r(11),
      R => '0'
    );
\storage_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(3),
      Q => storage_r(12),
      R => '0'
    );
\storage_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(2),
      Q => storage_r(13),
      R => '0'
    );
\storage_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(1),
      Q => storage_r(14),
      R => '0'
    );
\storage_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(0),
      Q => storage_r(15),
      R => '0'
    );
\storage_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(14),
      Q => storage_r(1),
      R => '0'
    );
\storage_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(13),
      Q => storage_r(2),
      R => '0'
    );
\storage_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(12),
      Q => storage_r(3),
      R => '0'
    );
\storage_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(11),
      Q => storage_r(4),
      R => '0'
    );
\storage_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(10),
      Q => storage_r(5),
      R => '0'
    );
\storage_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(9),
      Q => storage_r(6),
      R => '0'
    );
\storage_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(8),
      Q => storage_r(7),
      R => '0'
    );
\storage_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(7),
      Q => storage_r(8),
      R => '0'
    );
\storage_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(6),
      Q => storage_r(9),
      R => '0'
    );
storage_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => in_frame_c,
      Q => storage_v_r,
      R => '0'
    );
\tx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(0),
      Q => tx_pe_data_r(0),
      R => '0'
    );
\tx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(10),
      Q => tx_pe_data_r(10),
      R => '0'
    );
\tx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(11),
      Q => tx_pe_data_r(11),
      R => '0'
    );
\tx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(12),
      Q => tx_pe_data_r(12),
      R => '0'
    );
\tx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(13),
      Q => tx_pe_data_r(13),
      R => '0'
    );
\tx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(14),
      Q => tx_pe_data_r(14),
      R => '0'
    );
\tx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(15),
      Q => tx_pe_data_r(15),
      R => '0'
    );
\tx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(1),
      Q => tx_pe_data_r(1),
      R => '0'
    );
\tx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(2),
      Q => tx_pe_data_r(2),
      R => '0'
    );
\tx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(3),
      Q => tx_pe_data_r(3),
      R => '0'
    );
\tx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(4),
      Q => tx_pe_data_r(4),
      R => '0'
    );
\tx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(5),
      Q => tx_pe_data_r(5),
      R => '0'
    );
\tx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(6),
      Q => tx_pe_data_r(6),
      R => '0'
    );
\tx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(7),
      Q => tx_pe_data_r(7),
      R => '0'
    );
\tx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(8),
      Q => tx_pe_data_r(8),
      R => '0'
    );
\tx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_r(9),
      Q => tx_pe_data_r(9),
      R => '0'
    );
tx_pe_data_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => storage_v_r,
      Q => tx_pe_data_v_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_reset : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  D(0) <= s_level_out_d3;
  p_level_in_int <= gt_reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_0 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_0;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_0 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  D(0) <= s_level_out_d3;
  p_level_in_int <= reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_1 is
  port (
    in0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_1 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_1;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_1 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= in0;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_10 is
  port (
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_10 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_10;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_10 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_15 is
  port (
    \out\ : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_15 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_15;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_15 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_19 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    mmcm_lock_reclocked_reg : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    \mmcm_lock_count_reg[9]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_19 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_19;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_19 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
\mmcm_lock_count[9]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_level_out_d3,
      O => SR(0)
    );
\mmcm_lock_reclocked_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => \mmcm_lock_count_reg[9]\,
      I2 => s_level_out_d3,
      O => mmcm_lock_reclocked_reg
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_20 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_time_out_reg : out STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    RXUSERRDY_reg : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[1]\ : in STD_LOGIC;
    \wait_time_cnt_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_0\ : in STD_LOGIC;
    time_out_2ms_reg : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[1]_0\ : in STD_LOGIC;
    check_tlock_max : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[1]_1\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[1]_2\ : in STD_LOGIC;
    reset_time_out_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_20 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_20;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_20 is
  signal \FSM_sequential_rx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal reset_time_out_i_5_n_0 : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= quad1_common_lock_out;
\FSM_sequential_rx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABBBBBAAABAAAB"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]\,
      I1 => \FSM_sequential_rx_state_reg[1]\,
      I2 => \wait_time_cnt_reg[0]\,
      I3 => \out\(0),
      I4 => \FSM_sequential_rx_state_reg[0]_0\,
      I5 => \FSM_sequential_rx_state[3]_i_6_n_0\,
      O => E(0)
    );
\FSM_sequential_rx_state[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => \out\(2),
      I1 => \out\(3),
      I2 => time_out_2ms_reg,
      I3 => \out\(1),
      I4 => s_level_out_d3,
      O => \FSM_sequential_rx_state[3]_i_6_n_0\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
\reset_time_out_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF40FFFFFF400000"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[1]_0\,
      I1 => check_tlock_max,
      I2 => \FSM_sequential_rx_state_reg[1]_1\,
      I3 => reset_time_out_i_5_n_0,
      I4 => \FSM_sequential_rx_state_reg[1]_2\,
      I5 => reset_time_out_reg_0,
      O => reset_time_out_reg
    );
reset_time_out_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300F3F3F3F05353"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(2),
      I2 => \out\(3),
      I3 => s_level_out_d3,
      I4 => \out\(1),
      I5 => RXUSERRDY_reg,
      O => reset_time_out_i_5_n_0
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_21 is
  port (
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_21 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_21;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_21 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_6 is
  port (
    \out\ : out STD_LOGIC;
    in0 : in STD_LOGIC;
    drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_6 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_6;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_6 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
  p_level_in_int <= in0;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_8 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    mmcm_lock_reclocked_reg : out STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    p_0_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_8 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_8;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_8 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= quad1_common_lock_out;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
\mmcm_lock_count[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_level_out_d3,
      O => SR(0)
    );
mmcm_lock_reclocked_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => p_0_in,
      I2 => s_level_out_d3,
      O => mmcm_lock_reclocked_reg
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_cdc_sync_9 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_time_out_reg : out STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    txresetdone_s3_reg : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    init_wait_done_reg : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[2]\ : in STD_LOGIC;
    sel : in STD_LOGIC;
    txresetdone_s3 : in STD_LOGIC;
    reset_time_out : in STD_LOGIC;
    time_out_500us_reg : in STD_LOGIC;
    time_out_2ms_reg : in STD_LOGIC;
    time_tlock_max_reg : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    pll_reset_asserted_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_cdc_sync_9 : entity is "merger_aurora_cdc_sync";
end merger_aurora_merger_aurora_cdc_sync_9;

architecture STRUCTURE of merger_aurora_merger_aurora_cdc_sync_9 is
  signal \FSM_sequential_tx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal reset_time_out_0 : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= quad1_common_lock_out;
\FSM_sequential_tx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3300744433007477"
    )
        port map (
      I0 => \FSM_sequential_tx_state_reg[3]_i_3_n_0\,
      I1 => \out\(0),
      I2 => init_wait_done_reg,
      I3 => \FSM_sequential_tx_state_reg[2]\,
      I4 => \out\(3),
      I5 => sel,
      O => E(0)
    );
\FSM_sequential_tx_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0DFF0D000DFF0DFF"
    )
        port map (
      I0 => time_tlock_max_reg,
      I1 => reset_time_out,
      I2 => mmcm_lock_reclocked,
      I3 => \out\(2),
      I4 => s_level_out_d3,
      I5 => pll_reset_asserted_reg,
      O => \FSM_sequential_tx_state[3]_i_6_n_0\
    );
\FSM_sequential_tx_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"45004500450045FF"
    )
        port map (
      I0 => txresetdone_s3,
      I1 => reset_time_out,
      I2 => time_out_500us_reg,
      I3 => \out\(2),
      I4 => s_level_out_d3,
      I5 => time_out_2ms_reg,
      O => \FSM_sequential_tx_state[3]_i_7_n_0\
    );
\FSM_sequential_tx_state_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \FSM_sequential_tx_state[3]_i_6_n_0\,
      I1 => \FSM_sequential_tx_state[3]_i_7_n_0\,
      O => \FSM_sequential_tx_state_reg[3]_i_3_n_0\,
      S => \out\(1)
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
reset_time_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEAAFE0202AA02"
    )
        port map (
      I0 => reset_time_out_0,
      I1 => \out\(1),
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => \out\(3),
      I5 => reset_time_out,
      O => reset_time_out_reg
    );
reset_time_out_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0B8F0B8B"
    )
        port map (
      I0 => txresetdone_s3_reg,
      I1 => \out\(0),
      I2 => \out\(3),
      I3 => \out\(2),
      I4 => s_level_out_d3,
      O => reset_time_out_0
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0\ is
  port (
    AS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_reset_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  AS(0) <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gt_reset_out,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_11\ is
  port (
    \out\ : out STD_LOGIC;
    run_phase_alignment_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_11\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_11\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_11\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => run_phase_alignment_int,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_12\ is
  port (
    \out\ : out STD_LOGIC;
    time_out_wait_bypass : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_12\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_12\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_12\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => time_out_wait_bypass,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_13\ is
  port (
    \out\ : out STD_LOGIC;
    gt_txresetdone_r2_reg : out STD_LOGIC;
    tx_fsm_reset_done_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_13\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_13\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_13\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
gt_txresetdone_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_level_out_d3,
      O => gt_txresetdone_r2_reg
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_fsm_reset_done_int,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_14\ is
  port (
    \out\ : out STD_LOGIC;
    gtrxreset_i_0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_14\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_14\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_14\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_i_0,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_16\ is
  port (
    rxpmaresetdone_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_16\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_16\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_16\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rxpmaresetdone_i,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_17\ is
  port (
    txpmaresetdone_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_17\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_17\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_17\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => txpmaresetdone_i,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_18\ is
  port (
    \out\ : out STD_LOGIC;
    rxfsm_rxresetdone_r : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_18\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_18\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_18\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rxfsm_rxresetdone_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_22\ is
  port (
    \out\ : out STD_LOGIC;
    run_phase_alignment_int_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_22\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_22\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_22\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => run_phase_alignment_int_reg,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_23\ is
  port (
    \out\ : out STD_LOGIC;
    rx_fsm_reset_done_int : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_23\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_23\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_23\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_fsm_reset_done_int,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_24\ is
  port (
    \out\ : out STD_LOGIC;
    time_out_wait_bypass_reg : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_24\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_24\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_24\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => time_out_wait_bypass_reg,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_25\ is
  port (
    \out\ : out STD_LOGIC;
    link_reset_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_25\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_25\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_25\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_26\ is
  port (
    \out\ : out STD_LOGIC;
    tx_lock_comb_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_26\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_26\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_26\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_lock_comb_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_27\ is
  port (
    \out\ : out STD_LOGIC;
    rx_cc_extend_r2 : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_27\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_27\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_27\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r2,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_3\ is
  port (
    \out\ : out STD_LOGIC;
    gtrxreset_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_3\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_3\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_3\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gtrxreset_i,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_4\ is
  port (
    \out\ : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_4\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_4\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_4\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => SR(0),
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_5\ is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    common_reset_i : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_5\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_5\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_5\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  SR(0) <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => common_reset_i,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \merger_aurora_merger_aurora_cdc_sync__parameterized0_7\ is
  port (
    \out\ : out STD_LOGIC;
    txfsm_txresetdone_r : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \merger_aurora_merger_aurora_cdc_sync__parameterized0_7\ : entity is "merger_aurora_cdc_sync";
end \merger_aurora_merger_aurora_cdc_sync__parameterized0_7\;

architecture STRUCTURE of \merger_aurora_merger_aurora_cdc_sync__parameterized0_7\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_merger_aurora_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_merger_aurora_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_merger_aurora_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_merger_aurora_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_merger_aurora_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_merger_aurora_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_merger_aurora_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_merger_aurora_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_merger_aurora_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => txfsm_txresetdone_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_merger_aurora_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_merger_aurora_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_merger_aurora_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_gt_common_wrapper is
  port (
    quad1_common_lock_out : out STD_LOGIC;
    gt0_pll0outclk_out : out STD_LOGIC;
    gt0_pll0outrefclk_out : out STD_LOGIC;
    gt0_pll0refclklost_out : out STD_LOGIC;
    gt0_pll1outclk_out : out STD_LOGIC;
    gt0_pll1outrefclk_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC;
    gt_refclk1_n : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    common_reset_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_gt_common_wrapper : entity is "merger_aurora_gt_common_wrapper";
end merger_aurora_merger_aurora_gt_common_wrapper;

architecture STRUCTURE of merger_aurora_merger_aurora_gt_common_wrapper is
  signal PLL0RESET0 : STD_LOGIC;
  signal cpllpd_ovrd_quad0_i : STD_LOGIC;
  signal \cpllpd_quad0_wait_reg[31]_srl32_n_1\ : STD_LOGIC;
  signal \cpllpd_quad0_wait_reg[63]_srl32_n_1\ : STD_LOGIC;
  signal \cpllpd_quad0_wait_reg[94]_srl31_n_0\ : STD_LOGIC;
  signal cpllreset_ovrd_quad0_i : STD_LOGIC;
  signal \cpllreset_quad0_wait_reg[126]_srl31_n_0\ : STD_LOGIC;
  signal \cpllreset_quad0_wait_reg[31]_srl32_n_1\ : STD_LOGIC;
  signal \cpllreset_quad0_wait_reg[63]_srl32_n_1\ : STD_LOGIC;
  signal \cpllreset_quad0_wait_reg[95]_srl32_n_1\ : STD_LOGIC;
  signal gtpe2_common_0_i_n_7 : STD_LOGIC;
  signal \^quad1_common_lock_out\ : STD_LOGIC;
  signal \NLW_cpllpd_quad0_wait_reg[31]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllpd_quad0_wait_reg[63]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllpd_quad0_wait_reg[94]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_quad0_wait_reg[126]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_quad0_wait_reg[31]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_quad0_wait_reg[63]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_quad0_wait_reg[95]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_DRPRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_PLL0FBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_PLL1FBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_PLL1REFCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_REFCLKOUTMONITOR0_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_REFCLKOUTMONITOR1_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_common_0_i_DMONITOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_gtpe2_common_0_i_DRPDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gtpe2_common_0_i_PMARSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute srl_bus_name : string;
  attribute srl_bus_name of \cpllpd_quad0_wait_reg[31]_srl32\ : label is "inst/\gt_common_support/cpllpd_quad0_wait_reg ";
  attribute srl_name : string;
  attribute srl_name of \cpllpd_quad0_wait_reg[31]_srl32\ : label is "inst/\gt_common_support/cpllpd_quad0_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllpd_quad0_wait_reg[63]_srl32\ : label is "inst/\gt_common_support/cpllpd_quad0_wait_reg ";
  attribute srl_name of \cpllpd_quad0_wait_reg[63]_srl32\ : label is "inst/\gt_common_support/cpllpd_quad0_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllpd_quad0_wait_reg[94]_srl31\ : label is "inst/\gt_common_support/cpllpd_quad0_wait_reg ";
  attribute srl_name of \cpllpd_quad0_wait_reg[94]_srl31\ : label is "inst/\gt_common_support/cpllpd_quad0_wait_reg[94]_srl31 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \cpllpd_quad0_wait_reg[95]\ : label is "no";
  attribute srl_bus_name of \cpllreset_quad0_wait_reg[126]_srl31\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg ";
  attribute srl_name of \cpllreset_quad0_wait_reg[126]_srl31\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg[126]_srl31 ";
  attribute equivalent_register_removal of \cpllreset_quad0_wait_reg[127]\ : label is "no";
  attribute srl_bus_name of \cpllreset_quad0_wait_reg[31]_srl32\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg ";
  attribute srl_name of \cpllreset_quad0_wait_reg[31]_srl32\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllreset_quad0_wait_reg[63]_srl32\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg ";
  attribute srl_name of \cpllreset_quad0_wait_reg[63]_srl32\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllreset_quad0_wait_reg[95]_srl32\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg ";
  attribute srl_name of \cpllreset_quad0_wait_reg[95]_srl32\ : label is "inst/\gt_common_support/cpllreset_quad0_wait_reg[95]_srl32 ";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtpe2_common_0_i : label is "PRIMITIVE";
begin
  quad1_common_lock_out <= \^quad1_common_lock_out\;
\cpllpd_quad0_wait_reg[31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"FFFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1_n,
      D => '0',
      Q => \NLW_cpllpd_quad0_wait_reg[31]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllpd_quad0_wait_reg[31]_srl32_n_1\
    );
\cpllpd_quad0_wait_reg[63]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"FFFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1_n,
      D => \cpllpd_quad0_wait_reg[31]_srl32_n_1\,
      Q => \NLW_cpllpd_quad0_wait_reg[63]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllpd_quad0_wait_reg[63]_srl32_n_1\
    );
\cpllpd_quad0_wait_reg[94]_srl31\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gt_refclk1_n,
      D => \cpllpd_quad0_wait_reg[63]_srl32_n_1\,
      Q => \cpllpd_quad0_wait_reg[94]_srl31_n_0\,
      Q31 => \NLW_cpllpd_quad0_wait_reg[94]_srl31_Q31_UNCONNECTED\
    );
\cpllpd_quad0_wait_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gt_refclk1_n,
      CE => '1',
      D => \cpllpd_quad0_wait_reg[94]_srl31_n_0\,
      Q => cpllpd_ovrd_quad0_i,
      R => '0'
    );
\cpllreset_quad0_wait_reg[126]_srl31\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gt_refclk1_n,
      D => \cpllreset_quad0_wait_reg[95]_srl32_n_1\,
      Q => \cpllreset_quad0_wait_reg[126]_srl31_n_0\,
      Q31 => \NLW_cpllreset_quad0_wait_reg[126]_srl31_Q31_UNCONNECTED\
    );
\cpllreset_quad0_wait_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt_refclk1_n,
      CE => '1',
      D => \cpllreset_quad0_wait_reg[126]_srl31_n_0\,
      Q => cpllreset_ovrd_quad0_i,
      R => '0'
    );
\cpllreset_quad0_wait_reg[31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"000000FF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1_n,
      D => '0',
      Q => \NLW_cpllreset_quad0_wait_reg[31]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_quad0_wait_reg[31]_srl32_n_1\
    );
\cpllreset_quad0_wait_reg[63]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1_n,
      D => \cpllreset_quad0_wait_reg[31]_srl32_n_1\,
      Q => \NLW_cpllreset_quad0_wait_reg[63]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_quad0_wait_reg[63]_srl32_n_1\
    );
\cpllreset_quad0_wait_reg[95]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gt_refclk1_n,
      D => \cpllreset_quad0_wait_reg[63]_srl32_n_1\,
      Q => \NLW_cpllreset_quad0_wait_reg[95]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_quad0_wait_reg[95]_srl32_n_1\
    );
gtpe2_common_0_i: unisim.vcomponents.GTPE2_COMMON
    generic map(
      BIAS_CFG => X"0000000000050001",
      COMMON_CFG => X"00000000",
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK0_INVERTED => '0',
      IS_GTGREFCLK1_INVERTED => '0',
      IS_PLL0LOCKDETCLK_INVERTED => '0',
      IS_PLL1LOCKDETCLK_INVERTED => '0',
      PLL0_CFG => X"01F03DC",
      PLL0_DMON_CFG => '0',
      PLL0_FBDIV => 4,
      PLL0_FBDIV_45 => 5,
      PLL0_INIT_CFG => X"00001E",
      PLL0_LOCK_CFG => X"1E8",
      PLL0_REFCLK_DIV => 1,
      PLL1_CFG => X"01F03DC",
      PLL1_DMON_CFG => '0',
      PLL1_FBDIV => 4,
      PLL1_FBDIV_45 => 5,
      PLL1_INIT_CFG => X"00001E",
      PLL1_LOCK_CFG => X"1E8",
      PLL1_REFCLK_DIV => 1,
      PLL_CLKOUT_CFG => B"00000000",
      RSVD_ATTR0 => X"0000",
      RSVD_ATTR1 => X"0000",
      SIM_PLL0REFCLK_SEL => B"001",
      SIM_PLL1REFCLK_SEL => B"001",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_VERSION => "2.0"
    )
        port map (
      BGBYPASSB => '1',
      BGMONITORENB => '1',
      BGPDB => '1',
      BGRCALOVRD(4 downto 0) => B"11111",
      BGRCALOVRDENB => '1',
      DMONITOROUT(7 downto 0) => NLW_gtpe2_common_0_i_DMONITOROUT_UNCONNECTED(7 downto 0),
      DRPADDR(7 downto 0) => B"00000000",
      DRPCLK => '0',
      DRPDI(15 downto 0) => B"0000000000000000",
      DRPDO(15 downto 0) => NLW_gtpe2_common_0_i_DRPDO_UNCONNECTED(15 downto 0),
      DRPEN => '0',
      DRPRDY => NLW_gtpe2_common_0_i_DRPRDY_UNCONNECTED,
      DRPWE => '0',
      GTEASTREFCLK0 => '0',
      GTEASTREFCLK1 => '0',
      GTGREFCLK0 => '0',
      GTGREFCLK1 => '0',
      GTREFCLK0 => gt_refclk1_n,
      GTREFCLK1 => '0',
      GTWESTREFCLK0 => '0',
      GTWESTREFCLK1 => '0',
      PLL0FBCLKLOST => NLW_gtpe2_common_0_i_PLL0FBCLKLOST_UNCONNECTED,
      PLL0LOCK => \^quad1_common_lock_out\,
      PLL0LOCKDETCLK => init_clk_in,
      PLL0LOCKEN => '1',
      PLL0OUTCLK => gt0_pll0outclk_out,
      PLL0OUTREFCLK => gt0_pll0outrefclk_out,
      PLL0PD => cpllpd_ovrd_quad0_i,
      PLL0REFCLKLOST => gt0_pll0refclklost_out,
      PLL0REFCLKSEL(2 downto 0) => B"001",
      PLL0RESET => PLL0RESET0,
      PLL1FBCLKLOST => NLW_gtpe2_common_0_i_PLL1FBCLKLOST_UNCONNECTED,
      PLL1LOCK => gtpe2_common_0_i_n_7,
      PLL1LOCKDETCLK => '0',
      PLL1LOCKEN => '1',
      PLL1OUTCLK => gt0_pll1outclk_out,
      PLL1OUTREFCLK => gt0_pll1outrefclk_out,
      PLL1PD => '1',
      PLL1REFCLKLOST => NLW_gtpe2_common_0_i_PLL1REFCLKLOST_UNCONNECTED,
      PLL1REFCLKSEL(2 downto 0) => B"001",
      PLL1RESET => cpllreset_ovrd_quad0_i,
      PLLRSVD1(15 downto 0) => B"0000000000000000",
      PLLRSVD2(4 downto 0) => B"00000",
      PMARSVD(7 downto 0) => B"00000000",
      PMARSVDOUT(15 downto 0) => NLW_gtpe2_common_0_i_PMARSVDOUT_UNCONNECTED(15 downto 0),
      RCALENB => '1',
      REFCLKOUTMONITOR0 => NLW_gtpe2_common_0_i_REFCLKOUTMONITOR0_UNCONNECTED,
      REFCLKOUTMONITOR1 => NLW_gtpe2_common_0_i_REFCLKOUTMONITOR1_UNCONNECTED
    );
gtpe2_common_0_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => cpllreset_ovrd_quad0_i,
      I1 => common_reset_i,
      O => PLL0RESET0
    );
pll_not_locked_out_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^quad1_common_lock_out\,
      O => pll_not_locked_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_GLOBAL_LOGIC is
  port (
    soft_err : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_v_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_a_i : out STD_LOGIC;
    \gen_k_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_r_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    channel_up : out STD_LOGIC;
    gtrxreset_i : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    reset_channel_i : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    ready_r_reg0 : out STD_LOGIC;
    new_pkt_r : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    \soft_err_r_reg[1]\ : in STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    got_v_i : in STD_LOGIC;
    wait_for_lane_up_r0 : in STD_LOGIC;
    hard_err_i : in STD_LOGIC;
    lane_up : in STD_LOGIC;
    hard_err_reset_i : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    \count_reg[1]\ : in STD_LOGIC;
    power_down : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_GLOBAL_LOGIC : entity is "merger_aurora_GLOBAL_LOGIC";
end merger_aurora_merger_aurora_GLOBAL_LOGIC;

architecture STRUCTURE of merger_aurora_merger_aurora_GLOBAL_LOGIC is
  signal gen_ver_i : STD_LOGIC;
  signal \^reset_channel_i\ : STD_LOGIC;
  signal txver_count_r0 : STD_LOGIC;
begin
  reset_channel_i <= \^reset_channel_i\;
channel_err_detect_i: entity work.merger_aurora_merger_aurora_CHANNEL_ERR_DETECT
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      hard_err => hard_err,
      hard_err_i => hard_err_i,
      lane_up => lane_up,
      power_down => power_down,
      reset_channel_i => \^reset_channel_i\,
      soft_err => soft_err,
      \soft_err_r_reg[1]\ => \soft_err_r_reg[1]\
    );
channel_init_sm_i: entity work.merger_aurora_merger_aurora_CHANNEL_INIT_SM
     port map (
      SR(0) => SR(0),
      SS(0) => SS(0),
      SYSTEM_RESET_reg(0) => SYSTEM_RESET_reg(0),
      channel_up => channel_up,
      \count_reg[1]\ => \count_reg[1]\,
      gen_ver_i => gen_ver_i,
      got_v_i => got_v_i,
      gtrxreset_i => gtrxreset_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      hard_err_reset_i => hard_err_reset_i,
      new_pkt_r => new_pkt_r,
      new_pkt_r_reg => new_pkt_r_reg,
      p_0_in => p_0_in,
      ready_r_reg0 => ready_r_reg0,
      reset_channel_i => \^reset_channel_i\,
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      txver_count_r0 => txver_count_r0,
      wait_for_lane_up_r0 => wait_for_lane_up_r0
    );
idle_and_ver_gen_i: entity work.merger_aurora_merger_aurora_IDLE_AND_VER_GEN
     port map (
      SYSTEM_RESET_reg(0) => SYSTEM_RESET_reg(0),
      gen_a_i => gen_a_i,
      \gen_k_r_reg[0]\(1 downto 0) => \gen_k_r_reg[0]\(1 downto 0),
      \gen_r_r_reg[0]\(1 downto 0) => \gen_r_r_reg[0]\(1 downto 0),
      \gen_v_r_reg[0]\(1 downto 0) => \gen_v_r_reg[0]\(1 downto 0),
      gen_ver_i => gen_ver_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      txver_count_r0 => txver_count_r0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_RESET_LOGIC is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    wait_for_lane_up_r0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    in0 : in STD_LOGIC;
    link_reset_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    s_level_out_d3_reg : in STD_LOGIC;
    rxfsm_rxresetdone_r3_reg : in STD_LOGIC;
    reset_channel_i : in STD_LOGIC;
    tx_dst_rdy_crc : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_RESET_LOGIC : entity is "merger_aurora_RESET_LOGIC";
end merger_aurora_merger_aurora_RESET_LOGIC;

architecture STRUCTURE of merger_aurora_merger_aurora_RESET_LOGIC is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SYSTEM_RESET0_n_0 : STD_LOGIC;
  signal gt_rxresetdone_r : STD_LOGIC;
  signal gt_rxresetdone_r2 : STD_LOGIC;
  signal gt_rxresetdone_r3 : STD_LOGIC;
  signal gt_txresetdone_r : STD_LOGIC;
  signal gt_txresetdone_r2 : STD_LOGIC;
  signal gt_txresetdone_r3 : STD_LOGIC;
  signal link_reset_sync : STD_LOGIC;
  signal tx_lock_comb_r : STD_LOGIC;
  signal tx_lock_sync : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DATA_DS[15]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of verify_r_i_1 : label is "soft_lutpair32";
begin
  SR(0) <= \^sr\(0);
\DATA_DS[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^sr\(0),
      I1 => tx_dst_rdy_crc,
      O => E(0)
    );
SYSTEM_RESET0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFFFF"
    )
        port map (
      I0 => in0,
      I1 => gt_rxresetdone_r3,
      I2 => gt_txresetdone_r3,
      I3 => link_reset_sync,
      I4 => tx_lock_sync,
      O => SYSTEM_RESET0_n_0
    );
SYSTEM_RESET_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => SYSTEM_RESET0_n_0,
      Q => \^sr\(0),
      R => '0'
    );
gt_rxresetdone_r2_reg: unisim.vcomponents.FDCE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      CLR => rxfsm_rxresetdone_r3_reg,
      D => gt_rxresetdone_r,
      Q => gt_rxresetdone_r2
    );
gt_rxresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gt_rxresetdone_r2,
      Q => gt_rxresetdone_r3,
      R => '0'
    );
gt_rxresetdone_r_reg: unisim.vcomponents.FDCE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      CLR => rxfsm_rxresetdone_r3_reg,
      D => '1',
      Q => gt_rxresetdone_r
    );
gt_txresetdone_r2_reg: unisim.vcomponents.FDCE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      CLR => s_level_out_d3_reg,
      D => gt_txresetdone_r,
      Q => gt_txresetdone_r2
    );
gt_txresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gt_txresetdone_r2,
      Q => gt_txresetdone_r3,
      R => '0'
    );
gt_txresetdone_r_reg: unisim.vcomponents.FDCE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      CLR => s_level_out_d3_reg,
      D => '1',
      Q => gt_txresetdone_r
    );
link_reset_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_25\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      link_reset_r => link_reset_r,
      \out\ => link_reset_sync
    );
tx_lock_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_26\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => tx_lock_sync,
      tx_lock_comb_r => tx_lock_comb_r
    );
tx_lock_comb_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => quad1_common_lock_out,
      Q => tx_lock_comb_r,
      R => '0'
    );
verify_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sr\(0),
      I1 => reset_channel_i,
      O => wait_for_lane_up_r0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_RX_CRC is
  port (
    crc_valid : out STD_LOGIC;
    SOF_N_US_r_reg_0 : out STD_LOGIC;
    wait_r : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    \crc_data_i_reg[0]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_tlast : out STD_LOGIC;
    crc_pass_fail_n : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    rx_eof_crc : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx_rem_crc : in STD_LOGIC;
    rx_sof_crc : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    sof_ds_c : in STD_LOGIC;
    \count_reg[0]_0\ : in STD_LOGIC;
    rx_src_rdy_crc : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \RX_REM_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_RX_CRC : entity is "merger_aurora_RX_CRC";
end merger_aurora_merger_aurora_RX_CRC;

architecture STRUCTURE of merger_aurora_merger_aurora_RX_CRC is
  signal \CRC_PASS_FAIL_N_carry__0_n_3\ : STD_LOGIC;
  signal CRC_PASS_FAIL_N_carry_n_0 : STD_LOGIC;
  signal CRC_PASS_FAIL_N_carry_n_1 : STD_LOGIC;
  signal CRC_PASS_FAIL_N_carry_n_2 : STD_LOGIC;
  signal CRC_PASS_FAIL_N_carry_n_3 : STD_LOGIC;
  signal CRC_RESET_r_i_1_n_0 : STD_LOGIC;
  signal CRC_RESET_r_reg_n_0 : STD_LOGIC;
  signal DATA_US_2r : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \DATA_US_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \DATA_US_r_reg_n_0_[9]\ : STD_LOGIC;
  signal EOF_N_DS1 : STD_LOGIC;
  signal \EOF_N_DS_i_1__0_n_0\ : STD_LOGIC;
  signal EOF_N_US_r : STD_LOGIC;
  signal \REM_DS_i_1__0_n_0\ : STD_LOGIC;
  signal SOF_N_US_r : STD_LOGIC;
  signal \^sof_n_us_r_reg_0\ : STD_LOGIC;
  signal SRC_RDY_N_US_2r : STD_LOGIC;
  signal SRC_RDY_N_US_2r_i_1_n_0 : STD_LOGIC;
  signal \^crc_data_i_reg[0]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_c : STD_LOGIC;
  signal data_r : STD_LOGIC;
  signal eof_ds_c : STD_LOGIC;
  signal eof_ds_r : STD_LOGIC;
  signal idle_c : STD_LOGIC;
  signal idle_r : STD_LOGIC;
  signal ll_valid_r : STD_LOGIC;
  signal p_13_in : STD_LOGIC;
  signal received_CRC : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rem_in : STD_LOGIC;
  signal rx_crc_gen1_i_n_1 : STD_LOGIC;
  signal rx_crc_gen1_i_n_2 : STD_LOGIC;
  signal rx_crc_gen1_i_n_3 : STD_LOGIC;
  signal rx_crc_gen1_i_n_4 : STD_LOGIC;
  signal rx_crc_gen1_i_n_5 : STD_LOGIC;
  signal rx_crc_gen1_i_n_6 : STD_LOGIC;
  signal rx_eof : STD_LOGIC;
  signal rx_rem_int : STD_LOGIC;
  signal rx_src_rdy : STD_LOGIC;
  signal sof_ds_r : STD_LOGIC;
  signal sof_eof_c : STD_LOGIC;
  signal sof_eof_r : STD_LOGIC;
  signal wait_c : STD_LOGIC;
  signal \^wait_r\ : STD_LOGIC;
  signal NLW_CRC_PASS_FAIL_N_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CRC_PASS_FAIL_N_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_CRC_PASS_FAIL_N_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_r_i_1__0\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of eof_ds_r_i_1 : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \m_axi_rx_tkeep[1]_INST_0\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of m_axi_rx_tlast_INST_0 : label is "soft_lutpair84";
begin
  SOF_N_US_r_reg_0 <= \^sof_n_us_r_reg_0\;
  \crc_data_i_reg[0]\(7 downto 0) <= \^crc_data_i_reg[0]\(7 downto 0);
  wait_r <= \^wait_r\;
CRC_PASS_FAIL_N_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => CRC_PASS_FAIL_N_carry_n_0,
      CO(2) => CRC_PASS_FAIL_N_carry_n_1,
      CO(1) => CRC_PASS_FAIL_N_carry_n_2,
      CO(0) => CRC_PASS_FAIL_N_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_CRC_PASS_FAIL_N_carry_O_UNCONNECTED(3 downto 0),
      S(3) => rx_crc_gen1_i_n_3,
      S(2) => rx_crc_gen1_i_n_4,
      S(1) => rx_crc_gen1_i_n_5,
      S(0) => rx_crc_gen1_i_n_6
    );
\CRC_PASS_FAIL_N_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => CRC_PASS_FAIL_N_carry_n_0,
      CO(3 downto 2) => \NLW_CRC_PASS_FAIL_N_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => crc_pass_fail_n,
      CO(0) => \CRC_PASS_FAIL_N_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_CRC_PASS_FAIL_N_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => rx_crc_gen1_i_n_1,
      S(0) => rx_crc_gen1_i_n_2
    );
CRC_RESET_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEE0E000000"
    )
        port map (
      I0 => rx_src_rdy_crc,
      I1 => \^sof_n_us_r_reg_0\,
      I2 => SOF_N_US_r,
      I3 => ll_valid_r,
      I4 => EOF_N_US_r,
      I5 => CRC_RESET_r_reg_n_0,
      O => CRC_RESET_r_i_1_n_0
    );
CRC_RESET_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC_RESET_r_i_1_n_0,
      Q => CRC_RESET_r_reg_n_0,
      R => '0'
    );
CRC_VALID_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sof_eof_r,
      I1 => eof_ds_r,
      O => EOF_N_DS1
    );
CRC_VALID_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => EOF_N_DS1,
      Q => crc_valid,
      R => SR(0)
    );
\DATA_DS_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(0),
      Q => m_axi_rx_tdata(15),
      R => SR(0)
    );
\DATA_DS_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(10),
      Q => m_axi_rx_tdata(5),
      R => SR(0)
    );
\DATA_DS_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(11),
      Q => m_axi_rx_tdata(4),
      R => SR(0)
    );
\DATA_DS_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(12),
      Q => m_axi_rx_tdata(3),
      R => SR(0)
    );
\DATA_DS_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(13),
      Q => m_axi_rx_tdata(2),
      R => SR(0)
    );
\DATA_DS_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(14),
      Q => m_axi_rx_tdata(1),
      R => SR(0)
    );
\DATA_DS_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(15),
      Q => m_axi_rx_tdata(0),
      R => SR(0)
    );
\DATA_DS_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(1),
      Q => m_axi_rx_tdata(14),
      R => SR(0)
    );
\DATA_DS_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(2),
      Q => m_axi_rx_tdata(13),
      R => SR(0)
    );
\DATA_DS_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(3),
      Q => m_axi_rx_tdata(12),
      R => SR(0)
    );
\DATA_DS_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(4),
      Q => m_axi_rx_tdata(11),
      R => SR(0)
    );
\DATA_DS_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(5),
      Q => m_axi_rx_tdata(10),
      R => SR(0)
    );
\DATA_DS_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(6),
      Q => m_axi_rx_tdata(9),
      R => SR(0)
    );
\DATA_DS_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(7),
      Q => m_axi_rx_tdata(8),
      R => SR(0)
    );
\DATA_DS_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(8),
      Q => m_axi_rx_tdata(7),
      R => SR(0)
    );
\DATA_DS_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => DATA_US_2r(9),
      Q => m_axi_rx_tdata(6),
      R => SR(0)
    );
\DATA_US_2r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(0),
      Q => DATA_US_2r(0),
      R => '0'
    );
\DATA_US_2r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[10]\,
      Q => DATA_US_2r(10),
      R => '0'
    );
\DATA_US_2r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[11]\,
      Q => DATA_US_2r(11),
      R => '0'
    );
\DATA_US_2r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[12]\,
      Q => DATA_US_2r(12),
      R => '0'
    );
\DATA_US_2r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[13]\,
      Q => DATA_US_2r(13),
      R => '0'
    );
\DATA_US_2r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[14]\,
      Q => DATA_US_2r(14),
      R => '0'
    );
\DATA_US_2r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[15]\,
      Q => DATA_US_2r(15),
      R => '0'
    );
\DATA_US_2r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(1),
      Q => DATA_US_2r(1),
      R => '0'
    );
\DATA_US_2r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(2),
      Q => DATA_US_2r(2),
      R => '0'
    );
\DATA_US_2r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(3),
      Q => DATA_US_2r(3),
      R => '0'
    );
\DATA_US_2r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(4),
      Q => DATA_US_2r(4),
      R => '0'
    );
\DATA_US_2r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(5),
      Q => DATA_US_2r(5),
      R => '0'
    );
\DATA_US_2r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(6),
      Q => DATA_US_2r(6),
      R => '0'
    );
\DATA_US_2r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^crc_data_i_reg[0]\(7),
      Q => DATA_US_2r(7),
      R => '0'
    );
\DATA_US_2r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[8]\,
      Q => DATA_US_2r(8),
      R => '0'
    );
\DATA_US_2r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \DATA_US_r_reg_n_0_[9]\,
      Q => DATA_US_2r(9),
      R => '0'
    );
\DATA_US_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(0),
      Q => \^crc_data_i_reg[0]\(0),
      R => '0'
    );
\DATA_US_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(10),
      Q => \DATA_US_r_reg_n_0_[10]\,
      R => '0'
    );
\DATA_US_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(11),
      Q => \DATA_US_r_reg_n_0_[11]\,
      R => '0'
    );
\DATA_US_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(12),
      Q => \DATA_US_r_reg_n_0_[12]\,
      R => '0'
    );
\DATA_US_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(13),
      Q => \DATA_US_r_reg_n_0_[13]\,
      R => '0'
    );
\DATA_US_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(14),
      Q => \DATA_US_r_reg_n_0_[14]\,
      R => '0'
    );
\DATA_US_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(15),
      Q => \DATA_US_r_reg_n_0_[15]\,
      R => '0'
    );
\DATA_US_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(1),
      Q => \^crc_data_i_reg[0]\(1),
      R => '0'
    );
\DATA_US_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(2),
      Q => \^crc_data_i_reg[0]\(2),
      R => '0'
    );
\DATA_US_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(3),
      Q => \^crc_data_i_reg[0]\(3),
      R => '0'
    );
\DATA_US_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(4),
      Q => \^crc_data_i_reg[0]\(4),
      R => '0'
    );
\DATA_US_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(5),
      Q => \^crc_data_i_reg[0]\(5),
      R => '0'
    );
\DATA_US_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(6),
      Q => \^crc_data_i_reg[0]\(6),
      R => '0'
    );
\DATA_US_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(7),
      Q => \^crc_data_i_reg[0]\(7),
      R => '0'
    );
\DATA_US_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(8),
      Q => \DATA_US_r_reg_n_0_[8]\,
      R => '0'
    );
\DATA_US_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => Q(9),
      Q => \DATA_US_r_reg_n_0_[9]\,
      R => '0'
    );
\EOF_N_DS_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => eof_ds_r,
      I1 => sof_eof_r,
      O => \EOF_N_DS_i_1__0_n_0\
    );
EOF_N_DS_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \EOF_N_DS_i_1__0_n_0\,
      Q => rx_eof,
      S => SR(0)
    );
EOF_N_US_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => rx_eof_crc,
      Q => EOF_N_US_r,
      R => '0'
    );
\REM_DS_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEEF"
    )
        port map (
      I0 => SR(0),
      I1 => rem_in,
      I2 => eof_ds_r,
      I3 => sof_eof_r,
      O => \REM_DS_i_1__0_n_0\
    );
REM_DS_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \REM_DS_i_1__0_n_0\,
      Q => rx_rem_int,
      R => '0'
    );
SOF_N_US_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_13_in,
      D => rx_sof_crc,
      Q => SOF_N_US_r,
      R => '0'
    );
SRC_RDY_N_DS_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => SRC_RDY_N_US_2r,
      Q => rx_src_rdy,
      S => SR(0)
    );
SRC_RDY_N_US_2r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F77"
    )
        port map (
      I0 => rx_sof_crc,
      I1 => p_13_in,
      I2 => EOF_N_US_r,
      I3 => ll_valid_r,
      O => SRC_RDY_N_US_2r_i_1_n_0
    );
SRC_RDY_N_US_2r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => SRC_RDY_N_US_2r_i_1_n_0,
      Q => SRC_RDY_N_US_2r,
      R => '0'
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => E(0),
      Q => \^sof_n_us_r_reg_0\,
      R => SR(0)
    );
\data_r_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEEEEEE0"
    )
        port map (
      I0 => sof_ds_r,
      I1 => data_r,
      I2 => \^sof_n_us_r_reg_0\,
      I3 => rx_src_rdy_crc,
      I4 => rx_eof_crc,
      O => data_c
    );
data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => data_c,
      Q => data_r,
      R => SR(0)
    );
eof_ds_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000000E"
    )
        port map (
      I0 => sof_ds_r,
      I1 => data_r,
      I2 => \^sof_n_us_r_reg_0\,
      I3 => rx_src_rdy_crc,
      I4 => rx_eof_crc,
      O => eof_ds_c
    );
eof_ds_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => eof_ds_c,
      Q => eof_ds_r,
      R => SR(0)
    );
\idle_r_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFEFEFE00"
    )
        port map (
      I0 => idle_r,
      I1 => sof_eof_r,
      I2 => eof_ds_r,
      I3 => \^sof_n_us_r_reg_0\,
      I4 => rx_src_rdy_crc,
      I5 => rx_sof_crc,
      O => idle_c
    );
idle_r_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => idle_c,
      Q => idle_r,
      S => SR(0)
    );
ll_valid_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => p_13_in,
      Q => ll_valid_r,
      R => '0'
    );
\m_axi_rx_tkeep[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_rem_int,
      I1 => rx_eof,
      O => m_axi_rx_tkeep(0)
    );
m_axi_rx_tlast_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rx_eof,
      O => m_axi_rx_tlast
    );
m_axi_rx_tvalid_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rx_src_rdy,
      O => m_axi_rx_tvalid
    );
\received_CRC_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(0),
      Q => received_CRC(0),
      R => '0'
    );
\received_CRC_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(10),
      Q => received_CRC(10),
      R => '0'
    );
\received_CRC_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(11),
      Q => received_CRC(11),
      R => '0'
    );
\received_CRC_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(12),
      Q => received_CRC(12),
      R => '0'
    );
\received_CRC_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(13),
      Q => received_CRC(13),
      R => '0'
    );
\received_CRC_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(14),
      Q => received_CRC(14),
      R => '0'
    );
\received_CRC_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(15),
      Q => received_CRC(15),
      R => '0'
    );
\received_CRC_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(1),
      Q => received_CRC(1),
      R => '0'
    );
\received_CRC_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(2),
      Q => received_CRC(2),
      R => '0'
    );
\received_CRC_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(3),
      Q => received_CRC(3),
      R => '0'
    );
\received_CRC_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(4),
      Q => received_CRC(4),
      R => '0'
    );
\received_CRC_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(5),
      Q => received_CRC(5),
      R => '0'
    );
\received_CRC_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(6),
      Q => received_CRC(6),
      R => '0'
    );
\received_CRC_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(7),
      Q => received_CRC(7),
      R => '0'
    );
\received_CRC_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(8),
      Q => received_CRC(8),
      R => '0'
    );
\received_CRC_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => D(9),
      Q => received_CRC(9),
      R => '0'
    );
rem_in_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => rx_rem_crc,
      Q => rem_in,
      R => '0'
    );
rx_crc_gen1_i: entity work.merger_aurora_merger_aurora_CRC_TOP_2
     port map (
      CRC_RESET_r_reg => CRC_RESET_r_reg_n_0,
      \DATA_US_r_reg[15]\(15) => \DATA_US_r_reg_n_0_[15]\,
      \DATA_US_r_reg[15]\(14) => \DATA_US_r_reg_n_0_[14]\,
      \DATA_US_r_reg[15]\(13) => \DATA_US_r_reg_n_0_[13]\,
      \DATA_US_r_reg[15]\(12) => \DATA_US_r_reg_n_0_[12]\,
      \DATA_US_r_reg[15]\(11) => \DATA_US_r_reg_n_0_[11]\,
      \DATA_US_r_reg[15]\(10) => \DATA_US_r_reg_n_0_[10]\,
      \DATA_US_r_reg[15]\(9) => \DATA_US_r_reg_n_0_[9]\,
      \DATA_US_r_reg[15]\(8) => \DATA_US_r_reg_n_0_[8]\,
      \DATA_US_r_reg[15]\(7 downto 0) => \^crc_data_i_reg[0]\(7 downto 0),
      EOF_N_US_r => EOF_N_US_r,
      Q(15 downto 0) => received_CRC(15 downto 0),
      \RX_REM_reg[0]\(0) => \RX_REM_reg[0]\(0),
      S(1) => rx_crc_gen1_i_n_1,
      S(0) => rx_crc_gen1_i_n_2,
      SOF_N_US_r => SOF_N_US_r,
      \count_reg[0]\ => \count_reg[0]_0\,
      \count_reg[0]_0\ => \^sof_n_us_r_reg_0\,
      crc_pass_fail_n(3) => rx_crc_gen1_i_n_3,
      crc_pass_fail_n(2) => rx_crc_gen1_i_n_4,
      crc_pass_fail_n(1) => rx_crc_gen1_i_n_5,
      crc_pass_fail_n(0) => rx_crc_gen1_i_n_6,
      gtrxreset_o_reg => gtrxreset_o_reg,
      ll_valid_r => ll_valid_r,
      p_13_in => p_13_in,
      rx_sof_crc => rx_sof_crc,
      rx_src_rdy_crc => rx_src_rdy_crc
    );
sof_ds_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => sof_ds_c,
      Q => sof_ds_r,
      R => SR(0)
    );
sof_eof_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \^wait_r\,
      I1 => \^sof_n_us_r_reg_0\,
      I2 => rx_src_rdy_crc,
      I3 => rx_eof_crc,
      O => sof_eof_c
    );
sof_eof_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => sof_eof_c,
      Q => sof_eof_r,
      R => SR(0)
    );
\wait_r_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5554FFFF55540000"
    )
        port map (
      I0 => rx_sof_crc,
      I1 => eof_ds_r,
      I2 => sof_eof_r,
      I3 => idle_r,
      I4 => p_13_in,
      I5 => \^wait_r\,
      O => wait_c
    );
wait_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => wait_c,
      Q => \^wait_r\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_RX_LL is
  port (
    rx_rem_crc : out STD_LOGIC;
    storage_v_r : out STD_LOGIC;
    rx_src_rdy_crc : out STD_LOGIC;
    rx_sof_crc : out STD_LOGIC;
    rx_eof_crc : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    in_frame_r : out STD_LOGIC;
    \crc_data_i_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    sof_ds_c : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \DATA_US_r_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    data_width_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_snf : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    rx_pad_i : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    RX_ECP_reg : in STD_LOGIC;
    RX_ECP_reg_0 : in STD_LOGIC;
    rx_ecp_i : in STD_LOGIC;
    rx_pe_data_v_i : in STD_LOGIC;
    rx_scp_i : in STD_LOGIC;
    RX_SCP_reg : in STD_LOGIC;
    \count_reg[0]\ : in STD_LOGIC;
    wait_r : in STD_LOGIC;
    tx_dst_rdy_crc : in STD_LOGIC;
    do_cc_r : in STD_LOGIC;
    \DATA_US_r_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \RX_PE_DATA_reg[0]\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_RX_LL : entity is "merger_aurora_RX_LL";
end merger_aurora_merger_aurora_RX_LL;

architecture STRUCTURE of merger_aurora_merger_aurora_RX_LL is
begin
nfc_module_i: entity work.merger_aurora_merger_aurora_RX_LL_NFC
     port map (
      Q(0) => Q(0),
      \RX_FC_NB_reg[0]\(3 downto 0) => \RX_PE_DATA_reg[0]\(7 downto 4),
      SS(0) => SS(0),
      do_cc_r => do_cc_r,
      gtrxreset_o_reg => gtrxreset_o_reg,
      m_axi_rx_snf => m_axi_rx_snf,
      tx_dst_rdy_crc => tx_dst_rdy_crc
    );
rx_ll_pdu_datapath_i: entity work.merger_aurora_merger_aurora_RX_LL_PDU_DATAPATH
     port map (
      D(15 downto 0) => D(15 downto 0),
      \DATA_US_r_reg[15]\(15 downto 0) => \DATA_US_r_reg[15]\(15 downto 0),
      \DATA_US_r_reg[7]\(7 downto 0) => \DATA_US_r_reg[7]\(7 downto 0),
      E(0) => E(0),
      EOF_N_US_r_reg => rx_eof_crc,
      FRAME_ERR_reg_0 => storage_v_r,
      FRAME_ERR_reg_1 => in_frame_r,
      RX_ECP_reg => RX_ECP_reg,
      RX_ECP_reg_0 => RX_ECP_reg_0,
      \RX_PE_DATA_reg[0]\(15 downto 0) => \RX_PE_DATA_reg[0]\(15 downto 0),
      RX_SCP_reg => RX_SCP_reg,
      SS(0) => SS(0),
      \count_reg[0]\ => \count_reg[0]\,
      \crc_data_i_reg[0]\(0) => \crc_data_i_reg[0]\(0),
      data_width_reg => data_width_reg,
      frame_err => frame_err,
      gtrxreset_o_reg => gtrxreset_o_reg,
      rem_in_reg => rx_rem_crc,
      rx_ecp_i => rx_ecp_i,
      rx_pad_i => rx_pad_i,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_scp_i => rx_scp_i,
      rx_sof_crc => rx_sof_crc,
      sof_ds_c => sof_ds_c,
      sof_ds_r_reg => rx_src_rdy_crc,
      wait_r => wait_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_SUPPORT_RESET_LOGIC is
  port (
    gt_reset_out : out STD_LOGIC;
    in0 : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_level_out_d3_reg : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_SUPPORT_RESET_LOGIC : entity is "merger_aurora_SUPPORT_RESET_LOGIC";
end merger_aurora_merger_aurora_SUPPORT_RESET_LOGIC;

architecture STRUCTURE of merger_aurora_merger_aurora_SUPPORT_RESET_LOGIC is
  signal debounce_gt_rst_r : STD_LOGIC_VECTOR ( 0 to 3 );
  attribute async_reg : string;
  attribute async_reg of debounce_gt_rst_r : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of debounce_gt_rst_r : signal is "{no}";
  signal \^gt_reset_out\ : STD_LOGIC;
  signal gt_rst_r0_n_0 : STD_LOGIC;
  signal gt_rst_sync : STD_LOGIC;
  signal reset_debounce_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal reset_debounce_r20_n_0 : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \debounce_gt_rst_r_reg[0]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[0]\ : label is "{no}";
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[1]\ : label is std.standard.true;
  attribute KEEP of \debounce_gt_rst_r_reg[1]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[1]\ : label is "{no}";
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[2]\ : label is std.standard.true;
  attribute KEEP of \debounce_gt_rst_r_reg[2]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[2]\ : label is "{no}";
  attribute ASYNC_REG_boolean of \debounce_gt_rst_r_reg[3]\ : label is std.standard.true;
  attribute KEEP of \debounce_gt_rst_r_reg[3]\ : label is "yes";
  attribute shift_extract of \debounce_gt_rst_r_reg[3]\ : label is "{no}";
begin
  gt_reset_out <= \^gt_reset_out\;
\debounce_gt_rst_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3_reg(0),
      Q => debounce_gt_rst_r(0),
      R => '0'
    );
\debounce_gt_rst_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => debounce_gt_rst_r(0),
      Q => debounce_gt_rst_r(1),
      R => '0'
    );
\debounce_gt_rst_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => debounce_gt_rst_r(1),
      Q => debounce_gt_rst_r(2),
      R => '0'
    );
\debounce_gt_rst_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => debounce_gt_rst_r(2),
      Q => debounce_gt_rst_r(3),
      R => '0'
    );
gt_rst_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => debounce_gt_rst_r(2),
      I1 => debounce_gt_rst_r(3),
      I2 => debounce_gt_rst_r(0),
      I3 => debounce_gt_rst_r(1),
      O => gt_rst_r0_n_0
    );
gt_rst_r_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0\
     port map (
      AS(0) => gt_rst_sync,
      gt_reset_out => \^gt_reset_out\,
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in
    );
gt_rst_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gt_rst_r0_n_0,
      Q => \^gt_reset_out\,
      R => '0'
    );
reset_debounce_r20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => reset_debounce_r(2),
      I1 => reset_debounce_r(3),
      I2 => reset_debounce_r(0),
      I3 => reset_debounce_r(1),
      O => reset_debounce_r20_n_0
    );
reset_debounce_r2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_debounce_r20_n_0,
      Q => in0,
      R => '0'
    );
\reset_debounce_r_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => D(0),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(0)
    );
\reset_debounce_r_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_debounce_r(0),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(1)
    );
\reset_debounce_r_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_debounce_r(1),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(2)
    );
\reset_debounce_r_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => reset_debounce_r(2),
      PRE => gt_rst_sync,
      Q => reset_debounce_r(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_TX_CRC is
  port (
    tx_sof_crc : out STD_LOGIC;
    tx_eof_crc : out STD_LOGIC;
    tx_src_rdy_crc : out STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    next_sof_c : out STD_LOGIC;
    next_sof_data_eof_1_c : out STD_LOGIC;
    \do_eof_c__0\ : out STD_LOGIC;
    storage_pad_r0 : out STD_LOGIC;
    in_frame_r_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    tx_dst_rdy_crc : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    data_eof_3_r : in STD_LOGIC;
    sof_data_eof_3_r : in STD_LOGIC;
    idle_r : in STD_LOGIC;
    in_frame_r_reg_0 : in STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_TX_CRC : entity is "merger_aurora_TX_CRC";
end merger_aurora_merger_aurora_TX_CRC;

architecture STRUCTURE of merger_aurora_merger_aurora_TX_CRC is
  signal CRC1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CRC_DATAVALID1 : STD_LOGIC;
  signal CRC_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \DATA_DS[15]_i_3_n_0\ : STD_LOGIC;
  signal \DATA_DS[15]_i_4_n_0\ : STD_LOGIC;
  signal \DATA_DS[15]_i_5_n_0\ : STD_LOGIC;
  signal \DATA_DS[7]_i_2_n_0\ : STD_LOGIC;
  signal \DATA_DS[7]_i_3_n_0\ : STD_LOGIC;
  signal DATA_US_2r : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DATA_US_r : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \EOF_N_DS1__0\ : STD_LOGIC;
  signal EOF_N_US_r : STD_LOGIC;
  signal REM_DS_i_1_n_0 : STD_LOGIC;
  signal SOF_N_DS_i_1_n_0 : STD_LOGIC;
  signal SRC_RDY_N_DS0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal crc_c : STD_LOGIC;
  signal crc_r : STD_LOGIC;
  signal data_c : STD_LOGIC;
  signal data_r : STD_LOGIC;
  signal eof_ds_r : STD_LOGIC;
  signal eof_sc_r : STD_LOGIC;
  signal idle_c : STD_LOGIC;
  signal idle_r_0 : STD_LOGIC;
  signal idle_r_i_3_n_0 : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rem_in : STD_LOGIC;
  signal rem_in_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_tx_tready\ : STD_LOGIC;
  signal sc_frame_c : STD_LOGIC;
  signal sc_frame_r : STD_LOGIC;
  signal sof_data_eof_1_r_i_2_n_0 : STD_LOGIC;
  signal sof_ds_c : STD_LOGIC;
  signal sof_ds_r : STD_LOGIC;
  signal sof_sc_r : STD_LOGIC;
  signal src_not_rdy_c : STD_LOGIC;
  signal src_not_rdy_r : STD_LOGIC;
  signal tx_eof : STD_LOGIC;
  signal \^tx_eof_crc\ : STD_LOGIC;
  signal tx_rem_crc : STD_LOGIC;
  signal \^tx_sof_crc\ : STD_LOGIC;
  signal \^tx_src_rdy_crc\ : STD_LOGIC;
  signal wait_c : STD_LOGIC;
  signal wait_r : STD_LOGIC;
  signal wait_r_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DATA_DS[15]_i_3\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \DATA_DS[7]_i_3\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of SOF_N_DS_i_1 : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of TX_DST_RDY_N_i_5 : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of crc_r_i_1 : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of idle_r_i_2 : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of in_frame_r_i_1 : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of s_axi_tx_tready_INST_0 : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of sc_frame_r_i_2 : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of sof_data_eof_1_r_i_2 : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of src_not_rdy_r_i_1 : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of wait_r_i_2 : label is "soft_lutpair115";
begin
  s_axi_tx_tready <= \^s_axi_tx_tready\;
  tx_eof_crc <= \^tx_eof_crc\;
  tx_sof_crc <= \^tx_sof_crc\;
  tx_src_rdy_crc <= \^tx_src_rdy_crc\;
\CRC_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(0),
      Q => CRC_reg(0),
      R => '0'
    );
\CRC_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(10),
      Q => CRC_reg(10),
      R => '0'
    );
\CRC_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(11),
      Q => CRC_reg(11),
      R => '0'
    );
\CRC_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(12),
      Q => CRC_reg(12),
      R => '0'
    );
\CRC_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(13),
      Q => CRC_reg(13),
      R => '0'
    );
\CRC_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(14),
      Q => CRC_reg(14),
      R => '0'
    );
\CRC_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(15),
      Q => CRC_reg(15),
      R => '0'
    );
\CRC_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(1),
      Q => CRC_reg(1),
      R => '0'
    );
\CRC_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(2),
      Q => CRC_reg(2),
      R => '0'
    );
\CRC_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(3),
      Q => CRC_reg(3),
      R => '0'
    );
\CRC_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(4),
      Q => CRC_reg(4),
      R => '0'
    );
\CRC_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(5),
      Q => CRC_reg(5),
      R => '0'
    );
\CRC_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(6),
      Q => CRC_reg(6),
      R => '0'
    );
\CRC_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(7),
      Q => CRC_reg(7),
      R => '0'
    );
\CRC_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(8),
      Q => CRC_reg(8),
      R => '0'
    );
\CRC_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => CRC1(9),
      Q => CRC_reg(9),
      R => '0'
    );
\DATA_DS[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(10),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(2),
      I4 => CRC_reg(10),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(10)
    );
\DATA_DS[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(11),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(3),
      I4 => CRC_reg(11),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(11)
    );
\DATA_DS[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(12),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(4),
      I4 => CRC_reg(12),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(12)
    );
\DATA_DS[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(13),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(5),
      I4 => CRC_reg(13),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(13)
    );
\DATA_DS[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(14),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(6),
      I4 => CRC_reg(14),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(14)
    );
\DATA_DS[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(15),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(7),
      I4 => CRC_reg(15),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(15)
    );
\DATA_DS[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFF1"
    )
        port map (
      I0 => eof_sc_r,
      I1 => eof_ds_r,
      I2 => sof_sc_r,
      I3 => crc_r,
      I4 => SR(0),
      O => \DATA_DS[15]_i_3_n_0\
    );
\DATA_DS[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001010100"
    )
        port map (
      I0 => SR(0),
      I1 => crc_r,
      I2 => sof_sc_r,
      I3 => eof_ds_r,
      I4 => eof_sc_r,
      I5 => rem_in,
      O => \DATA_DS[15]_i_4_n_0\
    );
\DATA_DS[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010000000000"
    )
        port map (
      I0 => SR(0),
      I1 => crc_r,
      I2 => sof_sc_r,
      I3 => eof_ds_r,
      I4 => eof_sc_r,
      I5 => rem_in,
      O => \DATA_DS[15]_i_5_n_0\
    );
\DATA_DS[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF10001"
    )
        port map (
      I0 => eof_sc_r,
      I1 => eof_ds_r,
      I2 => crc_r,
      I3 => sof_sc_r,
      I4 => rem_in,
      I5 => SR(0),
      O => \DATA_DS[7]_i_2_n_0\
    );
\DATA_DS[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => rem_in,
      I1 => sof_sc_r,
      I2 => crc_r,
      I3 => SR(0),
      O => \DATA_DS[7]_i_3_n_0\
    );
\DATA_DS[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(8),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(0),
      I4 => CRC_reg(8),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(8)
    );
\DATA_DS[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \DATA_DS[15]_i_3_n_0\,
      I1 => DATA_US_2r(9),
      I2 => \DATA_DS[15]_i_4_n_0\,
      I3 => CRC_reg(1),
      I4 => CRC_reg(9),
      I5 => \DATA_DS[15]_i_5_n_0\,
      O => p_1_in(9)
    );
\DATA_DS_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(0),
      Q => Q(0),
      R => '0'
    );
\DATA_DS_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(10),
      Q => Q(10),
      R => '0'
    );
\DATA_DS_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(11),
      Q => Q(11),
      R => '0'
    );
\DATA_DS_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(12),
      Q => Q(12),
      R => '0'
    );
\DATA_DS_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(13),
      Q => Q(13),
      R => '0'
    );
\DATA_DS_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(14),
      Q => Q(14),
      R => '0'
    );
\DATA_DS_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(15),
      Q => Q(15),
      R => '0'
    );
\DATA_DS_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(1),
      Q => Q(1),
      R => '0'
    );
\DATA_DS_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(2),
      Q => Q(2),
      R => '0'
    );
\DATA_DS_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(3),
      Q => Q(3),
      R => '0'
    );
\DATA_DS_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(4),
      Q => Q(4),
      R => '0'
    );
\DATA_DS_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(5),
      Q => Q(5),
      R => '0'
    );
\DATA_DS_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(6),
      Q => Q(6),
      R => '0'
    );
\DATA_DS_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(7),
      Q => Q(7),
      R => '0'
    );
\DATA_DS_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(8),
      Q => Q(8),
      R => '0'
    );
\DATA_DS_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => E(0),
      D => p_1_in(9),
      Q => Q(9),
      R => '0'
    );
\DATA_US_2r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(0),
      Q => DATA_US_2r(0),
      R => '0'
    );
\DATA_US_2r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(10),
      Q => DATA_US_2r(10),
      R => '0'
    );
\DATA_US_2r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(11),
      Q => DATA_US_2r(11),
      R => '0'
    );
\DATA_US_2r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(12),
      Q => DATA_US_2r(12),
      R => '0'
    );
\DATA_US_2r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(13),
      Q => DATA_US_2r(13),
      R => '0'
    );
\DATA_US_2r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(14),
      Q => DATA_US_2r(14),
      R => '0'
    );
\DATA_US_2r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(15),
      Q => DATA_US_2r(15),
      R => '0'
    );
\DATA_US_2r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(1),
      Q => DATA_US_2r(1),
      R => '0'
    );
\DATA_US_2r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(2),
      Q => DATA_US_2r(2),
      R => '0'
    );
\DATA_US_2r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(3),
      Q => DATA_US_2r(3),
      R => '0'
    );
\DATA_US_2r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(4),
      Q => DATA_US_2r(4),
      R => '0'
    );
\DATA_US_2r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(5),
      Q => DATA_US_2r(5),
      R => '0'
    );
\DATA_US_2r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(6),
      Q => DATA_US_2r(6),
      R => '0'
    );
\DATA_US_2r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(7),
      Q => DATA_US_2r(7),
      R => '0'
    );
\DATA_US_2r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(8),
      Q => DATA_US_2r(8),
      R => '0'
    );
\DATA_US_2r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => DATA_US_r(9),
      Q => DATA_US_2r(9),
      R => '0'
    );
\DATA_US_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(15),
      Q => DATA_US_r(0),
      R => '0'
    );
\DATA_US_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(5),
      Q => DATA_US_r(10),
      R => '0'
    );
\DATA_US_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(4),
      Q => DATA_US_r(11),
      R => '0'
    );
\DATA_US_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(3),
      Q => DATA_US_r(12),
      R => '0'
    );
\DATA_US_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(2),
      Q => DATA_US_r(13),
      R => '0'
    );
\DATA_US_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(1),
      Q => DATA_US_r(14),
      R => '0'
    );
\DATA_US_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(0),
      Q => DATA_US_r(15),
      R => '0'
    );
\DATA_US_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(14),
      Q => DATA_US_r(1),
      R => '0'
    );
\DATA_US_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(13),
      Q => DATA_US_r(2),
      R => '0'
    );
\DATA_US_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(12),
      Q => DATA_US_r(3),
      R => '0'
    );
\DATA_US_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(11),
      Q => DATA_US_r(4),
      R => '0'
    );
\DATA_US_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(10),
      Q => DATA_US_r(5),
      R => '0'
    );
\DATA_US_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(9),
      Q => DATA_US_r(6),
      R => '0'
    );
\DATA_US_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(8),
      Q => DATA_US_r(7),
      R => '0'
    );
\DATA_US_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(7),
      Q => DATA_US_r(8),
      R => '0'
    );
\DATA_US_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => s_axi_tx_tdata(6),
      Q => DATA_US_r(9),
      R => '0'
    );
EOF_N_DS_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => eof_ds_r,
      I1 => eof_sc_r,
      O => p_0_in1_in
    );
EOF_N_DS_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => p_0_in1_in,
      Q => \^tx_eof_crc\,
      S => SR(0)
    );
EOF_N_US_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_tx_tlast,
      O => tx_eof
    );
EOF_N_US_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => CRC_DATAVALID1,
      D => tx_eof,
      Q => EOF_N_US_r,
      R => '0'
    );
REM_DS_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFAEEFAEEFAEEFF"
    )
        port map (
      I0 => SR(0),
      I1 => tx_rem_crc,
      I2 => rem_in,
      I3 => tx_dst_rdy_crc,
      I4 => eof_sc_r,
      I5 => eof_ds_r,
      O => REM_DS_i_1_n_0
    );
REM_DS_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => REM_DS_i_1_n_0,
      Q => tx_rem_crc,
      R => '0'
    );
SOF_N_DS_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sof_sc_r,
      I1 => sof_ds_r,
      O => SOF_N_DS_i_1_n_0
    );
SOF_N_DS_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => SOF_N_DS_i_1_n_0,
      Q => \^tx_sof_crc\,
      S => SR(0)
    );
SRC_RDY_N_DS_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => idle_r_0,
      I1 => sc_frame_r,
      I2 => wait_r,
      I3 => src_not_rdy_r,
      O => SRC_RDY_N_DS0
    );
SRC_RDY_N_DS_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => SRC_RDY_N_DS0,
      Q => \^tx_src_rdy_crc\,
      S => SR(0)
    );
TX_DST_RDY_N_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => tx_dst_rdy_crc,
      I1 => \^tx_src_rdy_crc\,
      I2 => \^tx_eof_crc\,
      O => \do_eof_c__0\
    );
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5140"
    )
        port map (
      I0 => SR(0),
      I1 => tx_dst_rdy_crc,
      I2 => count(0),
      I3 => count(1),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC02CC00"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => tx_dst_rdy_crc,
      I2 => count(0),
      I3 => count(1),
      I4 => s_axi_tx_tvalid,
      O => \count[1]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => count(1),
      R => SR(0)
    );
crc_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0F0F08"
    )
        port map (
      I0 => src_not_rdy_r,
      I1 => s_axi_tx_tvalid,
      I2 => EOF_N_US_r,
      I3 => data_r,
      I4 => sof_ds_r,
      O => crc_c
    );
crc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => crc_c,
      Q => crc_r,
      R => SR(0)
    );
\data_r_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE00000"
    )
        port map (
      I0 => src_not_rdy_r,
      I1 => data_r,
      I2 => s_axi_tx_tvalid,
      I3 => sof_ds_r,
      I4 => EOF_N_US_r,
      O => data_c
    );
data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => data_c,
      Q => data_r,
      R => SR(0)
    );
eof_ds_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => crc_r,
      Q => eof_ds_r,
      R => SR(0)
    );
eof_sc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => sof_sc_r,
      Q => eof_sc_r,
      R => SR(0)
    );
idle_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => idle_r_i_3_n_0,
      I1 => eof_sc_r,
      I2 => eof_ds_r,
      I3 => idle_r_0,
      O => idle_c
    );
idle_r_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => new_pkt_r_reg,
      I1 => s_axi_tx_tvalid,
      I2 => count(1),
      I3 => count(0),
      I4 => tx_dst_rdy_crc,
      O => idle_r_i_3_n_0
    );
idle_r_reg: unisim.vcomponents.FDSE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => idle_c,
      Q => idle_r_0,
      S => SR(0)
    );
in_frame_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFA0002"
    )
        port map (
      I0 => \^tx_eof_crc\,
      I1 => \^tx_sof_crc\,
      I2 => \^tx_src_rdy_crc\,
      I3 => tx_dst_rdy_crc,
      I4 => in_frame_r_reg_0,
      O => in_frame_r_reg
    );
rem_in_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EA2AEAEA"
    )
        port map (
      I0 => rem_in,
      I1 => CRC_DATAVALID1,
      I2 => s_axi_tx_tlast,
      I3 => s_axi_tx_tkeep(1),
      I4 => s_axi_tx_tkeep(0),
      O => rem_in_i_1_n_0
    );
rem_in_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rem_in_i_1_n_0,
      Q => rem_in,
      R => '0'
    );
s_axi_tx_tready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => tx_dst_rdy_crc,
      O => \^s_axi_tx_tready\
    );
sc_frame_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0E00000000000000"
    )
        port map (
      I0 => idle_r_0,
      I1 => \EOF_N_DS1__0\,
      I2 => new_pkt_r_reg,
      I3 => s_axi_tx_tvalid,
      I4 => s_axi_tx_tlast,
      I5 => \^s_axi_tx_tready\,
      O => sc_frame_c
    );
sc_frame_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => eof_sc_r,
      I1 => eof_ds_r,
      O => \EOF_N_DS1__0\
    );
sc_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => sc_frame_c,
      Q => sc_frame_r,
      R => SR(0)
    );
sof_data_eof_1_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000555400000000"
    )
        port map (
      I0 => \^tx_sof_crc\,
      I1 => data_eof_3_r,
      I2 => sof_data_eof_3_r,
      I3 => idle_r,
      I4 => \^tx_eof_crc\,
      I5 => sof_data_eof_1_r_i_2_n_0,
      O => next_sof_data_eof_1_c
    );
sof_data_eof_1_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^tx_src_rdy_crc\,
      I1 => tx_dst_rdy_crc,
      O => sof_data_eof_1_r_i_2_n_0
    );
sof_ds_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wait_r,
      I1 => s_axi_tx_tvalid,
      O => sof_ds_c
    );
sof_ds_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => sof_ds_c,
      Q => sof_ds_r,
      R => SR(0)
    );
sof_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5554000000000000"
    )
        port map (
      I0 => \^tx_sof_crc\,
      I1 => data_eof_3_r,
      I2 => sof_data_eof_3_r,
      I3 => idle_r,
      I4 => \^tx_eof_crc\,
      I5 => sof_data_eof_1_r_i_2_n_0,
      O => next_sof_c
    );
sof_sc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => sc_frame_r,
      Q => sof_sc_r,
      R => SR(0)
    );
src_not_rdy_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF00E0"
    )
        port map (
      I0 => data_r,
      I1 => sof_ds_r,
      I2 => EOF_N_US_r,
      I3 => s_axi_tx_tvalid,
      I4 => src_not_rdy_r,
      O => src_not_rdy_c
    );
src_not_rdy_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => src_not_rdy_c,
      Q => src_not_rdy_r,
      R => SR(0)
    );
storage_pad_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000100000001"
    )
        port map (
      I0 => \^tx_src_rdy_crc\,
      I1 => tx_dst_rdy_crc,
      I2 => tx_rem_crc,
      I3 => \^tx_eof_crc\,
      I4 => \^tx_sof_crc\,
      I5 => in_frame_r_reg_0,
      O => storage_pad_r0
    );
tx_crc_gen1_i: entity work.merger_aurora_merger_aurora_CRC_TOP
     port map (
      CRC_DATAVALID1 => CRC_DATAVALID1,
      \CRC_reg_reg[15]\(15 downto 0) => CRC1(15 downto 0),
      \CRC_reg_reg[7]\(7 downto 0) => CRC_reg(7 downto 0),
      D(7 downto 0) => p_1_in(7 downto 0),
      Q(7 downto 0) => DATA_US_2r(7 downto 0),
      SYSTEM_RESET_reg => \DATA_DS[15]_i_5_n_0\,
      count(1 downto 0) => count(1 downto 0),
      eof_sc_r_reg => \DATA_DS[7]_i_2_n_0\,
      gtrxreset_o_reg => gtrxreset_o_reg,
      new_pkt_r_reg => new_pkt_r_reg,
      rem_in_reg => \DATA_DS[7]_i_3_n_0\,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      tx_dst_rdy_crc => tx_dst_rdy_crc
    );
wait_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000FFFF10000000"
    )
        port map (
      I0 => new_pkt_r_reg,
      I1 => s_axi_tx_tlast,
      I2 => \^s_axi_tx_tready\,
      I3 => wait_r_i_2_n_0,
      I4 => s_axi_tx_tvalid,
      I5 => wait_r,
      O => wait_c
    );
wait_r_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => idle_r_0,
      I1 => eof_ds_r,
      I2 => eof_sc_r,
      O => wait_r_i_2_n_0
    );
wait_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => p_0_in,
      D => wait_c,
      Q => wait_r,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_TX_LL is
  port (
    gen_cc_i : out STD_LOGIC;
    do_cc_r : out STD_LOGIC;
    tx_pe_data_v_i : out STD_LOGIC;
    gen_pad_i : out STD_LOGIC;
    s_axi_nfc_tx_tready : out STD_LOGIC;
    data_eof_3_r : out STD_LOGIC;
    idle_r : out STD_LOGIC;
    sof_data_eof_3_r : out STD_LOGIC;
    tx_dst_rdy_crc : out STD_LOGIC;
    gen_scp_i : out STD_LOGIC;
    gen_ecp_i : out STD_LOGIC;
    gen_snf_i : out STD_LOGIC;
    storage_v_r_reg : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    \tx_pe_data_r_reg[0]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \fc_nb_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtrxreset_o_reg : in STD_LOGIC;
    storage_pad_r0 : in STD_LOGIC;
    p_0_in_0 : in STD_LOGIC;
    do_nfc_r : in STD_LOGIC;
    Q : in STD_LOGIC;
    next_sof_data_eof_1_c : in STD_LOGIC;
    next_sof_c : in STD_LOGIC;
    EOF_N_DS_reg : in STD_LOGIC;
    \nfc_counter_r_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \do_eof_c__0\ : in STD_LOGIC;
    tx_eof_crc : in STD_LOGIC;
    tx_src_rdy_crc : in STD_LOGIC;
    tx_sof_crc : in STD_LOGIC;
    s_axi_nfc_req : in STD_LOGIC;
    warn_cc : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_TX_LL : entity is "merger_aurora_TX_LL";
end merger_aurora_merger_aurora_TX_LL;

architecture STRUCTURE of merger_aurora_merger_aurora_TX_LL is
  signal GEN_PAD0 : STD_LOGIC;
  signal TX_PE_DATA_V0 : STD_LOGIC;
  signal gen_pad_r : STD_LOGIC;
  signal in_frame_c : STD_LOGIC;
  signal pdu_ok_c : STD_LOGIC;
  signal \^storage_v_r_reg\ : STD_LOGIC;
  signal tx_pe_data_v_r : STD_LOGIC;
begin
  storage_v_r_reg <= \^storage_v_r_reg\;
tx_ll_control_i: entity work.merger_aurora_merger_aurora_TX_LL_CONTROL
     port map (
      E(0) => pdu_ok_c,
      GEN_ECP_reg_0 => data_eof_3_r,
      GEN_ECP_reg_1 => sof_data_eof_3_r,
      GEN_PAD0 => GEN_PAD0,
      Q => Q,
      TX_PE_DATA_V0 => TX_PE_DATA_V0,
      \do_eof_c__0\ => \do_eof_c__0\,
      do_nfc_r => do_nfc_r,
      \fc_nb_r_reg[0]\(3 downto 0) => \fc_nb_r_reg[0]\(3 downto 0),
      gen_cc_flop_0_i_0 => do_cc_r,
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_pad_r => gen_pad_r,
      gen_scp_i => gen_scp_i,
      gen_snf_i => gen_snf_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      idle_r => idle_r,
      in_frame_c => in_frame_c,
      in_frame_r_reg => \^storage_v_r_reg\,
      next_sof_c => next_sof_c,
      next_sof_data_eof_1_c => next_sof_data_eof_1_c,
      \nfc_counter_r_reg[0]\(0) => \nfc_counter_r_reg[0]\(0),
      p_0_in => p_0_in,
      p_0_in_0 => p_0_in_0,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_nb(0 to 3),
      s_axi_nfc_req => s_axi_nfc_req,
      s_axi_nfc_tx_tready => s_axi_nfc_tx_tready,
      storage_v_r_reg => tx_dst_rdy_crc,
      tx_eof_crc => tx_eof_crc,
      tx_pe_data_v_r => tx_pe_data_v_r,
      tx_sof_crc => tx_sof_crc,
      tx_src_rdy_crc => tx_src_rdy_crc,
      warn_cc => warn_cc
    );
tx_ll_datapath_i: entity work.merger_aurora_merger_aurora_TX_LL_DATAPATH
     port map (
      D(15 downto 0) => D(15 downto 0),
      E(0) => pdu_ok_c,
      EOF_N_DS_reg => EOF_N_DS_reg,
      GEN_PAD0 => GEN_PAD0,
      TX_PE_DATA_V0 => TX_PE_DATA_V0,
      gen_pad_i => gen_pad_i,
      gen_pad_r => gen_pad_r,
      gtrxreset_o_reg => gtrxreset_o_reg,
      in_frame_c => in_frame_c,
      p_0_in_0 => p_0_in_0,
      storage_pad_r0 => storage_pad_r0,
      storage_v_r_reg_0 => \^storage_v_r_reg\,
      \tx_pe_data_r_reg[0]_0\(15 downto 0) => \tx_pe_data_r_reg[0]\(15 downto 0),
      tx_pe_data_v_i => tx_pe_data_v_i,
      tx_pe_data_v_r => tx_pe_data_v_r
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_gtrxreset_seq is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtrxreset_out : out STD_LOGIC;
    drp_op_done : out STD_LOGIC;
    DRPADDR : out STD_LOGIC_VECTOR ( 6 downto 0 );
    drpwe_i : out STD_LOGIC;
    drpen_i : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    in0 : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    common_reset_i : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gtrxreset_o_reg_0 : in STD_LOGIC;
    drpwe_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC;
    drpdo_out : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_gtrxreset_seq : entity is "merger_aurora_gtrxreset_seq";
end merger_aurora_merger_aurora_gtrxreset_seq;

architecture STRUCTURE of merger_aurora_merger_aurora_gtrxreset_seq is
  signal DRP_OP_DONE_i_1_n_0 : STD_LOGIC;
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_state_reg_n_0_[1]\ : signal is "yes";
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_state_reg_n_0_[3]\ : signal is "yes";
  signal \FSM_onehot_state_reg_n_0_[4]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_state_reg_n_0_[4]\ : signal is "yes";
  signal \FSM_onehot_state_reg_n_0_[7]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_state_reg_n_0_[7]\ : signal is "yes";
  signal \^drp_op_done\ : STD_LOGIC;
  signal flag : STD_LOGIC;
  attribute RTL_KEEP of flag : signal is "yes";
  signal flag_i_1_n_0 : STD_LOGIC;
  signal flag_reg_n_0 : STD_LOGIC;
  signal gtrxreset_f : STD_LOGIC;
  signal \gtrxreset_i__0\ : STD_LOGIC;
  signal gtrxreset_s : STD_LOGIC;
  signal gtrxreset_ss : STD_LOGIC;
  signal next_rd_data : STD_LOGIC;
  signal original_rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal original_rd_data0 : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal p_0_in0_in : STD_LOGIC;
  attribute RTL_KEEP of p_0_in0_in : signal is "yes";
  signal \rd_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[10]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[11]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[12]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[13]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[14]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[15]_i_2_n_0\ : STD_LOGIC;
  signal \rd_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[8]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[9]_i_1_n_0\ : STD_LOGIC;
  signal rst_ss : STD_LOGIC;
  signal rxpmaresetdone_ss : STD_LOGIC;
  signal rxpmaresetdone_sss : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[3]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[4]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[5]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[6]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[6]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[7]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute KEEP of \FSM_onehot_state_reg[7]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of gtpe2_i_i_20 : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of gtpe2_i_i_21 : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of gtpe2_i_i_22 : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of gtpe2_i_i_24 : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of gtpe2_i_i_25 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of gtpe2_i_i_26 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \rd_data[0]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \rd_data[10]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \rd_data[11]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \rd_data[12]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \rd_data[13]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \rd_data[14]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \rd_data[15]_i_2\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \rd_data[1]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \rd_data[2]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \rd_data[3]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \rd_data[4]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \rd_data[5]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \rd_data[6]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \rd_data[7]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \rd_data[8]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \rd_data[9]_i_1\ : label is "soft_lutpair61";
begin
  drp_op_done <= \^drp_op_done\;
  \out\(1 downto 0) <= \^out\(1 downto 0);
DRP_OP_DONE_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => gtrxreset_o_reg_0,
      I1 => flag,
      I2 => \^drp_op_done\,
      O => DRP_OP_DONE_i_1_n_0
    );
DRP_OP_DONE_reg: unisim.vcomponents.FDCE
     port map (
      C => drpclk_in,
      CE => '1',
      CLR => gtrxreset_f,
      D => DRP_OP_DONE_i_1_n_0,
      Q => \^drp_op_done\
    );
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^out\(0),
      I1 => gtrxreset_o_reg_0,
      I2 => flag,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => gtrxreset_o_reg_0,
      I1 => flag,
      I2 => gtrxreset_ss,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => rxpmaresetdone_ss,
      I2 => rxpmaresetdone_sss,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD0D0D0"
    )
        port map (
      I0 => rxpmaresetdone_sss,
      I1 => rxpmaresetdone_ss,
      I2 => \FSM_onehot_state_reg_n_0_[3]\,
      I3 => gtrxreset_o_reg_0,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^out\(1),
      I1 => gtrxreset_o_reg_0,
      I2 => \FSM_onehot_state_reg_n_0_[4]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => gtrxreset_o_reg_0,
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[7]\,
      I1 => gtrxreset_o_reg_0,
      I2 => p_0_in0_in,
      O => \FSM_onehot_state[6]_i_1_n_0\
    );
\FSM_onehot_state[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => gtrxreset_ss,
      O => \FSM_onehot_state[7]_i_1_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => flag,
      R => rst_ss
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\,
      S => rst_ss
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \^out\(0),
      R => rst_ss
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\,
      R => rst_ss
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[4]\,
      R => rst_ss
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[5]_i_1_n_0\,
      Q => \^out\(1),
      R => rst_ss
    );
\FSM_onehot_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[6]_i_1_n_0\,
      Q => p_0_in0_in,
      R => rst_ss
    );
\FSM_onehot_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[7]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[7]\,
      R => rst_ss
    );
flag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF2"
    )
        port map (
      I0 => flag_reg_n_0,
      I1 => flag,
      I2 => \^out\(0),
      I3 => \FSM_onehot_state_reg_n_0_[3]\,
      I4 => \^out\(1),
      I5 => \FSM_onehot_state_reg_n_0_[4]\,
      O => flag_i_1_n_0
    );
flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => drpclk_in,
      CE => '1',
      D => flag_i_1_n_0,
      Q => flag_reg_n_0,
      R => '0'
    );
gtpe2_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBBBBB8"
    )
        port map (
      I0 => drpen_in,
      I1 => \^drp_op_done\,
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => \FSM_onehot_state_reg_n_0_[7]\,
      O => drpen_i
    );
gtpe2_i_i_19: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(6),
      O => DRPADDR(6)
    );
gtpe2_i_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBB8"
    )
        port map (
      I0 => drpwe_in,
      I1 => \^drp_op_done\,
      I2 => \^out\(0),
      I3 => \^out\(1),
      O => drpwe_i
    );
gtpe2_i_i_20: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(5),
      O => DRPADDR(5)
    );
gtpe2_i_i_21: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(4),
      O => DRPADDR(4)
    );
gtpe2_i_i_22: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(3),
      O => DRPADDR(3)
    );
gtpe2_i_i_24: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(2),
      O => DRPADDR(2)
    );
gtpe2_i_i_25: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(1),
      O => DRPADDR(1)
    );
gtpe2_i_i_26: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => drpaddr_in(0),
      O => DRPADDR(0)
    );
gtrxreset_i: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[7]\,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => gtrxreset_ss,
      I3 => \FSM_onehot_state_reg_n_0_[3]\,
      I4 => p_0_in0_in,
      I5 => \^out\(1),
      O => \gtrxreset_i__0\
    );
gtrxreset_in_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_4\
     port map (
      SR(0) => SR(0),
      drpclk_in => drpclk_in,
      init_clk_in => init_clk_in,
      \out\ => gtrxreset_f
    );
gtrxreset_o_reg: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => '1',
      D => \gtrxreset_i__0\,
      Q => gtrxreset_out,
      R => rst_ss
    );
gtrxreset_s_reg: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => '1',
      D => gtrxreset_f,
      Q => gtrxreset_s,
      R => rst_ss
    );
gtrxreset_ss_reg: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => '1',
      D => gtrxreset_s,
      Q => gtrxreset_ss,
      R => rst_ss
    );
\original_rd_data[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => flag_reg_n_0,
      I2 => gtrxreset_o_reg_0,
      O => original_rd_data0
    );
\original_rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(0),
      Q => original_rd_data(0),
      R => '0'
    );
\original_rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(10),
      Q => original_rd_data(10),
      R => '0'
    );
\original_rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(11),
      Q => original_rd_data(11),
      R => '0'
    );
\original_rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(12),
      Q => original_rd_data(12),
      R => '0'
    );
\original_rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(13),
      Q => original_rd_data(13),
      R => '0'
    );
\original_rd_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(14),
      Q => original_rd_data(14),
      R => '0'
    );
\original_rd_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(15),
      Q => original_rd_data(15),
      R => '0'
    );
\original_rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(1),
      Q => original_rd_data(1),
      R => '0'
    );
\original_rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(2),
      Q => original_rd_data(2),
      R => '0'
    );
\original_rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(3),
      Q => original_rd_data(3),
      R => '0'
    );
\original_rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(4),
      Q => original_rd_data(4),
      R => '0'
    );
\original_rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(5),
      Q => original_rd_data(5),
      R => '0'
    );
\original_rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(6),
      Q => original_rd_data(6),
      R => '0'
    );
\original_rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(7),
      Q => original_rd_data(7),
      R => '0'
    );
\original_rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(8),
      Q => original_rd_data(8),
      R => '0'
    );
\original_rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => original_rd_data0,
      D => drpdo_out(9),
      Q => original_rd_data(9),
      R => '0'
    );
\rd_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(0),
      I1 => original_rd_data(0),
      I2 => flag_reg_n_0,
      O => \rd_data[0]_i_1_n_0\
    );
\rd_data[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(10),
      I1 => original_rd_data(10),
      I2 => flag_reg_n_0,
      O => \rd_data[10]_i_1_n_0\
    );
\rd_data[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(11),
      I1 => original_rd_data(11),
      I2 => flag_reg_n_0,
      O => \rd_data[11]_i_1_n_0\
    );
\rd_data[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(12),
      I1 => original_rd_data(12),
      I2 => flag_reg_n_0,
      O => \rd_data[12]_i_1_n_0\
    );
\rd_data[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(13),
      I1 => original_rd_data(13),
      I2 => flag_reg_n_0,
      O => \rd_data[13]_i_1_n_0\
    );
\rd_data[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(14),
      I1 => original_rd_data(14),
      I2 => flag_reg_n_0,
      O => \rd_data[14]_i_1_n_0\
    );
\rd_data[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => gtrxreset_o_reg_0,
      O => next_rd_data
    );
\rd_data[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(15),
      I1 => original_rd_data(15),
      I2 => flag_reg_n_0,
      O => \rd_data[15]_i_2_n_0\
    );
\rd_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(1),
      I1 => original_rd_data(1),
      I2 => flag_reg_n_0,
      O => \rd_data[1]_i_1_n_0\
    );
\rd_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(2),
      I1 => original_rd_data(2),
      I2 => flag_reg_n_0,
      O => \rd_data[2]_i_1_n_0\
    );
\rd_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(3),
      I1 => original_rd_data(3),
      I2 => flag_reg_n_0,
      O => \rd_data[3]_i_1_n_0\
    );
\rd_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(4),
      I1 => original_rd_data(4),
      I2 => flag_reg_n_0,
      O => \rd_data[4]_i_1_n_0\
    );
\rd_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(5),
      I1 => original_rd_data(5),
      I2 => flag_reg_n_0,
      O => \rd_data[5]_i_1_n_0\
    );
\rd_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(6),
      I1 => original_rd_data(6),
      I2 => flag_reg_n_0,
      O => \rd_data[6]_i_1_n_0\
    );
\rd_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(7),
      I1 => original_rd_data(7),
      I2 => flag_reg_n_0,
      O => \rd_data[7]_i_1_n_0\
    );
\rd_data[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(8),
      I1 => original_rd_data(8),
      I2 => flag_reg_n_0,
      O => \rd_data[8]_i_1_n_0\
    );
\rd_data[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => drpdo_out(9),
      I1 => original_rd_data(9),
      I2 => flag_reg_n_0,
      O => \rd_data[9]_i_1_n_0\
    );
\rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[0]_i_1_n_0\,
      Q => Q(0),
      R => rst_ss
    );
\rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[10]_i_1_n_0\,
      Q => Q(10),
      R => rst_ss
    );
\rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[11]_i_1_n_0\,
      Q => Q(11),
      R => rst_ss
    );
\rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[12]_i_1_n_0\,
      Q => Q(12),
      R => rst_ss
    );
\rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[13]_i_1_n_0\,
      Q => Q(13),
      R => rst_ss
    );
\rd_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[14]_i_1_n_0\,
      Q => Q(14),
      R => rst_ss
    );
\rd_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[15]_i_2_n_0\,
      Q => Q(15),
      R => rst_ss
    );
\rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[1]_i_1_n_0\,
      Q => Q(1),
      R => rst_ss
    );
\rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[2]_i_1_n_0\,
      Q => Q(2),
      R => rst_ss
    );
\rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[3]_i_1_n_0\,
      Q => Q(3),
      R => rst_ss
    );
\rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[4]_i_1_n_0\,
      Q => Q(4),
      R => rst_ss
    );
\rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[5]_i_1_n_0\,
      Q => Q(5),
      R => rst_ss
    );
\rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[6]_i_1_n_0\,
      Q => Q(6),
      R => rst_ss
    );
\rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[7]_i_1_n_0\,
      Q => Q(7),
      R => rst_ss
    );
\rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[8]_i_1_n_0\,
      Q => Q(8),
      R => rst_ss
    );
\rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => next_rd_data,
      D => \rd_data[9]_i_1_n_0\,
      Q => Q(9),
      R => rst_ss
    );
rst_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_5\
     port map (
      SR(0) => rst_ss,
      common_reset_i => common_reset_i,
      drpclk_in => drpclk_in,
      init_clk_in => init_clk_in
    );
rxpmaresetdone_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_6
     port map (
      drpclk_in => drpclk_in,
      in0 => in0,
      \out\ => rxpmaresetdone_ss
    );
rxpmaresetdone_sss_reg: unisim.vcomponents.FDRE
     port map (
      C => drpclk_in,
      CE => '1',
      D => rxpmaresetdone_ss,
      Q => rxpmaresetdone_sss,
      R => rst_ss
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_hotplug is
  port (
    link_reset_out : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_hotplug : entity is "merger_aurora_hotplug";
end merger_aurora_merger_aurora_hotplug;

architecture STRUCTURE of merger_aurora_merger_aurora_hotplug is
  signal cc_sync : STD_LOGIC;
  signal \count_for_reset_r[0]_i_2_n_0\ : STD_LOGIC;
  signal count_for_reset_r_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \count_for_reset_r_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal link_reset_0 : STD_LOGIC;
  signal link_reset_0_i_1_n_0 : STD_LOGIC;
  signal link_reset_0_i_2_n_0 : STD_LOGIC;
  signal link_reset_0_i_3_n_0 : STD_LOGIC;
  signal link_reset_0_i_4_n_0 : STD_LOGIC;
  signal link_reset_0_i_5_n_0 : STD_LOGIC;
  signal link_reset_0_i_6_n_0 : STD_LOGIC;
  signal rx_cc_extend_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_cc_extend_r2 : STD_LOGIC;
  signal rx_cc_extend_r2_i_1_n_0 : STD_LOGIC;
  signal rx_cc_extend_r2_i_2_n_0 : STD_LOGIC;
  signal \NLW_count_for_reset_r_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_count_for_reset_r_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
begin
\count_for_reset_r[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_for_reset_r_reg(0),
      O => \count_for_reset_r[0]_i_2_n_0\
    );
\count_for_reset_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_7\,
      Q => count_for_reset_r_reg(0),
      R => cc_sync
    );
\count_for_reset_r_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_for_reset_r_reg[0]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[0]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[0]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_for_reset_r_reg[0]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[0]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[0]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[0]_i_1_n_7\,
      S(3 downto 1) => count_for_reset_r_reg(3 downto 1),
      S(0) => \count_for_reset_r[0]_i_2_n_0\
    );
\count_for_reset_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_5\,
      Q => count_for_reset_r_reg(10),
      R => cc_sync
    );
\count_for_reset_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_4\,
      Q => count_for_reset_r_reg(11),
      R => cc_sync
    );
\count_for_reset_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_7\,
      Q => count_for_reset_r_reg(12),
      R => cc_sync
    );
\count_for_reset_r_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[8]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[12]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[12]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[12]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[12]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[12]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[12]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[12]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(15 downto 12)
    );
\count_for_reset_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_6\,
      Q => count_for_reset_r_reg(13),
      R => cc_sync
    );
\count_for_reset_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_5\,
      Q => count_for_reset_r_reg(14),
      R => cc_sync
    );
\count_for_reset_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[12]_i_1_n_4\,
      Q => count_for_reset_r_reg(15),
      R => cc_sync
    );
\count_for_reset_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_7\,
      Q => count_for_reset_r_reg(16),
      R => cc_sync
    );
\count_for_reset_r_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[12]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[16]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[16]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[16]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[16]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[16]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[16]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[16]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(19 downto 16)
    );
\count_for_reset_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_6\,
      Q => count_for_reset_r_reg(17),
      R => cc_sync
    );
\count_for_reset_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_5\,
      Q => count_for_reset_r_reg(18),
      R => cc_sync
    );
\count_for_reset_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[16]_i_1_n_4\,
      Q => count_for_reset_r_reg(19),
      R => cc_sync
    );
\count_for_reset_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_6\,
      Q => count_for_reset_r_reg(1),
      R => cc_sync
    );
\count_for_reset_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[20]_i_1_n_7\,
      Q => count_for_reset_r_reg(20),
      R => cc_sync
    );
\count_for_reset_r_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[16]_i_1_n_0\,
      CO(3 downto 1) => \NLW_count_for_reset_r_reg[20]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \count_for_reset_r_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_count_for_reset_r_reg[20]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \count_for_reset_r_reg[20]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[20]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => count_for_reset_r_reg(21 downto 20)
    );
\count_for_reset_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[20]_i_1_n_6\,
      Q => count_for_reset_r_reg(21),
      R => cc_sync
    );
\count_for_reset_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_5\,
      Q => count_for_reset_r_reg(2),
      R => cc_sync
    );
\count_for_reset_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[0]_i_1_n_4\,
      Q => count_for_reset_r_reg(3),
      R => cc_sync
    );
\count_for_reset_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_7\,
      Q => count_for_reset_r_reg(4),
      R => cc_sync
    );
\count_for_reset_r_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[0]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[4]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[4]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[4]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[4]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[4]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[4]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[4]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(7 downto 4)
    );
\count_for_reset_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_6\,
      Q => count_for_reset_r_reg(5),
      R => cc_sync
    );
\count_for_reset_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_5\,
      Q => count_for_reset_r_reg(6),
      R => cc_sync
    );
\count_for_reset_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[4]_i_1_n_4\,
      Q => count_for_reset_r_reg(7),
      R => cc_sync
    );
\count_for_reset_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_7\,
      Q => count_for_reset_r_reg(8),
      R => cc_sync
    );
\count_for_reset_r_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_for_reset_r_reg[4]_i_1_n_0\,
      CO(3) => \count_for_reset_r_reg[8]_i_1_n_0\,
      CO(2) => \count_for_reset_r_reg[8]_i_1_n_1\,
      CO(1) => \count_for_reset_r_reg[8]_i_1_n_2\,
      CO(0) => \count_for_reset_r_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_for_reset_r_reg[8]_i_1_n_4\,
      O(2) => \count_for_reset_r_reg[8]_i_1_n_5\,
      O(1) => \count_for_reset_r_reg[8]_i_1_n_6\,
      O(0) => \count_for_reset_r_reg[8]_i_1_n_7\,
      S(3 downto 0) => count_for_reset_r_reg(11 downto 8)
    );
\count_for_reset_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r_reg[8]_i_1_n_6\,
      Q => count_for_reset_r_reg(9),
      R => cc_sync
    );
link_reset_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222222222222222"
    )
        port map (
      I0 => link_reset_0_i_2_n_0,
      I1 => link_reset_0_i_3_n_0,
      I2 => link_reset_0_i_4_n_0,
      I3 => count_for_reset_r_reg(0),
      I4 => count_for_reset_r_reg(4),
      I5 => count_for_reset_r_reg(1),
      O => link_reset_0_i_1_n_0
    );
link_reset_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => link_reset_0_i_5_n_0,
      I1 => count_for_reset_r_reg(19),
      I2 => count_for_reset_r_reg(7),
      I3 => count_for_reset_r_reg(15),
      I4 => count_for_reset_r_reg(10),
      I5 => link_reset_0_i_6_n_0,
      O => link_reset_0_i_2_n_0
    );
link_reset_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => count_for_reset_r_reg(14),
      I1 => count_for_reset_r_reg(9),
      I2 => count_for_reset_r_reg(5),
      I3 => count_for_reset_r_reg(12),
      I4 => count_for_reset_r_reg(6),
      I5 => count_for_reset_r_reg(17),
      O => link_reset_0_i_3_n_0
    );
link_reset_0_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_for_reset_r_reg(2),
      I1 => count_for_reset_r_reg(3),
      O => link_reset_0_i_4_n_0
    );
link_reset_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_for_reset_r_reg(18),
      I1 => count_for_reset_r_reg(16),
      I2 => count_for_reset_r_reg(20),
      I3 => count_for_reset_r_reg(11),
      O => link_reset_0_i_5_n_0
    );
link_reset_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07FFFFFFFFFFFFFF"
    )
        port map (
      I0 => count_for_reset_r_reg(2),
      I1 => count_for_reset_r_reg(3),
      I2 => count_for_reset_r_reg(4),
      I3 => count_for_reset_r_reg(8),
      I4 => count_for_reset_r_reg(13),
      I5 => count_for_reset_r_reg(21),
      O => link_reset_0_i_6_n_0
    );
link_reset_0_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_0_i_1_n_0,
      Q => link_reset_0,
      R => '0'
    );
\link_reset_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_0,
      Q => link_reset_out,
      R => '0'
    );
rx_cc_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_27\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => cc_sync,
      rx_cc_extend_r2 => rx_cc_extend_r2
    );
rx_cc_extend_r2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rx_cc_extend_r(2),
      I1 => rx_cc_extend_r(3),
      I2 => rx_cc_extend_r(0),
      I3 => rx_cc_extend_r(1),
      I4 => rx_cc_extend_r2_i_2_n_0,
      O => rx_cc_extend_r2_i_1_n_0
    );
rx_cc_extend_r2_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rx_cc_extend_r(5),
      I1 => rx_cc_extend_r(4),
      I2 => rx_cc_extend_r(7),
      I3 => rx_cc_extend_r(6),
      O => rx_cc_extend_r2_i_2_n_0
    );
rx_cc_extend_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r2_i_1_n_0,
      Q => rx_cc_extend_r2,
      R => '0'
    );
\rx_cc_extend_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(1),
      Q => rx_cc_extend_r(0),
      R => SR(0)
    );
\rx_cc_extend_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(2),
      Q => rx_cc_extend_r(1),
      R => SR(0)
    );
\rx_cc_extend_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(3),
      Q => rx_cc_extend_r(2),
      R => SR(0)
    );
\rx_cc_extend_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(4),
      Q => rx_cc_extend_r(3),
      R => SR(0)
    );
\rx_cc_extend_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(5),
      Q => rx_cc_extend_r(4),
      R => SR(0)
    );
\rx_cc_extend_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(6),
      Q => rx_cc_extend_r(5),
      R => SR(0)
    );
\rx_cc_extend_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rx_cc_extend_r(7),
      Q => rx_cc_extend_r(6),
      R => SR(0)
    );
\rx_cc_extend_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => D(0),
      Q => rx_cc_extend_r(7),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_rx_startup_fsm is
  port (
    gtrxreset_i_0 : out STD_LOGIC;
    gt_rxuserrdy_i : out STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    rxfsm_rxresetdone_r : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx_cdrlocked_reg : in STD_LOGIC;
    gt_txuserrdy_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_rx_startup_fsm : entity is "merger_aurora_rx_startup_fsm";
end merger_aurora_merger_aurora_rx_startup_fsm;

architecture STRUCTURE of merger_aurora_merger_aurora_rx_startup_fsm is
  signal \FSM_sequential_rx_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_9_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal RXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal check_tlock_max : STD_LOGIC;
  signal check_tlock_max_i_1_n_0 : STD_LOGIC;
  signal check_tlock_max_reg_n_0 : STD_LOGIC;
  signal \^gt_rxuserrdy_i\ : STD_LOGIC;
  signal \^gtrxreset_i_0\ : STD_LOGIC;
  signal gtrxreset_i_i_1_n_0 : STD_LOGIC;
  signal gtrxreset_s : STD_LOGIC;
  signal init_wait_count : STD_LOGIC;
  signal \init_wait_count[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \init_wait_done_i_1__0_n_0\ : STD_LOGIC;
  signal init_wait_done_reg_n_0 : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_4__0_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal \mmcm_lock_reclocked_i_2__0_n_0\ : STD_LOGIC;
  signal \p_0_in__3\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \p_0_in__4\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \reset_time_out_i_2__0_n_0\ : STD_LOGIC;
  signal reset_time_out_i_4_n_0 : STD_LOGIC;
  signal reset_time_out_i_6_n_0 : STD_LOGIC;
  signal reset_time_out_reg_n_0 : STD_LOGIC;
  signal \run_phase_alignment_int_i_1__0_n_0\ : STD_LOGIC;
  signal run_phase_alignment_int_reg_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3_reg_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  signal rx_fsm_reset_done_int_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_1_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_3_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal rx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of rx_state : signal is "yes";
  signal rxpmaresetdone_i : STD_LOGIC;
  signal rxpmaresetdone_rx_s : STD_LOGIC;
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_0 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_1 : STD_LOGIC;
  signal sync_pll0lock_cdc_sync_n_0 : STD_LOGIC;
  signal sync_pll0lock_cdc_sync_n_1 : STD_LOGIC;
  signal sync_rx_fsm_reset_done_int_cdc_sync_n_0 : STD_LOGIC;
  signal time_out_100us_i_1_n_0 : STD_LOGIC;
  signal time_out_100us_i_2_n_0 : STD_LOGIC;
  signal time_out_100us_i_3_n_0 : STD_LOGIC;
  signal time_out_100us_reg_n_0 : STD_LOGIC;
  signal time_out_1us_i_1_n_0 : STD_LOGIC;
  signal time_out_1us_i_2_n_0 : STD_LOGIC;
  signal time_out_1us_reg_n_0 : STD_LOGIC;
  signal time_out_2ms_i_1_n_0 : STD_LOGIC;
  signal time_out_2ms_i_2_n_0 : STD_LOGIC;
  signal \time_out_2ms_i_3__0_n_0\ : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_counter : STD_LOGIC;
  signal \time_out_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \time_out_counter_reg[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_wait_bypass_i_1__0_n_0\ : STD_LOGIC;
  signal time_out_wait_bypass_reg_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max_i_1_n_0 : STD_LOGIC;
  signal time_tlock_max_i_2_n_0 : STD_LOGIC;
  signal time_tlock_max_i_3_n_0 : STD_LOGIC;
  signal time_tlock_max_i_4_n_0 : STD_LOGIC;
  signal time_tlock_max_i_5_n_0 : STD_LOGIC;
  signal txpmaresetdone_i : STD_LOGIC;
  signal \wait_bypass_count[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_7__0_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_10__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_11__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_7__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_8__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_9__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_5__0_n_0\ : STD_LOGIC;
  signal wait_time_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \wait_time_cnt_reg[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[0]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_rx_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[1]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP of \FSM_sequential_rx_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[2]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP of \FSM_sequential_rx_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[3]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP of \FSM_sequential_rx_state_reg[3]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_2__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_3__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_4__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \mmcm_lock_count[0]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_4__0\ : label is "soft_lutpair37";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of run_phase_alignment_int_s3_reg : label is "no";
  attribute equivalent_register_removal of rx_fsm_reset_done_int_s3_reg : label is "no";
  attribute equivalent_register_removal of rxresetdone_s3_reg : label is "no";
  attribute SOFT_HLUTNM of time_out_100us_i_3 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of time_out_1us_i_2 : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \time_out_counter[0]_i_4__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \time_out_counter[0]_i_6\ : label is "soft_lutpair40";
  attribute equivalent_register_removal of time_out_wait_bypass_s3_reg : label is "no";
  attribute SOFT_HLUTNM of time_tlock_max_i_3 : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of time_tlock_max_i_4 : label is "soft_lutpair40";
begin
  gt_rxuserrdy_i <= \^gt_rxuserrdy_i\;
  gtrxreset_i_0 <= \^gtrxreset_i_0\;
\FSM_sequential_rx_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \FSM_sequential_rx_state[1]_i_2_n_0\,
      I1 => rx_state(3),
      I2 => \FSM_sequential_rx_state[0]_i_2_n_0\,
      O => \FSM_sequential_rx_state[0]_i_1_n_0\
    );
\FSM_sequential_rx_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80FF80FFC5FFC0FF"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_11_n_0\,
      I1 => time_out_2ms_reg_n_0,
      I2 => rx_state(1),
      I3 => rx_state(0),
      I4 => time_tlock_max,
      I5 => reset_time_out_reg_n_0,
      O => \FSM_sequential_rx_state[0]_i_2_n_0\
    );
\FSM_sequential_rx_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888BBBBBB8B8888"
    )
        port map (
      I0 => \FSM_sequential_rx_state[1]_i_2_n_0\,
      I1 => rx_state(3),
      I2 => rx_state(2),
      I3 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      I4 => rx_state(0),
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[1]_i_1_n_0\
    );
\FSM_sequential_rx_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FB000000"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_out_100us_reg_n_0,
      I2 => \^gt_rxuserrdy_i\,
      I3 => rx_state(0),
      I4 => \FSM_sequential_rx_state[3]_i_11_n_0\,
      O => \FSM_sequential_rx_state[1]_i_2_n_0\
    );
\FSM_sequential_rx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0414444404140404"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(2),
      I2 => rx_state(0),
      I3 => time_out_2ms_reg_n_0,
      I4 => rx_state(1),
      I5 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      O => \FSM_sequential_rx_state[2]_i_1_n_0\
    );
\FSM_sequential_rx_state[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_tlock_max,
      O => \FSM_sequential_rx_state[2]_i_2_n_0\
    );
\FSM_sequential_rx_state[3]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => rx_state(1),
      I1 => init_wait_done_reg_n_0,
      I2 => rx_state(0),
      I3 => rx_state(2),
      I4 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_10_n_0\
    );
\FSM_sequential_rx_state[3]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(1),
      I2 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_11_n_0\
    );
\FSM_sequential_rx_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33330000DDFD0000"
    )
        port map (
      I0 => rx_state(0),
      I1 => \^gt_rxuserrdy_i\,
      I2 => time_out_100us_reg_n_0,
      I3 => reset_time_out_reg_n_0,
      I4 => rx_state(3),
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[3]_i_3_n_0\
    );
\FSM_sequential_rx_state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00011101"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_9_n_0\,
      I1 => rx_state(1),
      I2 => rx_cdrlocked_reg,
      I3 => rx_state(0),
      I4 => mmcm_lock_reclocked,
      I5 => \FSM_sequential_rx_state[3]_i_10_n_0\,
      O => \FSM_sequential_rx_state[3]_i_4_n_0\
    );
\FSM_sequential_rx_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5700550057005700"
    )
        port map (
      I0 => rx_state(0),
      I1 => \FSM_sequential_rx_state[3]_i_11_n_0\,
      I2 => rxresetdone_s3,
      I3 => rx_state(1),
      I4 => reset_time_out_reg_n_0,
      I5 => time_out_2ms_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_5_n_0\
    );
\FSM_sequential_rx_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0D00000D0000000"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => reset_time_out_reg_n_0,
      I2 => rx_state(0),
      I3 => rx_state(3),
      I4 => rx_state(1),
      I5 => rx_state(2),
      O => \FSM_sequential_rx_state[3]_i_7_n_0\
    );
\FSM_sequential_rx_state[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FB00FBFFFFFFFFFF"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_out_100us_reg_n_0,
      I2 => \^gt_rxuserrdy_i\,
      I3 => rx_state(0),
      I4 => time_out_wait_bypass_s3,
      I5 => \FSM_sequential_rx_state[3]_i_11_n_0\,
      O => \FSM_sequential_rx_state[3]_i_8_n_0\
    );
\FSM_sequential_rx_state[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"27FF272727272727"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => reset_time_out_reg_n_0,
      I4 => time_tlock_max,
      I5 => rx_state(0),
      O => \FSM_sequential_rx_state[3]_i_9_n_0\
    );
\FSM_sequential_rx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_rx_state[0]_i_1_n_0\,
      Q => rx_state(0),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_rx_state[1]_i_1_n_0\,
      Q => rx_state(1),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_rx_state[2]_i_1_n_0\,
      Q => rx_state(2),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_rx_state_reg[3]_i_2_n_0\,
      Q => rx_state(3),
      R => AR(0)
    );
\FSM_sequential_rx_state_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \FSM_sequential_rx_state[3]_i_7_n_0\,
      I1 => \FSM_sequential_rx_state[3]_i_8_n_0\,
      O => \FSM_sequential_rx_state_reg[3]_i_2_n_0\,
      S => rx_state(3)
    );
RXUSERRDY_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFB40000000"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => gt_txuserrdy_i,
      I4 => rx_state(1),
      I5 => \^gt_rxuserrdy_i\,
      O => RXUSERRDY_i_1_n_0
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => RXUSERRDY_i_1_n_0,
      Q => \^gt_rxuserrdy_i\,
      R => AR(0)
    );
check_tlock_max_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0020"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(1),
      I2 => rx_state(0),
      I3 => rx_state(3),
      I4 => check_tlock_max_reg_n_0,
      O => check_tlock_max_i_1_n_0
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => check_tlock_max_i_1_n_0,
      Q => check_tlock_max_reg_n_0,
      R => AR(0)
    );
gtrxreset_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_14\
     port map (
      gtrxreset_i_0 => \^gtrxreset_i_0\,
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => gtrxreset_s
    );
gtrxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0002"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(2),
      I2 => rx_state(1),
      I3 => rx_state(3),
      I4 => \^gtrxreset_i_0\,
      O => gtrxreset_i_i_1_n_0
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_i_i_1_n_0,
      Q => \^gtrxreset_i_0\,
      R => AR(0)
    );
\init_wait_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      O => \p_0_in__3\(0)
    );
\init_wait_count[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      O => \p_0_in__3\(1)
    );
\init_wait_count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      O => \p_0_in__3\(2)
    );
\init_wait_count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(3),
      O => \p_0_in__3\(3)
    );
\init_wait_count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(4),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(2),
      I4 => \init_wait_count_reg__0\(3),
      O => \p_0_in__3\(4)
    );
\init_wait_count[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(5),
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(0),
      I4 => \init_wait_count_reg__0\(1),
      I5 => \init_wait_count_reg__0\(4),
      O => \p_0_in__3\(5)
    );
\init_wait_count[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(6),
      I1 => \init_wait_count_reg__0\(4),
      I2 => \init_wait_count_reg__0\(5),
      I3 => \init_wait_count[7]_i_4__0_n_0\,
      O => \p_0_in__3\(6)
    );
\init_wait_count[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \init_wait_count[7]_i_3__0_n_0\,
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(7),
      I4 => \init_wait_count_reg__0\(6),
      O => init_wait_count
    );
\init_wait_count[7]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(7),
      I1 => \init_wait_count[7]_i_4__0_n_0\,
      I2 => \init_wait_count_reg__0\(5),
      I3 => \init_wait_count_reg__0\(4),
      I4 => \init_wait_count_reg__0\(6),
      O => \p_0_in__3\(7)
    );
\init_wait_count[7]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \init_wait_count_reg__0\(5),
      I1 => \init_wait_count_reg__0\(4),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(0),
      O => \init_wait_count[7]_i_3__0_n_0\
    );
\init_wait_count[7]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(2),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(1),
      O => \init_wait_count[7]_i_4__0_n_0\
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(0),
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(4),
      Q => \init_wait_count_reg__0\(4)
    );
\init_wait_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(5),
      Q => \init_wait_count_reg__0\(5)
    );
\init_wait_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(6),
      Q => \init_wait_count_reg__0\(6)
    );
\init_wait_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => AR(0),
      D => \p_0_in__3\(7),
      Q => \init_wait_count_reg__0\(7)
    );
\init_wait_done_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => \init_wait_count[7]_i_3__0_n_0\,
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(7),
      I4 => \init_wait_count_reg__0\(6),
      I5 => init_wait_done_reg_n_0,
      O => \init_wait_done_i_1__0_n_0\
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      CLR => AR(0),
      D => \init_wait_done_i_1__0_n_0\,
      Q => init_wait_done_reg_n_0
    );
\mmcm_lock_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \p_0_in__4\(0)
    );
\mmcm_lock_count[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__4\(1)
    );
\mmcm_lock_count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__4\(2)
    );
\mmcm_lock_count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__4\(3)
    );
\mmcm_lock_count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(2),
      I4 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__4\(4)
    );
\mmcm_lock_count[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(5),
      I1 => \mmcm_lock_count_reg__0\(3),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(0),
      I4 => \mmcm_lock_count_reg__0\(1),
      I5 => \mmcm_lock_count_reg__0\(4),
      O => \p_0_in__4\(5)
    );
\mmcm_lock_count[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \mmcm_lock_count[9]_i_4__0_n_0\,
      I2 => \mmcm_lock_count_reg__0\(5),
      O => \p_0_in__4\(6)
    );
\mmcm_lock_count[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \mmcm_lock_count_reg__0\(5),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count[9]_i_4__0_n_0\,
      O => \p_0_in__4\(7)
    );
\mmcm_lock_count[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count[9]_i_4__0_n_0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(7),
      O => \p_0_in__4\(8)
    );
\mmcm_lock_count[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count[9]_i_4__0_n_0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(7),
      I5 => \mmcm_lock_count_reg__0\(9),
      O => \mmcm_lock_count[9]_i_2__0_n_0\
    );
\mmcm_lock_count[9]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(7),
      I2 => \mmcm_lock_count_reg__0\(5),
      I3 => \mmcm_lock_count_reg__0\(6),
      I4 => \mmcm_lock_count[9]_i_4__0_n_0\,
      I5 => \mmcm_lock_count_reg__0\(8),
      O => \p_0_in__4\(9)
    );
\mmcm_lock_count[9]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(2),
      I4 => \mmcm_lock_count_reg__0\(3),
      O => \mmcm_lock_count[9]_i_4__0_n_0\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(0),
      Q => \mmcm_lock_count_reg__0\(0),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(2),
      Q => \mmcm_lock_count_reg__0\(2),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(3),
      Q => \mmcm_lock_count_reg__0\(3),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(4),
      Q => \mmcm_lock_count_reg__0\(4),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(5),
      Q => \mmcm_lock_count_reg__0\(5),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(6),
      Q => \mmcm_lock_count_reg__0\(6),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(7),
      Q => \mmcm_lock_count_reg__0\(7),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(8),
      Q => \mmcm_lock_count_reg__0\(8),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2__0_n_0\,
      D => \p_0_in__4\(9),
      Q => \mmcm_lock_count_reg__0\(9),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_reclocked_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(7),
      I2 => \mmcm_lock_count_reg__0\(5),
      I3 => \mmcm_lock_count_reg__0\(6),
      I4 => \mmcm_lock_count[9]_i_4__0_n_0\,
      I5 => \mmcm_lock_count_reg__0\(8),
      O => \mmcm_lock_reclocked_i_2__0_n_0\
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_mmcm_lock_reclocked_cdc_sync_n_1,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
\reset_time_out_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rx_state(1),
      I1 => rxresetdone_s3,
      O => \reset_time_out_i_2__0_n_0\
    );
\reset_time_out_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(3),
      O => check_tlock_max
    );
reset_time_out_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_cdrlocked_reg,
      I2 => rx_state(0),
      I3 => mmcm_lock_reclocked,
      O => reset_time_out_i_4_n_0
    );
reset_time_out_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07DC07CC"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => rx_cdrlocked_reg,
      O => reset_time_out_i_6_n_0
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_pll0lock_cdc_sync_n_1,
      Q => reset_time_out_reg_n_0,
      S => AR(0)
    );
\run_phase_alignment_int_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0004"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(3),
      I2 => rx_state(1),
      I3 => rx_state(2),
      I4 => run_phase_alignment_int_reg_n_0,
      O => \run_phase_alignment_int_i_1__0_n_0\
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \run_phase_alignment_int_i_1__0_n_0\,
      Q => run_phase_alignment_int_reg_n_0,
      R => AR(0)
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3_reg_n_0,
      R => '0'
    );
rx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => rx_fsm_reset_done_int_0,
      I1 => rx_fsm_reset_done_int_i_3_n_0,
      I2 => rx_state(3),
      I3 => rx_state(2),
      I4 => rx_fsm_reset_done_int,
      O => rx_fsm_reset_done_int_i_1_n_0
    );
rx_fsm_reset_done_int_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(2),
      I2 => time_out_1us_reg_n_0,
      I3 => reset_time_out_reg_n_0,
      I4 => \^gt_rxuserrdy_i\,
      O => rx_fsm_reset_done_int_0
    );
rx_fsm_reset_done_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00003B3BCFCC0000"
    )
        port map (
      I0 => time_out_1us_reg_n_0,
      I1 => \^gt_rxuserrdy_i\,
      I2 => reset_time_out_reg_n_0,
      I3 => time_out_100us_reg_n_0,
      I4 => rx_state(0),
      I5 => rx_state(1),
      O => rx_fsm_reset_done_int_i_3_n_0
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_i_1_n_0,
      Q => rx_fsm_reset_done_int,
      R => AR(0)
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => sync_rx_fsm_reset_done_int_cdc_sync_n_0,
      Q => rx_fsm_reset_done_int_s3,
      R => '0'
    );
rxpmaresetdone_i_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      CLR => gtrxreset_s,
      D => rxpmaresetdone_rx_s,
      Q => rxpmaresetdone_i
    );
rxpmaresetdone_rx_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_15
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      \out\ => rxpmaresetdone_rx_s
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync2_pmaresetdone_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_16\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      rxpmaresetdone_i => rxpmaresetdone_i
    );
sync2_txpmaresetdone_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_17\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      txpmaresetdone_i => txpmaresetdone_i
    );
sync_RXRESETDONE_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_18\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => rxresetdone_s2,
      rxfsm_rxresetdone_r => rxfsm_rxresetdone_r
    );
sync_mmcm_lock_reclocked_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_19
     port map (
      SR(0) => sync_mmcm_lock_reclocked_cdc_sync_n_0,
      init_clk_in => init_clk_in,
      \mmcm_lock_count_reg[9]\ => \mmcm_lock_reclocked_i_2__0_n_0\,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      mmcm_lock_reclocked_reg => sync_mmcm_lock_reclocked_cdc_sync_n_1
    );
sync_pll0lock_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_20
     port map (
      E(0) => sync_pll0lock_cdc_sync_n_0,
      \FSM_sequential_rx_state_reg[0]\ => \FSM_sequential_rx_state[3]_i_3_n_0\,
      \FSM_sequential_rx_state_reg[0]_0\ => \FSM_sequential_rx_state[3]_i_5_n_0\,
      \FSM_sequential_rx_state_reg[1]\ => \FSM_sequential_rx_state[3]_i_4_n_0\,
      \FSM_sequential_rx_state_reg[1]_0\ => \reset_time_out_i_2__0_n_0\,
      \FSM_sequential_rx_state_reg[1]_1\ => reset_time_out_i_4_n_0,
      \FSM_sequential_rx_state_reg[1]_2\ => reset_time_out_i_6_n_0,
      RXUSERRDY_reg => \^gt_rxuserrdy_i\,
      check_tlock_max => check_tlock_max,
      init_clk_in => init_clk_in,
      \out\(3 downto 0) => rx_state(3 downto 0),
      quad1_common_lock_out => quad1_common_lock_out,
      reset_time_out_reg => sync_pll0lock_cdc_sync_n_1,
      reset_time_out_reg_0 => reset_time_out_reg_n_0,
      time_out_2ms_reg => time_out_2ms_reg_n_0,
      \wait_time_cnt_reg[0]\ => \wait_time_cnt[0]_i_2__0_n_0\
    );
sync_pll1lock_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_21
     port map (
      init_clk_in => init_clk_in
    );
sync_run_phase_alignment_int_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_22\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => run_phase_alignment_int_s2,
      run_phase_alignment_int_reg => run_phase_alignment_int_reg_n_0
    );
sync_rx_fsm_reset_done_int_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_23\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => sync_rx_fsm_reset_done_int_cdc_sync_n_0,
      rx_fsm_reset_done_int => rx_fsm_reset_done_int
    );
sync_time_out_wait_bypass_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_24\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => time_out_wait_bypass_s2,
      time_out_wait_bypass_reg => time_out_wait_bypass_reg_n_0
    );
time_out_100us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
        port map (
      I0 => time_tlock_max_i_3_n_0,
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(8),
      I3 => time_out_counter_reg(6),
      I4 => time_out_100us_i_2_n_0,
      I5 => time_out_100us_reg_n_0,
      O => time_out_100us_i_1_n_0
    );
time_out_100us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => time_tlock_max_i_2_n_0,
      I1 => time_out_counter_reg(2),
      I2 => time_out_counter_reg(3),
      I3 => time_out_100us_i_3_n_0,
      I4 => time_out_counter_reg(0),
      I5 => time_out_counter_reg(1),
      O => time_out_100us_i_2_n_0
    );
time_out_100us_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      O => time_out_100us_i_3_n_0
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_100us_i_1_n_0,
      Q => time_out_100us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_1us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00020000"
    )
        port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(8),
      I3 => time_out_1us_i_2_n_0,
      I4 => time_out_100us_i_2_n_0,
      I5 => time_out_1us_reg_n_0,
      O => time_out_1us_i_1_n_0
    );
time_out_1us_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(10),
      O => time_out_1us_i_2_n_0
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_1us_i_1_n_0,
      Q => time_out_1us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_2ms_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00020000"
    )
        port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(8),
      I3 => time_out_2ms_i_2_n_0,
      I4 => \time_out_2ms_i_3__0_n_0\,
      I5 => time_out_2ms_reg_n_0,
      O => time_out_2ms_i_1_n_0
    );
time_out_2ms_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFFFFF"
    )
        port map (
      I0 => time_tlock_max_i_3_n_0,
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(0),
      I4 => time_out_counter_reg(1),
      O => time_out_2ms_i_2_n_0
    );
\time_out_2ms_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(18),
      I4 => \time_out_counter[0]_i_4__0_n_0\,
      O => \time_out_2ms_i_3__0_n_0\
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_2ms_i_1_n_0,
      Q => time_out_2ms_reg_n_0,
      R => reset_time_out_reg_n_0
    );
\time_out_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEFFFFFFF"
    )
        port map (
      I0 => \time_out_counter[0]_i_3_n_0\,
      I1 => time_out_counter_reg(4),
      I2 => time_out_counter_reg(16),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(18),
      I5 => \time_out_counter[0]_i_4__0_n_0\,
      O => time_out_counter
    );
\time_out_counter[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFBFFF"
    )
        port map (
      I0 => \time_out_counter[0]_i_6_n_0\,
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(0),
      I3 => time_out_counter_reg(2),
      I4 => time_out_counter_reg(13),
      I5 => time_tlock_max_i_3_n_0,
      O => \time_out_counter[0]_i_3_n_0\
    );
\time_out_counter[0]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(17),
      I3 => time_out_counter_reg(3),
      O => \time_out_counter[0]_i_4__0_n_0\
    );
\time_out_counter[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_counter_reg(0),
      O => \time_out_counter[0]_i_5_n_0\
    );
\time_out_counter[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(6),
      O => \time_out_counter[0]_i_6_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[0]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \time_out_counter_reg[0]_i_2__0_n_0\,
      CO(2) => \time_out_counter_reg[0]_i_2__0_n_1\,
      CO(1) => \time_out_counter_reg[0]_i_2__0_n_2\,
      CO(0) => \time_out_counter_reg[0]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \time_out_counter_reg[0]_i_2__0_n_4\,
      O(2) => \time_out_counter_reg[0]_i_2__0_n_5\,
      O(1) => \time_out_counter_reg[0]_i_2__0_n_6\,
      O(0) => \time_out_counter_reg[0]_i_2__0_n_7\,
      S(3 downto 1) => time_out_counter_reg(3 downto 1),
      S(0) => \time_out_counter[0]_i_5_n_0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[8]_i_1__0_n_0\,
      CO(3) => \time_out_counter_reg[12]_i_1__0_n_0\,
      CO(2) => \time_out_counter_reg[12]_i_1__0_n_1\,
      CO(1) => \time_out_counter_reg[12]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[12]_i_1__0_n_4\,
      O(2) => \time_out_counter_reg[12]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[12]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => time_out_counter_reg(15 downto 12)
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1__0_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1__0_n_0\,
      CO(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \time_out_counter_reg[16]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED\(3),
      O(2) => \time_out_counter_reg[16]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[16]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1__0_n_7\,
      S(3) => '0',
      S(2 downto 0) => time_out_counter_reg(18 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1__0_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1__0_n_5\,
      Q => time_out_counter_reg(18),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[0]_i_2__0_n_0\,
      CO(3) => \time_out_counter_reg[4]_i_1__0_n_0\,
      CO(2) => \time_out_counter_reg[4]_i_1__0_n_1\,
      CO(1) => \time_out_counter_reg[4]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[4]_i_1__0_n_4\,
      O(2) => \time_out_counter_reg[4]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[4]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => time_out_counter_reg(7 downto 4)
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[4]_i_1__0_n_0\,
      CO(3) => \time_out_counter_reg[8]_i_1__0_n_0\,
      CO(2) => \time_out_counter_reg[8]_i_1__0_n_1\,
      CO(1) => \time_out_counter_reg[8]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[8]_i_1__0_n_4\,
      O(2) => \time_out_counter_reg[8]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[8]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => time_out_counter_reg(11 downto 8)
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out_reg_n_0
    );
\time_out_wait_bypass_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass_reg_n_0,
      I1 => \wait_bypass_count[0]_i_4__0_n_0\,
      I2 => rx_fsm_reset_done_int_s3,
      I3 => run_phase_alignment_int_s3_reg_n_0,
      O => \time_out_wait_bypass_i_1__0_n_0\
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \time_out_wait_bypass_i_1__0_n_0\,
      Q => time_out_wait_bypass_reg_n_0,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
time_tlock_max_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF75770000"
    )
        port map (
      I0 => time_tlock_max_i_2_n_0,
      I1 => time_tlock_max_i_3_n_0,
      I2 => time_tlock_max_i_4_n_0,
      I3 => time_tlock_max_i_5_n_0,
      I4 => check_tlock_max_reg_n_0,
      I5 => time_tlock_max,
      O => time_tlock_max_i_1_n_0
    );
time_tlock_max_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => time_out_counter_reg(17),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(15),
      I3 => time_out_counter_reg(18),
      I4 => time_out_counter_reg(13),
      I5 => time_out_counter_reg(14),
      O => time_tlock_max_i_2_n_0
    );
time_tlock_max_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(12),
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(9),
      O => time_tlock_max_i_3_n_0
    );
time_tlock_max_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(8),
      I2 => time_out_counter_reg(6),
      I3 => time_out_counter_reg(5),
      I4 => time_out_counter_reg(4),
      O => time_tlock_max_i_4_n_0
    );
time_tlock_max_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"777F"
    )
        port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(3),
      I2 => time_out_counter_reg(1),
      I3 => time_out_counter_reg(0),
      O => time_tlock_max_i_5_n_0
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_tlock_max_i_1_n_0,
      Q => time_tlock_max,
      R => reset_time_out_reg_n_0
    );
txpmaresetdone_i_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      CLR => gtrxreset_s,
      D => '1',
      Q => txpmaresetdone_i
    );
\wait_bypass_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_phase_alignment_int_s3_reg_n_0,
      O => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_4__0_n_0\,
      I1 => rx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2__0_n_0\
    );
\wait_bypass_count[0]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFBFF"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_6__0_n_0\,
      I1 => wait_bypass_count_reg(1),
      I2 => wait_bypass_count_reg(4),
      I3 => wait_bypass_count_reg(8),
      I4 => wait_bypass_count_reg(11),
      I5 => \wait_bypass_count[0]_i_7__0_n_0\,
      O => \wait_bypass_count[0]_i_4__0_n_0\
    );
\wait_bypass_count[0]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_5__0_n_0\
    );
\wait_bypass_count[0]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(7),
      I1 => wait_bypass_count_reg(10),
      I2 => wait_bypass_count_reg(9),
      I3 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_6__0_n_0\
    );
\wait_bypass_count[0]_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
        port map (
      I0 => wait_bypass_count_reg(6),
      I1 => wait_bypass_count_reg(2),
      I2 => wait_bypass_count_reg(12),
      I3 => wait_bypass_count_reg(3),
      I4 => wait_bypass_count_reg(5),
      O => \wait_bypass_count[0]_i_7__0_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_7\,
      Q => wait_bypass_count_reg(0),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_bypass_count_reg[0]_i_3__0_n_0\,
      CO(2) => \wait_bypass_count_reg[0]_i_3__0_n_1\,
      CO(1) => \wait_bypass_count_reg[0]_i_3__0_n_2\,
      CO(0) => \wait_bypass_count_reg[0]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wait_bypass_count_reg[0]_i_3__0_n_4\,
      O(2) => \wait_bypass_count_reg[0]_i_3__0_n_5\,
      O(1) => \wait_bypass_count_reg[0]_i_3__0_n_6\,
      O(0) => \wait_bypass_count_reg[0]_i_3__0_n_7\,
      S(3 downto 1) => wait_bypass_count_reg(3 downto 1),
      S(0) => \wait_bypass_count[0]_i_5__0_n_0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_5\,
      Q => wait_bypass_count_reg(10),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_4\,
      Q => wait_bypass_count_reg(11),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[12]_i_1__0_n_7\,
      Q => wait_bypass_count_reg(12),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1__0_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[12]_i_1__0_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(12)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_6\,
      Q => wait_bypass_count_reg(1),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_5\,
      Q => wait_bypass_count_reg(2),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_4\,
      Q => wait_bypass_count_reg(3),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_7\,
      Q => wait_bypass_count_reg(4),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[0]_i_3__0_n_0\,
      CO(3) => \wait_bypass_count_reg[4]_i_1__0_n_0\,
      CO(2) => \wait_bypass_count_reg[4]_i_1__0_n_1\,
      CO(1) => \wait_bypass_count_reg[4]_i_1__0_n_2\,
      CO(0) => \wait_bypass_count_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[4]_i_1__0_n_4\,
      O(2) => \wait_bypass_count_reg[4]_i_1__0_n_5\,
      O(1) => \wait_bypass_count_reg[4]_i_1__0_n_6\,
      O(0) => \wait_bypass_count_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(7 downto 4)
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_6\,
      Q => wait_bypass_count_reg(5),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_5\,
      Q => wait_bypass_count_reg(6),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_4\,
      Q => wait_bypass_count_reg(7),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_7\,
      Q => wait_bypass_count_reg(8),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[4]_i_1__0_n_0\,
      CO(3) => \wait_bypass_count_reg[8]_i_1__0_n_0\,
      CO(2) => \wait_bypass_count_reg[8]_i_1__0_n_1\,
      CO(1) => \wait_bypass_count_reg[8]_i_1__0_n_2\,
      CO(0) => \wait_bypass_count_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[8]_i_1__0_n_4\,
      O(2) => \wait_bypass_count_reg[8]_i_1__0_n_5\,
      O(1) => \wait_bypass_count_reg[8]_i_1__0_n_6\,
      O(0) => \wait_bypass_count_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(11 downto 8)
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_6\,
      Q => wait_bypass_count_reg(9),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_time_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(0),
      I2 => rx_state(3),
      O => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt[0]_i_10__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_10__0_n_0\
    );
\wait_time_cnt[0]_i_11__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_11__0_n_0\
    );
\wait_time_cnt[0]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_time_cnt[0]_i_4__0_n_0\,
      I1 => \wait_time_cnt[0]_i_5__0_n_0\,
      I2 => \wait_time_cnt[0]_i_6__0_n_0\,
      I3 => \wait_time_cnt[0]_i_7__0_n_0\,
      O => \wait_time_cnt[0]_i_2__0_n_0\
    );
\wait_time_cnt[0]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      I1 => wait_time_cnt_reg(3),
      I2 => wait_time_cnt_reg(15),
      I3 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[0]_i_4__0_n_0\
    );
\wait_time_cnt[0]_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      I1 => wait_time_cnt_reg(10),
      I2 => wait_time_cnt_reg(14),
      I3 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[0]_i_5__0_n_0\
    );
\wait_time_cnt[0]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      I1 => wait_time_cnt_reg(2),
      I2 => wait_time_cnt_reg(8),
      I3 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[0]_i_6__0_n_0\
    );
\wait_time_cnt[0]_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      I1 => wait_time_cnt_reg(5),
      I2 => wait_time_cnt_reg(7),
      I3 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[0]_i_7__0_n_0\
    );
\wait_time_cnt[0]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_8__0_n_0\
    );
\wait_time_cnt[0]_i_9__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_9__0_n_0\
    );
\wait_time_cnt[12]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      O => \wait_time_cnt[12]_i_2__0_n_0\
    );
\wait_time_cnt[12]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      O => \wait_time_cnt[12]_i_3__0_n_0\
    );
\wait_time_cnt[12]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[12]_i_4__0_n_0\
    );
\wait_time_cnt[12]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[12]_i_5__0_n_0\
    );
\wait_time_cnt[4]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(7),
      O => \wait_time_cnt[4]_i_2__0_n_0\
    );
\wait_time_cnt[4]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      O => \wait_time_cnt[4]_i_3__0_n_0\
    );
\wait_time_cnt[4]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(5),
      O => \wait_time_cnt[4]_i_4__0_n_0\
    );
\wait_time_cnt[4]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[4]_i_5__0_n_0\
    );
\wait_time_cnt[8]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[8]_i_2__0_n_0\
    );
\wait_time_cnt[8]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[8]_i_3__0_n_0\
    );
\wait_time_cnt[8]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[8]_i_4__0_n_0\
    );
\wait_time_cnt[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[8]_i_5__0_n_0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_7\,
      Q => wait_time_cnt_reg(0),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_time_cnt_reg[0]_i_3__0_n_0\,
      CO(2) => \wait_time_cnt_reg[0]_i_3__0_n_1\,
      CO(1) => \wait_time_cnt_reg[0]_i_3__0_n_2\,
      CO(0) => \wait_time_cnt_reg[0]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[0]_i_3__0_n_4\,
      O(2) => \wait_time_cnt_reg[0]_i_3__0_n_5\,
      O(1) => \wait_time_cnt_reg[0]_i_3__0_n_6\,
      O(0) => \wait_time_cnt_reg[0]_i_3__0_n_7\,
      S(3) => \wait_time_cnt[0]_i_8__0_n_0\,
      S(2) => \wait_time_cnt[0]_i_9__0_n_0\,
      S(1) => \wait_time_cnt[0]_i_10__0_n_0\,
      S(0) => \wait_time_cnt[0]_i_11__0_n_0\
    );
\wait_time_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_5\,
      Q => wait_time_cnt_reg(10),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_4\,
      Q => wait_time_cnt_reg(11),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_7\,
      Q => wait_time_cnt_reg(12),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[8]_i_1__0_n_0\,
      CO(3) => \NLW_wait_time_cnt_reg[12]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \wait_time_cnt_reg[12]_i_1__0_n_1\,
      CO(1) => \wait_time_cnt_reg[12]_i_1__0_n_2\,
      CO(0) => \wait_time_cnt_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \wait_time_cnt_reg[12]_i_1__0_n_4\,
      O(2) => \wait_time_cnt_reg[12]_i_1__0_n_5\,
      O(1) => \wait_time_cnt_reg[12]_i_1__0_n_6\,
      O(0) => \wait_time_cnt_reg[12]_i_1__0_n_7\,
      S(3) => \wait_time_cnt[12]_i_2__0_n_0\,
      S(2) => \wait_time_cnt[12]_i_3__0_n_0\,
      S(1) => \wait_time_cnt[12]_i_4__0_n_0\,
      S(0) => \wait_time_cnt[12]_i_5__0_n_0\
    );
\wait_time_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_6\,
      Q => wait_time_cnt_reg(13),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_5\,
      Q => wait_time_cnt_reg(14),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_4\,
      Q => wait_time_cnt_reg(15),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_6\,
      Q => wait_time_cnt_reg(1),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_5\,
      Q => wait_time_cnt_reg(2),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_4\,
      Q => wait_time_cnt_reg(3),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_7\,
      Q => wait_time_cnt_reg(4),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[0]_i_3__0_n_0\,
      CO(3) => \wait_time_cnt_reg[4]_i_1__0_n_0\,
      CO(2) => \wait_time_cnt_reg[4]_i_1__0_n_1\,
      CO(1) => \wait_time_cnt_reg[4]_i_1__0_n_2\,
      CO(0) => \wait_time_cnt_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[4]_i_1__0_n_4\,
      O(2) => \wait_time_cnt_reg[4]_i_1__0_n_5\,
      O(1) => \wait_time_cnt_reg[4]_i_1__0_n_6\,
      O(0) => \wait_time_cnt_reg[4]_i_1__0_n_7\,
      S(3) => \wait_time_cnt[4]_i_2__0_n_0\,
      S(2) => \wait_time_cnt[4]_i_3__0_n_0\,
      S(1) => \wait_time_cnt[4]_i_4__0_n_0\,
      S(0) => \wait_time_cnt[4]_i_5__0_n_0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_6\,
      Q => wait_time_cnt_reg(5),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_5\,
      Q => wait_time_cnt_reg(6),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_4\,
      Q => wait_time_cnt_reg(7),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_7\,
      Q => wait_time_cnt_reg(8),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[4]_i_1__0_n_0\,
      CO(3) => \wait_time_cnt_reg[8]_i_1__0_n_0\,
      CO(2) => \wait_time_cnt_reg[8]_i_1__0_n_1\,
      CO(1) => \wait_time_cnt_reg[8]_i_1__0_n_2\,
      CO(0) => \wait_time_cnt_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[8]_i_1__0_n_4\,
      O(2) => \wait_time_cnt_reg[8]_i_1__0_n_5\,
      O(1) => \wait_time_cnt_reg[8]_i_1__0_n_6\,
      O(0) => \wait_time_cnt_reg[8]_i_1__0_n_7\,
      S(3) => \wait_time_cnt[8]_i_2__0_n_0\,
      S(2) => \wait_time_cnt[8]_i_3__0_n_0\,
      S(1) => \wait_time_cnt[8]_i_4__0_n_0\,
      S(0) => \wait_time_cnt[8]_i_5__0_n_0\
    );
\wait_time_cnt_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_6\,
      Q => wait_time_cnt_reg(9),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_tx_startup_fsm is
  port (
    \out\ : out STD_LOGIC;
    gt_tx_reset_i : out STD_LOGIC;
    common_reset_i : out STD_LOGIC;
    gt_txuserrdy_i : out STD_LOGIC;
    gt_txresetdone_r2_reg : out STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    txfsm_txresetdone_r : in STD_LOGIC;
    gt_rst_r_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_tx_startup_fsm : entity is "merger_aurora_tx_startup_fsm";
end merger_aurora_merger_aurora_tx_startup_fsm;

architecture STRUCTURE of merger_aurora_merger_aurora_tx_startup_fsm is
  signal \FSM_sequential_tx_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_5_n_0\ : STD_LOGIC;
  signal PLL0_RESET_i_1_n_0 : STD_LOGIC;
  signal TXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \^common_reset_i\ : STD_LOGIC;
  signal \^gt_tx_reset_i\ : STD_LOGIC;
  signal \^gt_txuserrdy_i\ : STD_LOGIC;
  signal gttxreset_i_i_1_n_0 : STD_LOGIC;
  signal init_wait_count : STD_LOGIC;
  signal \init_wait_count[7]_i_3_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_4_n_0\ : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal init_wait_done_i_1_n_0 : STD_LOGIC;
  signal init_wait_done_reg_n_0 : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_2_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[9]_i_4_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal \^out\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal pll_reset_asserted_i_1_n_0 : STD_LOGIC;
  signal pll_reset_asserted_reg_n_0 : STD_LOGIC;
  signal reset_time_out : STD_LOGIC;
  signal reset_time_out_i_3_n_0 : STD_LOGIC;
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_i_1_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_0 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_cdc_sync_n_1 : STD_LOGIC;
  signal sync_pll0lock_cdc_sync_n_0 : STD_LOGIC;
  signal sync_pll0lock_cdc_sync_n_1 : STD_LOGIC;
  signal \time_out_2ms_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_2ms_i_2__0_n_0\ : STD_LOGIC;
  signal time_out_2ms_i_3_n_0 : STD_LOGIC;
  signal time_out_2ms_i_4_n_0 : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_500us_i_1_n_0 : STD_LOGIC;
  signal time_out_500us_i_2_n_0 : STD_LOGIC;
  signal time_out_500us_reg_n_0 : STD_LOGIC;
  signal time_out_counter : STD_LOGIC;
  signal \time_out_counter[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_5__0_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \time_out_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal time_out_wait_bypass : STD_LOGIC;
  signal time_out_wait_bypass_i_1_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal \time_tlock_max_i_1__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_2__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_3__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_4__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_5__0_n_0\ : STD_LOGIC;
  signal time_tlock_max_reg_n_0 : STD_LOGIC;
  signal tx_fsm_reset_done_int : STD_LOGIC;
  signal tx_fsm_reset_done_int_i_1_n_0 : STD_LOGIC;
  signal tx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal tx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of tx_state : signal is "yes";
  signal txresetdone_s2 : STD_LOGIC;
  signal txresetdone_s3 : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_8_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_9_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_10_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_11_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal wait_time_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \wait_time_cnt_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[1]_i_2\ : label is "soft_lutpair54";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[0]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_tx_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[1]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP of \FSM_sequential_tx_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[2]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP of \FSM_sequential_tx_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[3]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute KEEP of \FSM_sequential_tx_state_reg[3]\ : label is "yes";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_3\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_4\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \mmcm_lock_count[0]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_4\ : label is "soft_lutpair49";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of run_phase_alignment_int_s3_reg : label is "no";
  attribute SOFT_HLUTNM of \time_out_2ms_i_2__0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \time_out_counter[0]_i_3__0\ : label is "soft_lutpair48";
  attribute equivalent_register_removal of time_out_wait_bypass_s3_reg : label is "no";
  attribute SOFT_HLUTNM of \time_tlock_max_i_1__0\ : label is "soft_lutpair54";
  attribute equivalent_register_removal of tx_fsm_reset_done_int_s3_reg : label is "no";
  attribute equivalent_register_removal of txresetdone_s3_reg : label is "no";
begin
  common_reset_i <= \^common_reset_i\;
  gt_tx_reset_i <= \^gt_tx_reset_i\;
  gt_txuserrdy_i <= \^gt_txuserrdy_i\;
  \out\ <= \^out\;
\FSM_sequential_tx_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFF77F7"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      I2 => time_out_500us_reg_n_0,
      I3 => reset_time_out,
      I4 => \FSM_sequential_tx_state[0]_i_2_n_0\,
      I5 => \FSM_sequential_tx_state[0]_i_3_n_0\,
      O => \FSM_sequential_tx_state[0]_i_1_n_0\
    );
\FSM_sequential_tx_state[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(0),
      O => \FSM_sequential_tx_state[0]_i_2_n_0\
    );
\FSM_sequential_tx_state[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFCF5555FFFF"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => mmcm_lock_reclocked,
      I2 => time_tlock_max_reg_n_0,
      I3 => reset_time_out,
      I4 => tx_state(1),
      I5 => tx_state(2),
      O => \FSM_sequential_tx_state[0]_i_3_n_0\
    );
\FSM_sequential_tx_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000F0B00"
    )
        port map (
      I0 => \FSM_sequential_tx_state[1]_i_2_n_0\,
      I1 => tx_state(2),
      I2 => tx_state(3),
      I3 => tx_state(0),
      I4 => tx_state(1),
      O => \FSM_sequential_tx_state[1]_i_1_n_0\
    );
\FSM_sequential_tx_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => time_tlock_max_reg_n_0,
      I2 => reset_time_out,
      O => \FSM_sequential_tx_state[1]_i_2_n_0\
    );
\FSM_sequential_tx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055040055555555"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(1),
      I2 => time_out_2ms_reg_n_0,
      I3 => tx_state(0),
      I4 => tx_state(2),
      I5 => \FSM_sequential_tx_state[2]_i_2_n_0\,
      O => \FSM_sequential_tx_state[2]_i_1_n_0\
    );
\FSM_sequential_tx_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDDFDD"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(1),
      I2 => reset_time_out,
      I3 => time_tlock_max_reg_n_0,
      I4 => mmcm_lock_reclocked,
      O => \FSM_sequential_tx_state[2]_i_2_n_0\
    );
\FSM_sequential_tx_state[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_5_n_0\,
      I1 => tx_state(3),
      I2 => time_out_wait_bypass_s3,
      O => \FSM_sequential_tx_state[3]_i_2_n_0\
    );
\FSM_sequential_tx_state[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(1),
      O => \FSM_sequential_tx_state[3]_i_4_n_0\
    );
\FSM_sequential_tx_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF4FFFFFFFFFFF"
    )
        port map (
      I0 => reset_time_out,
      I1 => time_out_500us_reg_n_0,
      I2 => tx_state(2),
      I3 => tx_state(1),
      I4 => tx_state(3),
      I5 => tx_state(0),
      O => \FSM_sequential_tx_state[3]_i_5_n_0\
    );
\FSM_sequential_tx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_tx_state[0]_i_1_n_0\,
      Q => tx_state(0),
      R => gt_rst_r_reg
    );
\FSM_sequential_tx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_tx_state[1]_i_1_n_0\,
      Q => tx_state(1),
      R => gt_rst_r_reg
    );
\FSM_sequential_tx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_tx_state[2]_i_1_n_0\,
      Q => tx_state(2),
      R => gt_rst_r_reg
    );
\FSM_sequential_tx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => sync_pll0lock_cdc_sync_n_0,
      D => \FSM_sequential_tx_state[3]_i_2_n_0\,
      Q => tx_state(3),
      R => gt_rst_r_reg
    );
PLL0_RESET_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFF00000100"
    )
        port map (
      I0 => pll_reset_asserted_reg_n_0,
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => tx_state(0),
      I4 => tx_state(3),
      I5 => \^common_reset_i\,
      O => PLL0_RESET_i_1_n_0
    );
PLL0_RESET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => PLL0_RESET_i_1_n_0,
      Q => \^common_reset_i\,
      R => gt_rst_r_reg
    );
TXUSERRDY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD2000"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(3),
      I2 => tx_state(1),
      I3 => tx_state(2),
      I4 => \^gt_txuserrdy_i\,
      O => TXUSERRDY_i_1_n_0
    );
TXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => TXUSERRDY_i_1_n_0,
      Q => \^gt_txuserrdy_i\,
      R => gt_rst_r_reg
    );
gttxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0010"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(3),
      I2 => tx_state(0),
      I3 => tx_state(2),
      I4 => \^gt_tx_reset_i\,
      O => gttxreset_i_i_1_n_0
    );
gttxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => gttxreset_i_i_1_n_0,
      Q => \^gt_tx_reset_i\,
      R => gt_rst_r_reg
    );
\init_wait_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      O => \p_0_in__1\(0)
    );
\init_wait_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      O => \p_0_in__1\(1)
    );
\init_wait_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      O => \p_0_in__1\(2)
    );
\init_wait_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(3),
      O => \p_0_in__1\(3)
    );
\init_wait_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(4),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(2),
      I4 => \init_wait_count_reg__0\(3),
      O => \p_0_in__1\(4)
    );
\init_wait_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(5),
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(0),
      I4 => \init_wait_count_reg__0\(1),
      I5 => \init_wait_count_reg__0\(4),
      O => \p_0_in__1\(5)
    );
\init_wait_count[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(6),
      I1 => \init_wait_count_reg__0\(4),
      I2 => \init_wait_count_reg__0\(5),
      I3 => \init_wait_count[7]_i_4_n_0\,
      O => \p_0_in__1\(6)
    );
\init_wait_count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \init_wait_count[7]_i_3_n_0\,
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(7),
      I4 => \init_wait_count_reg__0\(6),
      O => init_wait_count
    );
\init_wait_count[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \init_wait_count_reg__0\(7),
      I1 => \init_wait_count[7]_i_4_n_0\,
      I2 => \init_wait_count_reg__0\(5),
      I3 => \init_wait_count_reg__0\(4),
      I4 => \init_wait_count_reg__0\(6),
      O => \p_0_in__1\(7)
    );
\init_wait_count[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \init_wait_count_reg__0\(5),
      I1 => \init_wait_count_reg__0\(4),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(0),
      O => \init_wait_count[7]_i_3_n_0\
    );
\init_wait_count[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(2),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(1),
      O => \init_wait_count[7]_i_4_n_0\
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(0),
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(4),
      Q => \init_wait_count_reg__0\(4)
    );
\init_wait_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(5),
      Q => \init_wait_count_reg__0\(5)
    );
\init_wait_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(6),
      Q => \init_wait_count_reg__0\(6)
    );
\init_wait_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => init_wait_count,
      CLR => gt_rst_r_reg,
      D => \p_0_in__1\(7),
      Q => \init_wait_count_reg__0\(7)
    );
init_wait_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => \init_wait_count[7]_i_3_n_0\,
      I1 => \init_wait_count_reg__0\(3),
      I2 => \init_wait_count_reg__0\(2),
      I3 => \init_wait_count_reg__0\(7),
      I4 => \init_wait_count_reg__0\(6),
      I5 => init_wait_done_reg_n_0,
      O => init_wait_done_i_1_n_0
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      CLR => gt_rst_r_reg,
      D => init_wait_done_i_1_n_0,
      Q => init_wait_done_reg_n_0
    );
\mmcm_lock_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \p_0_in__2\(0)
    );
\mmcm_lock_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__2\(1)
    );
\mmcm_lock_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__2\(2)
    );
\mmcm_lock_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__2\(3)
    );
\mmcm_lock_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(2),
      I4 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__2\(4)
    );
\mmcm_lock_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(5),
      I1 => \mmcm_lock_count_reg__0\(3),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(0),
      I4 => \mmcm_lock_count_reg__0\(1),
      I5 => \mmcm_lock_count_reg__0\(4),
      O => \p_0_in__2\(5)
    );
\mmcm_lock_count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \mmcm_lock_count[9]_i_4_n_0\,
      I2 => \mmcm_lock_count_reg__0\(5),
      O => \p_0_in__2\(6)
    );
\mmcm_lock_count[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \mmcm_lock_count_reg__0\(5),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count[9]_i_4_n_0\,
      O => \p_0_in__2\(7)
    );
\mmcm_lock_count[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count[9]_i_4_n_0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(7),
      O => \p_0_in__2\(8)
    );
\mmcm_lock_count[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count[9]_i_4_n_0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(7),
      I5 => \mmcm_lock_count_reg__0\(9),
      O => \mmcm_lock_count[9]_i_2_n_0\
    );
\mmcm_lock_count[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(7),
      I2 => \mmcm_lock_count_reg__0\(5),
      I3 => \mmcm_lock_count_reg__0\(6),
      I4 => \mmcm_lock_count[9]_i_4_n_0\,
      I5 => \mmcm_lock_count_reg__0\(8),
      O => \p_0_in__2\(9)
    );
\mmcm_lock_count[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(0),
      I3 => \mmcm_lock_count_reg__0\(2),
      I4 => \mmcm_lock_count_reg__0\(3),
      O => \mmcm_lock_count[9]_i_4_n_0\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(0),
      Q => \mmcm_lock_count_reg__0\(0),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(2),
      Q => \mmcm_lock_count_reg__0\(2),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(3),
      Q => \mmcm_lock_count_reg__0\(3),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(4),
      Q => \mmcm_lock_count_reg__0\(4),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(5),
      Q => \mmcm_lock_count_reg__0\(5),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(6),
      Q => \mmcm_lock_count_reg__0\(6),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(7),
      Q => \mmcm_lock_count_reg__0\(7),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(8),
      Q => \mmcm_lock_count_reg__0\(8),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => \mmcm_lock_count[9]_i_2_n_0\,
      D => \p_0_in__2\(9),
      Q => \mmcm_lock_count_reg__0\(9),
      R => sync_mmcm_lock_reclocked_cdc_sync_n_0
    );
mmcm_lock_reclocked_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(7),
      I2 => \mmcm_lock_count_reg__0\(5),
      I3 => \mmcm_lock_count_reg__0\(6),
      I4 => \mmcm_lock_count[9]_i_4_n_0\,
      I5 => \mmcm_lock_count_reg__0\(8),
      O => p_0_in
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_mmcm_lock_reclocked_cdc_sync_n_1,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
pll_reset_asserted_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA3AA"
    )
        port map (
      I0 => pll_reset_asserted_reg_n_0,
      I1 => tx_state(1),
      I2 => tx_state(3),
      I3 => tx_state(0),
      I4 => tx_state(2),
      O => pll_reset_asserted_i_1_n_0
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => pll_reset_asserted_i_1_n_0,
      Q => pll_reset_asserted_reg_n_0,
      R => gt_rst_r_reg
    );
reset_time_out_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B833"
    )
        port map (
      I0 => txresetdone_s3,
      I1 => tx_state(1),
      I2 => mmcm_lock_reclocked,
      I3 => tx_state(2),
      O => reset_time_out_i_3_n_0
    );
reset_time_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => sync_pll0lock_cdc_sync_n_1,
      Q => reset_time_out,
      R => gt_rst_r_reg
    );
run_phase_alignment_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0100"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      I2 => tx_state(0),
      I3 => tx_state(3),
      I4 => run_phase_alignment_int,
      O => run_phase_alignment_int_i_1_n_0
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => run_phase_alignment_int_i_1_n_0,
      Q => run_phase_alignment_int,
      R => gt_rst_r_reg
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3,
      R => '0'
    );
sync_TXRESETDONE_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_7\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => txresetdone_s2,
      txfsm_txresetdone_r => txfsm_txresetdone_r
    );
sync_mmcm_lock_reclocked_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_8
     port map (
      SR(0) => sync_mmcm_lock_reclocked_cdc_sync_n_0,
      init_clk_in => init_clk_in,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      mmcm_lock_reclocked_reg => sync_mmcm_lock_reclocked_cdc_sync_n_1,
      p_0_in => p_0_in,
      quad1_common_lock_out => quad1_common_lock_out
    );
sync_pll0lock_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_9
     port map (
      E(0) => sync_pll0lock_cdc_sync_n_0,
      \FSM_sequential_tx_state_reg[2]\ => \FSM_sequential_tx_state[3]_i_4_n_0\,
      init_clk_in => init_clk_in,
      init_wait_done_reg => init_wait_done_reg_n_0,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      \out\(3 downto 0) => tx_state(3 downto 0),
      pll_reset_asserted_reg => pll_reset_asserted_reg_n_0,
      quad1_common_lock_out => quad1_common_lock_out,
      reset_time_out => reset_time_out,
      reset_time_out_reg => sync_pll0lock_cdc_sync_n_1,
      sel => sel,
      time_out_2ms_reg => time_out_2ms_reg_n_0,
      time_out_500us_reg => time_out_500us_reg_n_0,
      time_tlock_max_reg => time_tlock_max_reg_n_0,
      txresetdone_s3 => txresetdone_s3,
      txresetdone_s3_reg => reset_time_out_i_3_n_0
    );
sync_pll1lock_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_10
     port map (
      init_clk_in => init_clk_in
    );
sync_run_phase_alignment_int_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_11\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => run_phase_alignment_int_s2,
      run_phase_alignment_int => run_phase_alignment_int
    );
sync_time_out_wait_bypass_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_12\
     port map (
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => time_out_wait_bypass_s2,
      time_out_wait_bypass => time_out_wait_bypass
    );
sync_tx_fsm_reset_done_int_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_13\
     port map (
      gt_txresetdone_r2_reg => gt_txresetdone_r2_reg,
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => \^out\,
      tx_fsm_reset_done_int => tx_fsm_reset_done_int
    );
\time_out_2ms_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAAE"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => \time_out_counter[0]_i_4_n_0\,
      I2 => \time_out_2ms_i_2__0_n_0\,
      I3 => time_out_2ms_i_3_n_0,
      I4 => time_out_2ms_i_4_n_0,
      I5 => reset_time_out,
      O => \time_out_2ms_i_1__0_n_0\
    );
\time_out_2ms_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(3),
      I2 => time_out_counter_reg(7),
      I3 => time_out_counter_reg(10),
      O => \time_out_2ms_i_2__0_n_0\
    );
time_out_2ms_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(6),
      O => time_out_2ms_i_3_n_0
    );
time_out_2ms_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(17),
      I3 => time_out_counter_reg(8),
      O => time_out_2ms_i_4_n_0
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \time_out_2ms_i_1__0_n_0\,
      Q => time_out_2ms_reg_n_0,
      R => '0'
    );
time_out_500us_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AE"
    )
        port map (
      I0 => time_out_500us_reg_n_0,
      I1 => \time_tlock_max_i_2__0_n_0\,
      I2 => time_out_500us_i_2_n_0,
      I3 => reset_time_out,
      O => time_out_500us_i_1_n_0
    );
time_out_500us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFFFFFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(11),
      I3 => \time_tlock_max_i_5__0_n_0\,
      I4 => time_out_counter_reg(4),
      I5 => time_out_counter_reg(5),
      O => time_out_500us_i_2_n_0
    );
time_out_500us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_500us_i_1_n_0,
      Q => time_out_500us_reg_n_0,
      R => '0'
    );
\time_out_counter[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFBFFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(17),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(15),
      I4 => \time_out_counter[0]_i_3__0_n_0\,
      I5 => \time_out_counter[0]_i_4_n_0\,
      O => time_out_counter
    );
\time_out_counter[0]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => time_out_counter_reg(10),
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(12),
      I4 => time_out_2ms_i_3_n_0,
      O => \time_out_counter[0]_i_3__0_n_0\
    );
\time_out_counter[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200000000000000"
    )
        port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(0),
      I2 => time_out_counter_reg(16),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(4),
      I5 => time_out_counter_reg(5),
      O => \time_out_counter[0]_i_4_n_0\
    );
\time_out_counter[0]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_counter_reg(0),
      O => \time_out_counter[0]_i_5__0_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out
    );
\time_out_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \time_out_counter_reg[0]_i_2_n_0\,
      CO(2) => \time_out_counter_reg[0]_i_2_n_1\,
      CO(1) => \time_out_counter_reg[0]_i_2_n_2\,
      CO(0) => \time_out_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \time_out_counter_reg[0]_i_2_n_4\,
      O(2) => \time_out_counter_reg[0]_i_2_n_5\,
      O(1) => \time_out_counter_reg[0]_i_2_n_6\,
      O(0) => \time_out_counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => time_out_counter_reg(3 downto 1),
      S(0) => \time_out_counter[0]_i_5__0_n_0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out
    );
\time_out_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[8]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[12]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[12]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[12]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[12]_i_1_n_4\,
      O(2) => \time_out_counter_reg[12]_i_1_n_5\,
      O(1) => \time_out_counter_reg[12]_i_1_n_6\,
      O(0) => \time_out_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(15 downto 12)
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out
    );
\time_out_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1_n_0\,
      CO(3 downto 1) => \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \time_out_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \time_out_counter_reg[16]_i_1_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => time_out_counter_reg(17 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out
    );
\time_out_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[0]_i_2_n_0\,
      CO(3) => \time_out_counter_reg[4]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[4]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[4]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[4]_i_1_n_4\,
      O(2) => \time_out_counter_reg[4]_i_1_n_5\,
      O(1) => \time_out_counter_reg[4]_i_1_n_6\,
      O(0) => \time_out_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(7 downto 4)
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out
    );
\time_out_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[4]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[8]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[8]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[8]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[8]_i_1_n_4\,
      O(2) => \time_out_counter_reg[8]_i_1_n_5\,
      O(1) => \time_out_counter_reg[8]_i_1_n_6\,
      O(0) => \time_out_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(11 downto 8)
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass,
      I1 => \wait_bypass_count[0]_i_4_n_0\,
      I2 => tx_fsm_reset_done_int_s3,
      I3 => run_phase_alignment_int_s3,
      O => time_out_wait_bypass_i_1_n_0
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => time_out_wait_bypass_i_1_n_0,
      Q => time_out_wait_bypass,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
\time_tlock_max_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AE"
    )
        port map (
      I0 => time_tlock_max_reg_n_0,
      I1 => \time_tlock_max_i_2__0_n_0\,
      I2 => \time_tlock_max_i_3__0_n_0\,
      I3 => reset_time_out,
      O => \time_tlock_max_i_1__0_n_0\
    );
\time_tlock_max_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(3),
      I2 => time_out_counter_reg(2),
      I3 => \time_tlock_max_i_4__0_n_0\,
      O => \time_tlock_max_i_2__0_n_0\
    );
\time_tlock_max_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(4),
      I3 => \time_tlock_max_i_5__0_n_0\,
      I4 => time_out_counter_reg(0),
      I5 => time_out_counter_reg(11),
      O => \time_tlock_max_i_3__0_n_0\
    );
\time_tlock_max_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF7FFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(6),
      I3 => time_out_counter_reg(17),
      I4 => time_out_counter_reg(7),
      I5 => time_out_counter_reg(10),
      O => \time_tlock_max_i_4__0_n_0\
    );
\time_tlock_max_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(8),
      I3 => time_out_counter_reg(1),
      O => \time_tlock_max_i_5__0_n_0\
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \time_tlock_max_i_1__0_n_0\,
      Q => time_tlock_max_reg_n_0,
      R => '0'
    );
tx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0200"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => tx_state(3),
      I4 => tx_fsm_reset_done_int,
      O => tx_fsm_reset_done_int_i_1_n_0
    );
tx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_fsm_reset_done_int_i_1_n_0,
      Q => tx_fsm_reset_done_int,
      R => gt_rst_r_reg
    );
tx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => \^out\,
      Q => tx_fsm_reset_done_int_s3,
      R => '0'
    );
txresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => txresetdone_s2,
      Q => txresetdone_s3,
      R => '0'
    );
\wait_bypass_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_phase_alignment_int_s3,
      O => clear
    );
\wait_bypass_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_4_n_0\,
      I1 => tx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2_n_0\
    );
\wait_bypass_count[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_bypass_count[0]_i_6_n_0\,
      I1 => \wait_bypass_count[0]_i_7_n_0\,
      I2 => \wait_bypass_count[0]_i_8_n_0\,
      I3 => \wait_bypass_count[0]_i_9_n_0\,
      O => \wait_bypass_count[0]_i_4_n_0\
    );
\wait_bypass_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_5_n_0\
    );
\wait_bypass_count[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(16),
      I1 => wait_bypass_count_reg(8),
      I2 => wait_bypass_count_reg(5),
      I3 => wait_bypass_count_reg(6),
      O => \wait_bypass_count[0]_i_6_n_0\
    );
\wait_bypass_count[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
        port map (
      I0 => wait_bypass_count_reg(14),
      I1 => wait_bypass_count_reg(15),
      I2 => wait_bypass_count_reg(4),
      I3 => wait_bypass_count_reg(10),
      I4 => wait_bypass_count_reg(11),
      O => \wait_bypass_count[0]_i_7_n_0\
    );
\wait_bypass_count[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => wait_bypass_count_reg(1),
      I1 => wait_bypass_count_reg(12),
      I2 => wait_bypass_count_reg(13),
      I3 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_8_n_0\
    );
\wait_bypass_count[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => wait_bypass_count_reg(7),
      I1 => wait_bypass_count_reg(3),
      I2 => wait_bypass_count_reg(9),
      I3 => wait_bypass_count_reg(2),
      O => \wait_bypass_count[0]_i_9_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_7\,
      Q => wait_bypass_count_reg(0),
      R => clear
    );
\wait_bypass_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(2) => \wait_bypass_count_reg[0]_i_3_n_1\,
      CO(1) => \wait_bypass_count_reg[0]_i_3_n_2\,
      CO(0) => \wait_bypass_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wait_bypass_count_reg[0]_i_3_n_4\,
      O(2) => \wait_bypass_count_reg[0]_i_3_n_5\,
      O(1) => \wait_bypass_count_reg[0]_i_3_n_6\,
      O(0) => \wait_bypass_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => wait_bypass_count_reg(3 downto 1),
      S(0) => \wait_bypass_count[0]_i_5_n_0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_5\,
      Q => wait_bypass_count_reg(10),
      R => clear
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_4\,
      Q => wait_bypass_count_reg(11),
      R => clear
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_7\,
      Q => wait_bypass_count_reg(12),
      R => clear
    );
\wait_bypass_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[12]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[12]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[12]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[12]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[12]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[12]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(15 downto 12)
    );
\wait_bypass_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_6\,
      Q => wait_bypass_count_reg(13),
      R => clear
    );
\wait_bypass_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_5\,
      Q => wait_bypass_count_reg(14),
      R => clear
    );
\wait_bypass_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_4\,
      Q => wait_bypass_count_reg(15),
      R => clear
    );
\wait_bypass_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[16]_i_1_n_7\,
      Q => wait_bypass_count_reg(16),
      R => clear
    );
\wait_bypass_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(16)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_6\,
      Q => wait_bypass_count_reg(1),
      R => clear
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_5\,
      Q => wait_bypass_count_reg(2),
      R => clear
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_4\,
      Q => wait_bypass_count_reg(3),
      R => clear
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_7\,
      Q => wait_bypass_count_reg(4),
      R => clear
    );
\wait_bypass_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(3) => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[4]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[4]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[4]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[4]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[4]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(7 downto 4)
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_6\,
      Q => wait_bypass_count_reg(5),
      R => clear
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_5\,
      Q => wait_bypass_count_reg(6),
      R => clear
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_4\,
      Q => wait_bypass_count_reg(7),
      R => clear
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_7\,
      Q => wait_bypass_count_reg(8),
      R => clear
    );
\wait_bypass_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[8]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[8]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[8]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[8]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[8]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(11 downto 8)
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrxreset_o_reg,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_6\,
      Q => wait_bypass_count_reg(9),
      R => clear
    );
\wait_time_cnt[0]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_10_n_0\
    );
\wait_time_cnt[0]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_11_n_0\
    );
\wait_time_cnt[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0070"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      I2 => tx_state(0),
      I3 => tx_state(3),
      O => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \wait_time_cnt[0]_i_4_n_0\,
      I1 => \wait_time_cnt[0]_i_5_n_0\,
      I2 => \wait_time_cnt[0]_i_6_n_0\,
      I3 => \wait_time_cnt[0]_i_7_n_0\,
      O => sel
    );
\wait_time_cnt[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      I1 => wait_time_cnt_reg(7),
      I2 => wait_time_cnt_reg(9),
      I3 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_4_n_0\
    );
\wait_time_cnt[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      I1 => wait_time_cnt_reg(5),
      I2 => wait_time_cnt_reg(0),
      I3 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[0]_i_5_n_0\
    );
\wait_time_cnt[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      I1 => wait_time_cnt_reg(4),
      I2 => wait_time_cnt_reg(12),
      I3 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[0]_i_6_n_0\
    );
\wait_time_cnt[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      I1 => wait_time_cnt_reg(10),
      I2 => wait_time_cnt_reg(14),
      I3 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[0]_i_7_n_0\
    );
\wait_time_cnt[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_8_n_0\
    );
\wait_time_cnt[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_9_n_0\
    );
\wait_time_cnt[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      O => \wait_time_cnt[12]_i_2_n_0\
    );
\wait_time_cnt[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      O => \wait_time_cnt[12]_i_3_n_0\
    );
\wait_time_cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[12]_i_4_n_0\
    );
\wait_time_cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(7),
      O => \wait_time_cnt[4]_i_2_n_0\
    );
\wait_time_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      O => \wait_time_cnt[4]_i_3_n_0\
    );
\wait_time_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(5),
      O => \wait_time_cnt[4]_i_4_n_0\
    );
\wait_time_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[8]_i_2_n_0\
    );
\wait_time_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[8]_i_3_n_0\
    );
\wait_time_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[8]_i_4_n_0\
    );
\wait_time_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_7\,
      Q => wait_time_cnt_reg(0),
      S => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(2) => \wait_time_cnt_reg[0]_i_3_n_1\,
      CO(1) => \wait_time_cnt_reg[0]_i_3_n_2\,
      CO(0) => \wait_time_cnt_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[0]_i_3_n_4\,
      O(2) => \wait_time_cnt_reg[0]_i_3_n_5\,
      O(1) => \wait_time_cnt_reg[0]_i_3_n_6\,
      O(0) => \wait_time_cnt_reg[0]_i_3_n_7\,
      S(3) => \wait_time_cnt[0]_i_8_n_0\,
      S(2) => \wait_time_cnt[0]_i_9_n_0\,
      S(1) => \wait_time_cnt[0]_i_10_n_0\,
      S(0) => \wait_time_cnt[0]_i_11_n_0\
    );
\wait_time_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_5\,
      Q => wait_time_cnt_reg(10),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_4\,
      Q => wait_time_cnt_reg(11),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_7\,
      Q => wait_time_cnt_reg(12),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(3) => \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wait_time_cnt_reg[12]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[12]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \wait_time_cnt_reg[12]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[12]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[12]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[12]_i_1_n_7\,
      S(3) => \wait_time_cnt[12]_i_2_n_0\,
      S(2) => \wait_time_cnt[12]_i_3_n_0\,
      S(1) => \wait_time_cnt[12]_i_4_n_0\,
      S(0) => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_6\,
      Q => wait_time_cnt_reg(13),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_5\,
      Q => wait_time_cnt_reg(14),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_4\,
      Q => wait_time_cnt_reg(15),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_6\,
      Q => wait_time_cnt_reg(1),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_5\,
      Q => wait_time_cnt_reg(2),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_4\,
      Q => wait_time_cnt_reg(3),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_7\,
      Q => wait_time_cnt_reg(4),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(3) => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[4]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[4]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[4]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[4]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[4]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[4]_i_1_n_7\,
      S(3) => \wait_time_cnt[4]_i_2_n_0\,
      S(2) => \wait_time_cnt[4]_i_3_n_0\,
      S(1) => \wait_time_cnt[4]_i_4_n_0\,
      S(0) => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_6\,
      Q => wait_time_cnt_reg(5),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_5\,
      Q => wait_time_cnt_reg(6),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_4\,
      Q => wait_time_cnt_reg(7),
      R => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_7\,
      Q => wait_time_cnt_reg(8),
      S => \wait_time_cnt[0]_i_1__0_n_0\
    );
\wait_time_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(3) => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[8]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[8]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[8]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[8]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[8]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[8]_i_1_n_7\,
      S(3) => \wait_time_cnt[8]_i_2_n_0\,
      S(2) => \wait_time_cnt[8]_i_3_n_0\,
      S(1) => \wait_time_cnt[8]_i_4_n_0\,
      S(0) => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => init_clk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_6\,
      Q => wait_time_cnt_reg(9),
      S => \wait_time_cnt[0]_i_1__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_AURORA_LANE is
  port (
    lane_up : out STD_LOGIC;
    ena_comma_align_i : out STD_LOGIC;
    tx_reset_i : out STD_LOGIC;
    TXCHARISK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rx_pad_i : out STD_LOGIC;
    rx_scp_i : out STD_LOGIC;
    rx_ecp_i : out STD_LOGIC;
    m_axi_rx_snf : out STD_LOGIC;
    got_v_i : out STD_LOGIC;
    hard_err_flop_r_reg : out STD_LOGIC;
    hard_err_reset_i : out STD_LOGIC;
    hard_err_i : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rx_polarity_i : out STD_LOGIC;
    left_aligned_r_reg : out STD_LOGIC;
    rx_pe_data_v_i : out STD_LOGIC;
    left_aligned_r_reg_0 : out STD_LOGIC;
    RX_EOF_N_reg : out STD_LOGIC;
    in_frame_r_reg : out STD_LOGIC;
    storage_v_r_reg : out STD_LOGIC;
    TXDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CHANNEL_SOFT_ERR_reg : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ready_r_reg0 : in STD_LOGIC;
    gen_pad_i : in STD_LOGIC;
    tx_pe_data_v_i : in STD_LOGIC;
    gen_cc_i : in STD_LOGIC;
    gen_snf_i : in STD_LOGIC;
    gen_ecp_i : in STD_LOGIC;
    gen_scp_i : in STD_LOGIC;
    gen_a_i : in STD_LOGIC;
    left_aligned_r_reg_1 : in STD_LOGIC;
    left_aligned_r_reg_2 : in STD_LOGIC;
    hard_err_flop_r0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    left_aligned_r_reg_3 : in STD_LOGIC;
    rx_realign_i : in STD_LOGIC;
    rst_r_reg : in STD_LOGIC;
    gtrxreset_o_reg_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_frame_r : in STD_LOGIC;
    storage_v_r : in STD_LOGIC;
    gen_v_flop_0_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_r_flop_0_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_k_flop_0_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \FC_NB_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    left_aligned_r_reg_4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg_5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gtrxreset_o_reg_1 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_AURORA_LANE : entity is "merger_aurora_AURORA_LANE";
end merger_aurora_merger_aurora_AURORA_LANE;

architecture STRUCTURE of merger_aurora_merger_aurora_AURORA_LANE is
  signal RX_CC : STD_LOGIC;
  signal RX_NEG : STD_LOGIC;
  signal ack_r : STD_LOGIC;
  signal counter3_r0 : STD_LOGIC;
  signal counter4_r0 : STD_LOGIC;
  signal first_v_received_r : STD_LOGIC;
  signal gen_k_i : STD_LOGIC;
  signal gen_sp_data_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gen_spa_data_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal lane_init_sm_i_n_5 : STD_LOGIC;
  signal ready_r : STD_LOGIC;
  signal send_sp_c : STD_LOGIC;
  signal sym_gen_i_n_2 : STD_LOGIC;
begin
err_detect_i: entity work.merger_aurora_merger_aurora_ERR_DETECT
     port map (
      CHANNEL_SOFT_ERR_reg => CHANNEL_SOFT_ERR_reg,
      SR(0) => lane_init_sm_i_n_5,
      gtrxreset_o_reg => gtrxreset_o_reg,
      gtrxreset_o_reg_0(1 downto 0) => gtrxreset_o_reg_1(1 downto 0),
      hard_err_flop_r0 => hard_err_flop_r0,
      hard_err_flop_r_reg_0 => hard_err_flop_r_reg,
      hard_err_i => hard_err_i,
      hard_err_reset_i => hard_err_reset_i
    );
lane_init_sm_i: entity work.merger_aurora_merger_aurora_LANE_INIT_SM
     port map (
      D(1) => gen_sp_data_i(0),
      D(0) => send_sp_c,
      RX_NEG => RX_NEG,
      SR(0) => SR(0),
      ack_r => ack_r,
      counter3_r0 => counter3_r0,
      counter4_r0 => counter4_r0,
      first_v_received_r => first_v_received_r,
      gen_k_i => gen_k_i,
      gen_spa_data_i(0) => gen_spa_data_i(0),
      \gen_spa_data_r_reg[1]\ => sym_gen_i_n_2,
      gtrxreset_o_reg => gtrxreset_o_reg,
      gtrxreset_o_reg_0(1 downto 0) => gtrxreset_o_reg_0(1 downto 0),
      hard_err_flop_r_reg(0) => lane_init_sm_i_n_5,
      lane_up => lane_up,
      left_aligned_r_reg => left_aligned_r_reg_0,
      ready_r => ready_r,
      ready_r_reg0 => ready_r_reg0,
      realign_r_reg_0 => ena_comma_align_i,
      reset_count_r_reg_0 => tx_reset_i,
      rst_r_reg_0 => rst_r_reg,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i
    );
merger_aurora_hotplug_i: entity work.merger_aurora_merger_aurora_hotplug
     port map (
      D(0) => RX_CC,
      SR(0) => SR(0),
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      link_reset_out => link_reset_out
    );
sym_dec_i: entity work.merger_aurora_merger_aurora_SYM_DEC
     port map (
      D(0) => RX_CC,
      RX_EOF_N_reg => rx_ecp_i,
      RX_EOF_N_reg_0 => RX_EOF_N_reg,
      RX_NEG => RX_NEG,
      SR(0) => SR(0),
      ack_r => ack_r,
      counter3_r0 => counter3_r0,
      counter4_r0 => counter4_r0,
      first_v_received_r => first_v_received_r,
      got_v_i => got_v_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      in_frame_r => in_frame_r,
      in_frame_r_reg => in_frame_r_reg,
      left_aligned_r_reg_0 => left_aligned_r_reg,
      left_aligned_r_reg_1 => left_aligned_r_reg_1,
      left_aligned_r_reg_2 => left_aligned_r_reg_2,
      left_aligned_r_reg_3 => left_aligned_r_reg_3,
      left_aligned_r_reg_4(7 downto 0) => left_aligned_r_reg_4(7 downto 0),
      left_aligned_r_reg_5(7 downto 0) => left_aligned_r_reg_5(7 downto 0),
      m_axi_rx_snf => m_axi_rx_snf,
      ready_r => ready_r,
      rx_pad_i => rx_pad_i,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_scp_i => rx_scp_i,
      \storage_r_reg[0]\(15 downto 0) => D(15 downto 0),
      storage_v_r => storage_v_r,
      storage_v_r_reg => storage_v_r_reg
    );
sym_gen_i: entity work.merger_aurora_merger_aurora_SYM_GEN
     port map (
      D(1) => gen_sp_data_i(0),
      D(0) => send_sp_c,
      \FC_NB_reg[0]\(3 downto 0) => \FC_NB_reg[0]\(3 downto 0),
      Q(15 downto 0) => Q(15 downto 0),
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      ack_r => ack_r,
      \counter2_r_reg[15]\ => sym_gen_i_n_2,
      gen_a_i => gen_a_i,
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_k_flop_0_i(1 downto 0) => gen_k_flop_0_i(1 downto 0),
      gen_k_i => gen_k_i,
      gen_pad_i => gen_pad_i,
      gen_r_flop_0_i(1 downto 0) => gen_r_flop_0_i(1 downto 0),
      gen_scp_i => gen_scp_i,
      gen_snf_i => gen_snf_i,
      gen_spa_data_i(0) => gen_spa_data_i(0),
      gen_v_flop_0_i(1 downto 0) => gen_v_flop_0_i(1 downto 0),
      gtrxreset_o_reg => gtrxreset_o_reg,
      tx_pe_data_v_i => tx_pe_data_v_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_gt is
  port (
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rx_realign_i : out STD_LOGIC;
    rxfsm_rxresetdone_r_reg : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC;
    txfsm_txresetdone_r_reg : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \RX_CHAR_IS_COMMA_R_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_aligned_control_bits_r_reg[1]\ : out STD_LOGIC;
    \word_aligned_control_bits_r_reg[0]\ : out STD_LOGIC;
    reset_count_r_reg : out STD_LOGIC;
    \soft_err_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    hard_err_flop_r0 : out STD_LOGIC;
    \word_aligned_data_r_reg[8]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[0]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_tx_reset_i : in STD_LOGIC;
    gt0_pll0outclk_out : in STD_LOGIC;
    gt0_pll0outrefclk_out : in STD_LOGIC;
    gt0_pll1outclk_out : in STD_LOGIC;
    gt0_pll1outrefclk_out : in STD_LOGIC;
    ena_comma_align_i : in STD_LOGIC;
    rx_polarity_i : in STD_LOGIC;
    gt_rxuserrdy_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    gt_txuserrdy_i : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TXDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TXCHARISK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    common_reset_i : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    left_aligned_r_reg_0 : in STD_LOGIC;
    tx_reset_i : in STD_LOGIC;
    bucket_full_r_reg : in STD_LOGIC;
    first_v_received_r_reg : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_gt : entity is "merger_aurora_gt";
end merger_aurora_merger_aurora_gt;

architecture STRUCTURE of merger_aurora_merger_aurora_gt is
  signal \^rx_char_is_comma_r_reg[1]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal drp_op_done : STD_LOGIC;
  signal drpaddr_i : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal drpdi_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^drpdo_out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal drpen_i : STD_LOGIC;
  signal \^drprdy_out\ : STD_LOGIC;
  signal drpwe_i : STD_LOGIC;
  signal gtpe2_i_n_1 : STD_LOGIC;
  signal gtpe2_i_n_102 : STD_LOGIC;
  signal gtpe2_i_n_104 : STD_LOGIC;
  signal gtpe2_i_n_105 : STD_LOGIC;
  signal gtpe2_i_n_14 : STD_LOGIC;
  signal gtpe2_i_n_24 : STD_LOGIC;
  signal gtpe2_i_n_28 : STD_LOGIC;
  signal gtpe2_i_n_29 : STD_LOGIC;
  signal gtpe2_i_n_39 : STD_LOGIC;
  signal gtpe2_i_n_40 : STD_LOGIC;
  signal gtpe2_i_n_48 : STD_LOGIC;
  signal gtpe2_i_n_49 : STD_LOGIC;
  signal gtpe2_i_n_50 : STD_LOGIC;
  signal gtpe2_i_n_51 : STD_LOGIC;
  signal gtpe2_i_n_52 : STD_LOGIC;
  signal gtpe2_i_n_53 : STD_LOGIC;
  signal gtpe2_i_n_54 : STD_LOGIC;
  signal gtpe2_i_n_55 : STD_LOGIC;
  signal gtpe2_i_n_56 : STD_LOGIC;
  signal gtpe2_i_n_57 : STD_LOGIC;
  signal gtpe2_i_n_58 : STD_LOGIC;
  signal gtpe2_i_n_59 : STD_LOGIC;
  signal gtpe2_i_n_60 : STD_LOGIC;
  signal gtpe2_i_n_61 : STD_LOGIC;
  signal gtpe2_i_n_62 : STD_LOGIC;
  signal gtpe2_i_n_7 : STD_LOGIC;
  signal gtpe2_i_n_9 : STD_LOGIC;
  signal gtpe2_i_n_95 : STD_LOGIC;
  signal gtpe2_i_n_96 : STD_LOGIC;
  signal gtrxreset_out : STD_LOGIC;
  signal gtrxreset_seq_i_n_0 : STD_LOGIC;
  signal gtrxreset_seq_i_n_10 : STD_LOGIC;
  signal gtrxreset_seq_i_n_4 : STD_LOGIC;
  signal gtrxreset_seq_i_n_5 : STD_LOGIC;
  signal gtrxreset_seq_i_n_6 : STD_LOGIC;
  signal gtrxreset_seq_i_n_7 : STD_LOGIC;
  signal gtrxreset_seq_i_n_8 : STD_LOGIC;
  signal gtrxreset_seq_i_n_9 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rx_buf_err_i : STD_LOGIC;
  signal rx_char_is_k_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_data_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rx_disp_err_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_not_in_table_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^rx_realign_i\ : STD_LOGIC;
  signal tx_buf_err_i : STD_LOGIC;
  signal NLW_gtpe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PMARSVDOUT0_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PMARSVDOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXPMARESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gtpe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_gtpe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_gtpe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_gtpe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_gtpe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtpe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_gtpe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtpe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_gtpe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtpe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtpe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtpe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtpe2_i : label is "PRIMITIVE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of gtpe2_i_i_27 : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of gtpe2_i_i_7 : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of reset_count_r_i_2 : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \soft_err_r[0]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \word_aligned_control_bits_r[0]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \word_aligned_control_bits_r[1]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \word_aligned_data_r[0]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \word_aligned_data_r[10]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \word_aligned_data_r[11]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \word_aligned_data_r[12]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \word_aligned_data_r[13]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \word_aligned_data_r[14]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \word_aligned_data_r[15]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \word_aligned_data_r[1]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \word_aligned_data_r[2]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \word_aligned_data_r[3]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \word_aligned_data_r[4]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \word_aligned_data_r[5]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \word_aligned_data_r[6]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \word_aligned_data_r[7]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \word_aligned_data_r[8]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \word_aligned_data_r[9]_i_1\ : label is "soft_lutpair74";
begin
  \RX_CHAR_IS_COMMA_R_reg[1]\(1 downto 0) <= \^rx_char_is_comma_r_reg[1]\(1 downto 0);
  drpdo_out(15 downto 0) <= \^drpdo_out\(15 downto 0);
  drprdy_out <= \^drprdy_out\;
  rx_realign_i <= \^rx_realign_i\;
gtpe2_i: unisim.vcomponents.GTPE2_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => B"00000000000000000000",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CFOK_CFG => B"1001001000000000000000001000000111010000000",
      CFOK_CFG2 => B"0100000",
      CFOK_CFG3 => B"0100000",
      CFOK_CFG4 => '0',
      CFOK_CFG5 => B"00",
      CFOK_CFG6 => B"0000",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 7,
      CHAN_BOND_SEQ_1_1 => B"0101111100",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"0001",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"0000",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_COMMON_SWING => '0',
      CLK_CORRECT_USE => "TRUE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 17,
      CLK_COR_MIN_LAT => 12,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0111110111",
      CLK_COR_SEQ_1_2 => B"0111110111",
      CLK_COR_SEQ_1_3 => B"0100000000",
      CLK_COR_SEQ_1_4 => B"0100000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0100000000",
      CLK_COR_SEQ_2_3 => B"0100000000",
      CLK_COR_SEQ_2_4 => B"0100000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 2,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "FALSE",
      DMONITOR_CFG => X"000A00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "FALSE",
      ES_HORZ_OFFSET => X"010",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CLKRSVD0_INVERTED => '0',
      IS_CLKRSVD1_INVERTED => '0',
      IS_DMONITORCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_SIGVALIDCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      LOOPBACK_CFG => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"3C",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_LOOPBACK_CFG => '0',
      PMA_RSV => X"00000333",
      PMA_RSV2 => X"00002040",
      PMA_RSV3 => B"00",
      PMA_RSV4 => B"0000",
      PMA_RSV5 => '0',
      PMA_RSV6 => '0',
      PMA_RSV7 => '0',
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FULL",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"0000107FE206001041010",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"001001",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPMRESET_TIME => B"0001111",
      RXLPM_BIAS_STARTUP_DISABLE => '0',
      RXLPM_CFG => B"0110",
      RXLPM_CFG1 => '0',
      RXLPM_CM_CFG => '0',
      RXLPM_GC_CFG => B"111100010",
      RXLPM_GC_CFG2 => B"001",
      RXLPM_HF_CFG => B"00001111110000",
      RXLPM_HF_CFG2 => B"01010",
      RXLPM_HF_CFG3 => B"0000",
      RXLPM_HOLD_DURING_EIDLE => '0',
      RXLPM_INCM_CFG => '1',
      RXLPM_IPCM_CFG => '0',
      RXLPM_LF_CFG => B"000000001111110000",
      RXLPM_LF_CFG2 => B"01010",
      RXLPM_OSINT_CFG => B"100",
      RXOOB_CFG => B"0000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOSCALRESET_TIMEOUT => B"00000",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"C00002",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"000",
      RXPI_CFG1 => '1',
      RXPI_CFG2 => '1',
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '0',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_BIAS_CFG => B"0000111100110011",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 4,
      RX_CLKMUX_EN => '1',
      RX_CM_SEL => B"11",
      RX_CM_TRIM => B"1010",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"00000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"0101",
      SATA_BURST_VAL => B"100",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SATA_PLL_CFG => "VCO_3000MHZ",
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "2.0",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOOB_CFG => '0',
      TXOUT_DIV => 2,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"00",
      TXPI_CFG1 => B"00",
      TXPI_CFG2 => B"00",
      TXPI_CFG3 => '0',
      TXPI_CFG4 => '0',
      TXPI_CFG5 => B"000",
      TXPI_GREY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"000",
      TXPMARESET_TIME => B"00001",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 4,
      TX_CLKMUX_EN => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_PREDRIVER_MODE => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0',
      USE_PCS_CLK_PHASE_SEL => '0'
    )
        port map (
      CFGRESET => '0',
      CLKRSVD0 => '0',
      CLKRSVD1 => '0',
      DMONFIFORESET => '0',
      DMONITORCLK => '0',
      DMONITOROUT(14) => gtpe2_i_n_48,
      DMONITOROUT(13) => gtpe2_i_n_49,
      DMONITOROUT(12) => gtpe2_i_n_50,
      DMONITOROUT(11) => gtpe2_i_n_51,
      DMONITOROUT(10) => gtpe2_i_n_52,
      DMONITOROUT(9) => gtpe2_i_n_53,
      DMONITOROUT(8) => gtpe2_i_n_54,
      DMONITOROUT(7) => gtpe2_i_n_55,
      DMONITOROUT(6) => gtpe2_i_n_56,
      DMONITOROUT(5) => gtpe2_i_n_57,
      DMONITOROUT(4) => gtpe2_i_n_58,
      DMONITOROUT(3) => gtpe2_i_n_59,
      DMONITOROUT(2) => gtpe2_i_n_60,
      DMONITOROUT(1) => gtpe2_i_n_61,
      DMONITOROUT(0) => gtpe2_i_n_62,
      DRPADDR(8) => gtrxreset_seq_i_n_4,
      DRPADDR(7) => gtrxreset_seq_i_n_5,
      DRPADDR(6) => gtrxreset_seq_i_n_6,
      DRPADDR(5) => gtrxreset_seq_i_n_7,
      DRPADDR(4) => drpaddr_i(4),
      DRPADDR(3) => gtrxreset_seq_i_n_8,
      DRPADDR(2) => gtrxreset_seq_i_n_9,
      DRPADDR(1) => gtrxreset_seq_i_n_10,
      DRPADDR(0) => drpaddr_i(0),
      DRPCLK => drpclk_in,
      DRPDI(15 downto 0) => drpdi_i(15 downto 0),
      DRPDO(15 downto 0) => \^drpdo_out\(15 downto 0),
      DRPEN => drpen_i,
      DRPRDY => \^drprdy_out\,
      DRPWE => drpwe_i,
      EYESCANDATAERROR => gtpe2_i_n_1,
      EYESCANMODE => '0',
      EYESCANRESET => '0',
      EYESCANTRIGGER => '0',
      GTPRXN => rxn,
      GTPRXP => rxp,
      GTPTXN => txn,
      GTPTXP => txp,
      GTRESETSEL => '0',
      GTRSVD(15 downto 0) => B"0000000000000000",
      GTRXRESET => gtrxreset_out,
      GTTXRESET => gt_tx_reset_i,
      LOOPBACK(2 downto 0) => loopback(2 downto 0),
      PCSRSVDIN(15 downto 0) => B"0000000000000000",
      PCSRSVDOUT(15 downto 0) => NLW_gtpe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gtpe2_i_PHYSTATUS_UNCONNECTED,
      PLL0CLK => gt0_pll0outclk_out,
      PLL0REFCLK => gt0_pll0outrefclk_out,
      PLL1CLK => gt0_pll1outclk_out,
      PLL1REFCLK => gt0_pll1outrefclk_out,
      PMARSVDIN0 => '0',
      PMARSVDIN1 => '0',
      PMARSVDIN2 => '0',
      PMARSVDIN3 => '0',
      PMARSVDIN4 => '0',
      PMARSVDOUT0 => NLW_gtpe2_i_PMARSVDOUT0_UNCONNECTED,
      PMARSVDOUT1 => NLW_gtpe2_i_PMARSVDOUT1_UNCONNECTED,
      RESETOVRD => '0',
      RX8B10BEN => '1',
      RXADAPTSELTEST(13 downto 0) => B"00000000000000",
      RXBUFRESET => '0',
      RXBUFSTATUS(2) => rx_buf_err_i,
      RXBUFSTATUS(1) => gtpe2_i_n_104,
      RXBUFSTATUS(0) => gtpe2_i_n_105,
      RXBYTEISALIGNED => gtpe2_i_n_7,
      RXBYTEREALIGN => \^rx_realign_i\,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => gtpe2_i_n_9,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gtpe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gtpe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gtpe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(3 downto 2) => NLW_gtpe2_i_RXCHARISCOMMA_UNCONNECTED(3 downto 2),
      RXCHARISCOMMA(1 downto 0) => \^rx_char_is_comma_r_reg[1]\(1 downto 0),
      RXCHARISK(3 downto 2) => NLW_gtpe2_i_RXCHARISK_UNCONNECTED(3 downto 2),
      RXCHARISK(1 downto 0) => rx_char_is_k_i(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(3 downto 0) => B"0000",
      RXCHBONDLEVEL(2 downto 0) => B"000",
      RXCHBONDMASTER => '0',
      RXCHBONDO(3 downto 0) => NLW_gtpe2_i_RXCHBONDO_UNCONNECTED(3 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1) => gtpe2_i_n_95,
      RXCLKCORCNT(0) => gtpe2_i_n_96,
      RXCOMINITDET => NLW_gtpe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => gtpe2_i_n_14,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gtpe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gtpe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(31 downto 16) => NLW_gtpe2_i_RXDATA_UNCONNECTED(31 downto 16),
      RXDATA(15 downto 0) => rx_data_i(15 downto 0),
      RXDATAVALID(1 downto 0) => NLW_gtpe2_i_RXDATAVALID_UNCONNECTED(1 downto 0),
      RXDDIEN => '0',
      RXDFEXYDEN => '0',
      RXDISPERR(3 downto 2) => NLW_gtpe2_i_RXDISPERR_UNCONNECTED(3 downto 2),
      RXDISPERR(1 downto 0) => rx_disp_err_i(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gtpe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gtpe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1 downto 0) => B"11",
      RXGEARBOXSLIP => '0',
      RXHEADER(2 downto 0) => NLW_gtpe2_i_RXHEADER_UNCONNECTED(2 downto 0),
      RXHEADERVALID => NLW_gtpe2_i_RXHEADERVALID_UNCONNECTED,
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFOVRDEN => '0',
      RXLPMOSINTNTRLEN => '0',
      RXLPMRESET => '0',
      RXMCOMMAALIGNEN => ena_comma_align_i,
      RXNOTINTABLE(3 downto 2) => NLW_gtpe2_i_RXNOTINTABLE_UNCONNECTED(3 downto 2),
      RXNOTINTABLE(1 downto 0) => rx_not_in_table_i(1 downto 0),
      RXOOBRESET => '0',
      RXOSCALRESET => '0',
      RXOSHOLD => '0',
      RXOSINTCFG(3 downto 0) => B"0010",
      RXOSINTDONE => NLW_gtpe2_i_RXOSINTDONE_UNCONNECTED,
      RXOSINTEN => '1',
      RXOSINTHOLD => '0',
      RXOSINTID0(3 downto 0) => B"0000",
      RXOSINTNTRLEN => '0',
      RXOSINTOVRDEN => '0',
      RXOSINTPD => '0',
      RXOSINTSTARTED => NLW_gtpe2_i_RXOSINTSTARTED_UNCONNECTED,
      RXOSINTSTROBE => '0',
      RXOSINTSTROBEDONE => NLW_gtpe2_i_RXOSINTSTROBEDONE_UNCONNECTED,
      RXOSINTSTROBESTARTED => NLW_gtpe2_i_RXOSINTSTROBESTARTED_UNCONNECTED,
      RXOSINTTESTOVRDEN => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gtpe2_i_n_24,
      RXOUTCLKFABRIC => NLW_gtpe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gtpe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2 downto 0) => B"010",
      RXPCOMMAALIGNEN => ena_comma_align_i,
      RXPCSRESET => '0',
      RXPD(1) => power_down,
      RXPD(0) => power_down,
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gtpe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gtpe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gtpe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPMARESETDONE => gtpe2_i_n_28,
      RXPOLARITY => rx_polarity_i,
      RXPRBSCNTRESET => '0',
      RXPRBSERR => gtpe2_i_n_29,
      RXPRBSSEL(2 downto 0) => B"000",
      RXRATE(2 downto 0) => B"000",
      RXRATEDONE => NLW_gtpe2_i_RXRATEDONE_UNCONNECTED,
      RXRATEMODE => '0',
      RXRESETDONE => rxfsm_rxresetdone_r_reg,
      RXSLIDE => '0',
      RXSTARTOFSEQ(1 downto 0) => NLW_gtpe2_i_RXSTARTOFSEQ_UNCONNECTED(1 downto 0),
      RXSTATUS(2 downto 0) => NLW_gtpe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYNCALLIN => '0',
      RXSYNCDONE => NLW_gtpe2_i_RXSYNCDONE_UNCONNECTED,
      RXSYNCIN => '0',
      RXSYNCMODE => '0',
      RXSYNCOUT => NLW_gtpe2_i_RXSYNCOUT_UNCONNECTED,
      RXSYSCLKSEL(1 downto 0) => B"00",
      RXUSERRDY => gt_rxuserrdy_i,
      RXUSRCLK => gtrxreset_o_reg,
      RXUSRCLK2 => gtrxreset_o_reg,
      RXVALID => NLW_gtpe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      SIGVALIDCLK => '0',
      TSTIN(19 downto 0) => B"11111111111111111111",
      TX8B10BBYPASS(3 downto 0) => B"0000",
      TX8B10BEN => '1',
      TXBUFDIFFCTRL(2 downto 0) => B"100",
      TXBUFSTATUS(1) => tx_buf_err_i,
      TXBUFSTATUS(0) => gtpe2_i_n_102,
      TXCHARDISPMODE(3 downto 0) => B"0000",
      TXCHARDISPVAL(3 downto 0) => B"0000",
      TXCHARISK(3 downto 2) => B"00",
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXCOMFINISH => NLW_gtpe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(31 downto 16) => B"0000000000000000",
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3 downto 0) => B"1000",
      TXDIFFPD => '0',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gtpe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => power_down,
      TXGEARBOXREADY => NLW_gtpe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2 downto 0) => B"000",
      TXINHIBIT => '0',
      TXMAINCURSOR(6 downto 0) => B"0000000",
      TXMARGIN(2 downto 0) => B"000",
      TXOUTCLK => tx_out_clk,
      TXOUTCLKFABRIC => gtpe2_i_n_39,
      TXOUTCLKPCS => gtpe2_i_n_40,
      TXOUTCLKSEL(2 downto 0) => B"010",
      TXPCSRESET => '0',
      TXPD(1) => power_down,
      TXPD(0) => power_down,
      TXPDELECIDLEMODE => '0',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gtpe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '0',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gtpe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPIPPMEN => '0',
      TXPIPPMOVRDEN => '0',
      TXPIPPMPD => '0',
      TXPIPPMSEL => '1',
      TXPIPPMSTEPSIZE(4 downto 0) => B"00000",
      TXPISOPD => '0',
      TXPMARESET => '0',
      TXPMARESETDONE => NLW_gtpe2_i_TXPMARESETDONE_UNCONNECTED,
      TXPOLARITY => '0',
      TXPOSTCURSOR(4 downto 0) => B"00000",
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2 downto 0) => B"000",
      TXPRECURSOR(4 downto 0) => B"00000",
      TXPRECURSORINV => '0',
      TXRATE(2 downto 0) => B"000",
      TXRATEDONE => NLW_gtpe2_i_TXRATEDONE_UNCONNECTED,
      TXRATEMODE => '0',
      TXRESETDONE => txfsm_txresetdone_r_reg,
      TXSEQUENCE(6 downto 0) => B"0000000",
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYNCALLIN => '0',
      TXSYNCDONE => NLW_gtpe2_i_TXSYNCDONE_UNCONNECTED,
      TXSYNCIN => '0',
      TXSYNCMODE => '0',
      TXSYNCOUT => NLW_gtpe2_i_TXSYNCOUT_UNCONNECTED,
      TXSYSCLKSEL(1 downto 0) => B"00",
      TXUSERRDY => gt_txuserrdy_i,
      TXUSRCLK => gtrxreset_o_reg,
      TXUSRCLK2 => gtrxreset_o_reg
    );
gtpe2_i_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(8),
      I1 => p_0_in,
      I2 => rd_data(8),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(8)
    );
gtpe2_i_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(7),
      I1 => p_0_in,
      I2 => rd_data(7),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(7)
    );
gtpe2_i_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(6),
      I1 => p_0_in,
      I2 => rd_data(6),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(6)
    );
gtpe2_i_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(5),
      I1 => p_0_in,
      I2 => rd_data(5),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(5)
    );
gtpe2_i_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(4),
      I1 => p_0_in,
      I2 => rd_data(4),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(4)
    );
gtpe2_i_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(3),
      I1 => p_0_in,
      I2 => rd_data(3),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(3)
    );
gtpe2_i_i_16: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(2),
      I1 => p_0_in,
      I2 => rd_data(2),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(2)
    );
gtpe2_i_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(1),
      I1 => p_0_in,
      I2 => rd_data(1),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(1)
    );
gtpe2_i_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(0),
      I1 => p_0_in,
      I2 => rd_data(0),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(0)
    );
gtpe2_i_i_23: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => drpaddr_in(4),
      I1 => drp_op_done,
      O => drpaddr_i(4)
    );
gtpe2_i_i_27: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => drpaddr_in(0),
      I1 => drp_op_done,
      O => drpaddr_i(0)
    );
gtpe2_i_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(15),
      I1 => p_0_in,
      I2 => rd_data(15),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(15)
    );
gtpe2_i_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(14),
      I1 => p_0_in,
      I2 => rd_data(14),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(14)
    );
gtpe2_i_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(13),
      I1 => p_0_in,
      I2 => rd_data(13),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(13)
    );
gtpe2_i_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(12),
      I1 => p_0_in,
      I2 => rd_data(12),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(12)
    );
gtpe2_i_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => drpdi_in(11),
      I1 => p_0_in,
      I2 => rd_data(11),
      I3 => drp_op_done,
      O => drpdi_i(11)
    );
gtpe2_i_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(10),
      I1 => p_0_in,
      I2 => rd_data(10),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(10)
    );
gtpe2_i_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAF0C0"
    )
        port map (
      I0 => drpdi_in(9),
      I1 => p_0_in,
      I2 => rd_data(9),
      I3 => gtrxreset_seq_i_n_0,
      I4 => drp_op_done,
      O => drpdi_i(9)
    );
gtrxreset_seq_i: entity work.merger_aurora_merger_aurora_gtrxreset_seq
     port map (
      DRPADDR(6) => gtrxreset_seq_i_n_4,
      DRPADDR(5) => gtrxreset_seq_i_n_5,
      DRPADDR(4) => gtrxreset_seq_i_n_6,
      DRPADDR(3) => gtrxreset_seq_i_n_7,
      DRPADDR(2) => gtrxreset_seq_i_n_8,
      DRPADDR(1) => gtrxreset_seq_i_n_9,
      DRPADDR(0) => gtrxreset_seq_i_n_10,
      Q(15 downto 0) => rd_data(15 downto 0),
      SR(0) => SR(0),
      common_reset_i => common_reset_i,
      drp_op_done => drp_op_done,
      drpaddr_in(6 downto 3) => drpaddr_in(8 downto 5),
      drpaddr_in(2 downto 0) => drpaddr_in(3 downto 1),
      drpclk_in => drpclk_in,
      drpdo_out(15 downto 0) => \^drpdo_out\(15 downto 0),
      drpen_i => drpen_i,
      drpen_in => drpen_in,
      drpwe_i => drpwe_i,
      drpwe_in => drpwe_in,
      gtrxreset_o_reg_0 => \^drprdy_out\,
      gtrxreset_out => gtrxreset_out,
      in0 => gtpe2_i_n_28,
      init_clk_in => init_clk_in,
      \out\(1) => gtrxreset_seq_i_n_0,
      \out\(0) => p_0_in
    );
hard_err_flop_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => tx_buf_err_i,
      I1 => \^rx_realign_i\,
      I2 => bucket_full_r_reg,
      I3 => rx_buf_err_i,
      O => hard_err_flop_r0
    );
left_aligned_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFBF08000080"
    )
        port map (
      I0 => \^rx_char_is_comma_r_reg[1]\(0),
      I1 => first_v_received_r_reg,
      I2 => rx_char_is_k_i(0),
      I3 => \^rx_char_is_comma_r_reg[1]\(1),
      I4 => rx_char_is_k_i(1),
      I5 => left_aligned_r_reg_0,
      O => left_aligned_r_reg
    );
reset_count_r_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0F0F0E"
    )
        port map (
      I0 => rx_not_in_table_i(0),
      I1 => rx_disp_err_i(0),
      I2 => tx_reset_i,
      I3 => rx_not_in_table_i(1),
      I4 => rx_disp_err_i(1),
      O => reset_count_r_reg
    );
\soft_err_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_not_in_table_i(0),
      I1 => rx_disp_err_i(0),
      O => \soft_err_r_reg[0]\(1)
    );
\soft_err_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_not_in_table_i(1),
      I1 => rx_disp_err_i(1),
      O => \soft_err_r_reg[0]\(0)
    );
\word_aligned_control_bits_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_char_is_k_i(0),
      I1 => left_aligned_r_reg_0,
      I2 => rx_char_is_k_i(1),
      O => \word_aligned_control_bits_r_reg[0]\
    );
\word_aligned_control_bits_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_char_is_k_i(1),
      I1 => left_aligned_r_reg_0,
      I2 => rx_char_is_k_i(0),
      O => \word_aligned_control_bits_r_reg[1]\
    );
\word_aligned_data_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(7),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(15),
      O => \word_aligned_data_r_reg[0]\(7)
    );
\word_aligned_data_r[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(13),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(5),
      O => \word_aligned_data_r_reg[8]\(5)
    );
\word_aligned_data_r[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(12),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(4),
      O => \word_aligned_data_r_reg[8]\(4)
    );
\word_aligned_data_r[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(11),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(3),
      O => \word_aligned_data_r_reg[8]\(3)
    );
\word_aligned_data_r[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(10),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(2),
      O => \word_aligned_data_r_reg[8]\(2)
    );
\word_aligned_data_r[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(9),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(1),
      O => \word_aligned_data_r_reg[8]\(1)
    );
\word_aligned_data_r[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(8),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(0),
      O => \word_aligned_data_r_reg[8]\(0)
    );
\word_aligned_data_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(6),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(14),
      O => \word_aligned_data_r_reg[0]\(6)
    );
\word_aligned_data_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(5),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(13),
      O => \word_aligned_data_r_reg[0]\(5)
    );
\word_aligned_data_r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(4),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(12),
      O => \word_aligned_data_r_reg[0]\(4)
    );
\word_aligned_data_r[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(3),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(11),
      O => \word_aligned_data_r_reg[0]\(3)
    );
\word_aligned_data_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(2),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(10),
      O => \word_aligned_data_r_reg[0]\(2)
    );
\word_aligned_data_r[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(1),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(9),
      O => \word_aligned_data_r_reg[0]\(1)
    );
\word_aligned_data_r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(0),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(8),
      O => \word_aligned_data_r_reg[0]\(0)
    );
\word_aligned_data_r[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(15),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(7),
      O => \word_aligned_data_r_reg[8]\(7)
    );
\word_aligned_data_r[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_data_i(14),
      I1 => left_aligned_r_reg_0,
      I2 => rx_data_i(6),
      O => \word_aligned_data_r_reg[8]\(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_multi_gt is
  port (
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rx_realign_i : out STD_LOGIC;
    rxfsm_rxresetdone_r_reg : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC;
    txfsm_txresetdone_r_reg : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \RX_CHAR_IS_COMMA_R_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_aligned_control_bits_r_reg[1]\ : out STD_LOGIC;
    \word_aligned_control_bits_r_reg[0]\ : out STD_LOGIC;
    reset_count_r_reg : out STD_LOGIC;
    \soft_err_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    hard_err_flop_r0 : out STD_LOGIC;
    \word_aligned_data_r_reg[8]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[0]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_tx_reset_i : in STD_LOGIC;
    gt0_pll0outclk_out : in STD_LOGIC;
    gt0_pll0outrefclk_out : in STD_LOGIC;
    gt0_pll1outclk_out : in STD_LOGIC;
    gt0_pll1outrefclk_out : in STD_LOGIC;
    ena_comma_align_i : in STD_LOGIC;
    rx_polarity_i : in STD_LOGIC;
    gt_rxuserrdy_i : in STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    gt_txuserrdy_i : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TXDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TXCHARISK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    common_reset_i : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    left_aligned_r_reg_0 : in STD_LOGIC;
    tx_reset_i : in STD_LOGIC;
    bucket_full_r_reg : in STD_LOGIC;
    first_v_received_r_reg : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_multi_gt : entity is "merger_aurora_multi_gt";
end merger_aurora_merger_aurora_multi_gt;

architecture STRUCTURE of merger_aurora_merger_aurora_multi_gt is
begin
gt0_merger_aurora_i: entity work.merger_aurora_merger_aurora_gt
     port map (
      \RX_CHAR_IS_COMMA_R_reg[1]\(1 downto 0) => \RX_CHAR_IS_COMMA_R_reg[1]\(1 downto 0),
      SR(0) => SR(0),
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      bucket_full_r_reg => bucket_full_r_reg,
      common_reset_i => common_reset_i,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      ena_comma_align_i => ena_comma_align_i,
      first_v_received_r_reg => first_v_received_r_reg,
      gt0_pll0outclk_out => gt0_pll0outclk_out,
      gt0_pll0outrefclk_out => gt0_pll0outrefclk_out,
      gt0_pll1outclk_out => gt0_pll1outclk_out,
      gt0_pll1outrefclk_out => gt0_pll1outrefclk_out,
      gt_rxuserrdy_i => gt_rxuserrdy_i,
      gt_tx_reset_i => gt_tx_reset_i,
      gt_txuserrdy_i => gt_txuserrdy_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      hard_err_flop_r0 => hard_err_flop_r0,
      init_clk_in => init_clk_in,
      left_aligned_r_reg => left_aligned_r_reg,
      left_aligned_r_reg_0 => left_aligned_r_reg_0,
      loopback(2 downto 0) => loopback(2 downto 0),
      power_down => power_down,
      reset_count_r_reg => reset_count_r_reg,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rxfsm_rxresetdone_r_reg => rxfsm_rxresetdone_r_reg,
      rxn => rxn,
      rxp => rxp,
      \soft_err_r_reg[0]\(1 downto 0) => \soft_err_r_reg[0]\(1 downto 0),
      tx_out_clk => tx_out_clk,
      tx_reset_i => tx_reset_i,
      txfsm_txresetdone_r_reg => txfsm_txresetdone_r_reg,
      txn => txn,
      txp => txp,
      \word_aligned_control_bits_r_reg[0]\ => \word_aligned_control_bits_r_reg[0]\,
      \word_aligned_control_bits_r_reg[1]\ => \word_aligned_control_bits_r_reg[1]\,
      \word_aligned_data_r_reg[0]\(7 downto 0) => \word_aligned_data_r_reg[0]\(7 downto 0),
      \word_aligned_data_r_reg[8]\(7 downto 0) => \word_aligned_data_r_reg[8]\(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_GT_WRAPPER is
  port (
    \out\ : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rx_realign_i : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \RX_CHAR_IS_COMMA_R_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    common_reset_i : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_r : out STD_LOGIC;
    \word_aligned_control_bits_r_reg[1]\ : out STD_LOGIC;
    \word_aligned_control_bits_r_reg[0]\ : out STD_LOGIC;
    reset_count_r_reg : out STD_LOGIC;
    \soft_err_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    hard_err_flop_r0 : out STD_LOGIC;
    \word_aligned_data_r_reg[8]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[0]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    left_aligned_r_reg : out STD_LOGIC;
    gt_txresetdone_r2_reg : out STD_LOGIC;
    gt_rxresetdone_r2_reg : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_pll0outclk_out : in STD_LOGIC;
    gt0_pll0outrefclk_out : in STD_LOGIC;
    gt0_pll1outclk_out : in STD_LOGIC;
    gt0_pll1outrefclk_out : in STD_LOGIC;
    ena_comma_align_i : in STD_LOGIC;
    rx_polarity_i : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TXDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TXCHARISK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtrxreset_i : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    link_reset_out : in STD_LOGIC;
    gt_rst_r_reg : in STD_LOGIC;
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    left_aligned_r_reg_0 : in STD_LOGIC;
    tx_reset_i : in STD_LOGIC;
    bucket_full_r_reg : in STD_LOGIC;
    first_v_received_r_reg : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_GT_WRAPPER : entity is "merger_aurora_GT_WRAPPER";
end merger_aurora_merger_aurora_GT_WRAPPER;

architecture STRUCTURE of merger_aurora_merger_aurora_GT_WRAPPER is
  signal \^common_reset_i\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal gt0_rxresetdone_r3_reg_srl3_n_0 : STD_LOGIC;
  signal gt0_txresetdone_r3_reg_srl3_n_0 : STD_LOGIC;
  signal gt_rx_reset_i : STD_LOGIC;
  signal gt_rxuserrdy_i : STD_LOGIC;
  signal gt_tx_reset_i : STD_LOGIC;
  signal gt_txuserrdy_i : STD_LOGIC;
  signal gtrxreset_i_0 : STD_LOGIC;
  signal gtrxreset_pulse : STD_LOGIC;
  signal gtrxreset_pulse_i_1_n_0 : STD_LOGIC;
  signal gtrxreset_r1 : STD_LOGIC;
  signal gtrxreset_r2 : STD_LOGIC;
  signal gtrxreset_r3 : STD_LOGIC;
  signal gtrxreset_sync : STD_LOGIC;
  signal \^link_reset_r\ : STD_LOGIC;
  signal link_reset_r2 : STD_LOGIC;
  signal merger_aurora_multi_gt_i_n_4 : STD_LOGIC;
  signal merger_aurora_multi_gt_i_n_6 : STD_LOGIC;
  signal rx_cdrlock_counter : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \rx_cdrlock_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__0_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__0_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__0_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__1_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__2_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__3_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__4_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_1\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__5_n_3\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__6_n_2\ : STD_LOGIC;
  signal \rx_cdrlock_counter0_carry__6_n_3\ : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_0 : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_1 : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_2 : STD_LOGIC;
  signal rx_cdrlock_counter0_carry_n_3 : STD_LOGIC;
  signal \rx_cdrlock_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_2_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_3_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_4_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_5_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_6_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_7_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_8_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter[31]_i_9_n_0\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[18]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[19]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[20]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[21]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[22]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[23]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[24]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[25]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[26]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[27]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[28]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[29]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[30]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[31]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \rx_cdrlock_counter_reg_n_0_[9]\ : STD_LOGIC;
  signal rx_cdrlocked_i_1_n_0 : STD_LOGIC;
  signal rx_cdrlocked_reg_n_0 : STD_LOGIC;
  signal \^rx_resetdone_out\ : STD_LOGIC;
  signal rxfsm_rxresetdone_r : STD_LOGIC;
  signal rxfsm_rxresetdone_r2 : STD_LOGIC;
  signal rxfsm_soft_reset_r : STD_LOGIC;
  signal rxfsm_soft_reset_r_i_1_n_0 : STD_LOGIC;
  signal txfsm_txresetdone_r : STD_LOGIC;
  signal \NLW_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_rx_cdrlock_counter0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute srl_name : string;
  attribute srl_name of gt0_rxresetdone_r3_reg_srl3 : label is "inst/\merger_aurora_core_i/gt_wrapper_i/gt0_rxresetdone_r3_reg_srl3 ";
  attribute srl_name of gt0_txresetdone_r3_reg_srl3 : label is "inst/\merger_aurora_core_i/gt_wrapper_i/gt0_txresetdone_r3_reg_srl3 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of gt_rx_reset_i_reg : label is "no";
  attribute equivalent_register_removal of gtrxreset_r1_reg : label is "no";
  attribute equivalent_register_removal of rxfsm_rxresetdone_r2_reg : label is "no";
begin
  common_reset_i <= \^common_reset_i\;
  link_reset_r <= \^link_reset_r\;
  rx_resetdone_out <= \^rx_resetdone_out\;
gt0_rxresetdone_r3_reg_srl3: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => merger_aurora_multi_gt_i_n_4,
      Q => gt0_rxresetdone_r3_reg_srl3_n_0
    );
gt0_txresetdone_r3_reg_srl3: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => gtrxreset_o_reg,
      D => merger_aurora_multi_gt_i_n_6,
      Q => gt0_txresetdone_r3_reg_srl3_n_0
    );
gt_rx_reset_i_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_i_0,
      Q => gt_rx_reset_i,
      R => '0'
    );
gt_rxresetdone_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_resetdone_out\,
      O => gt_rxresetdone_r2_reg
    );
gt_rxresetfsm_i: entity work.merger_aurora_merger_aurora_rx_startup_fsm
     port map (
      AR(0) => rxfsm_soft_reset_r,
      gt_rxuserrdy_i => gt_rxuserrdy_i,
      gt_txuserrdy_i => gt_txuserrdy_i,
      gtrxreset_i_0 => gtrxreset_i_0,
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      quad1_common_lock_out => quad1_common_lock_out,
      rx_cdrlocked_reg => rx_cdrlocked_reg_n_0,
      rxfsm_rxresetdone_r => rxfsm_rxresetdone_r
    );
gt_txresetfsm_i: entity work.merger_aurora_merger_aurora_tx_startup_fsm
     port map (
      common_reset_i => \^common_reset_i\,
      gt_rst_r_reg => gt_rst_r_reg,
      gt_tx_reset_i => gt_tx_reset_i,
      gt_txresetdone_r2_reg => gt_txresetdone_r2_reg,
      gt_txuserrdy_i => gt_txuserrdy_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => \out\,
      quad1_common_lock_out => quad1_common_lock_out,
      txfsm_txresetdone_r => txfsm_txresetdone_r
    );
gtrxreset_cdc_sync: entity work.\merger_aurora_merger_aurora_cdc_sync__parameterized0_3\
     port map (
      gtrxreset_i => gtrxreset_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      init_clk_in => init_clk_in,
      \out\ => gtrxreset_sync
    );
gtrxreset_pulse_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gtrxreset_r2,
      I1 => gtrxreset_r3,
      O => gtrxreset_pulse_i_1_n_0
    );
gtrxreset_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_pulse_i_1_n_0,
      Q => gtrxreset_pulse,
      R => '0'
    );
gtrxreset_r1_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_sync,
      Q => gtrxreset_r1,
      R => '0'
    );
gtrxreset_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_r1,
      Q => gtrxreset_r2,
      R => '0'
    );
gtrxreset_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_r2,
      Q => gtrxreset_r3,
      R => '0'
    );
link_reset_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => \^link_reset_r\,
      Q => link_reset_r2,
      R => '0'
    );
link_reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_out,
      Q => \^link_reset_r\,
      R => '0'
    );
merger_aurora_multi_gt_i: entity work.merger_aurora_merger_aurora_multi_gt
     port map (
      \RX_CHAR_IS_COMMA_R_reg[1]\(1 downto 0) => \RX_CHAR_IS_COMMA_R_reg[1]\(1 downto 0),
      SR(0) => gt_rx_reset_i,
      TXCHARISK(1 downto 0) => TXCHARISK(1 downto 0),
      TXDATA(15 downto 0) => TXDATA(15 downto 0),
      bucket_full_r_reg => bucket_full_r_reg,
      common_reset_i => \^common_reset_i\,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      ena_comma_align_i => ena_comma_align_i,
      first_v_received_r_reg => first_v_received_r_reg,
      gt0_pll0outclk_out => gt0_pll0outclk_out,
      gt0_pll0outrefclk_out => gt0_pll0outrefclk_out,
      gt0_pll1outclk_out => gt0_pll1outclk_out,
      gt0_pll1outrefclk_out => gt0_pll1outrefclk_out,
      gt_rxuserrdy_i => gt_rxuserrdy_i,
      gt_tx_reset_i => gt_tx_reset_i,
      gt_txuserrdy_i => gt_txuserrdy_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      hard_err_flop_r0 => hard_err_flop_r0,
      init_clk_in => init_clk_in,
      left_aligned_r_reg => left_aligned_r_reg,
      left_aligned_r_reg_0 => left_aligned_r_reg_0,
      loopback(2 downto 0) => loopback(2 downto 0),
      power_down => power_down,
      reset_count_r_reg => reset_count_r_reg,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rxfsm_rxresetdone_r_reg => merger_aurora_multi_gt_i_n_4,
      rxn => rxn,
      rxp => rxp,
      \soft_err_r_reg[0]\(1 downto 0) => \soft_err_r_reg[0]\(1 downto 0),
      tx_out_clk => tx_out_clk,
      tx_reset_i => tx_reset_i,
      txfsm_txresetdone_r_reg => merger_aurora_multi_gt_i_n_6,
      txn => txn,
      txp => txp,
      \word_aligned_control_bits_r_reg[0]\ => \word_aligned_control_bits_r_reg[0]\,
      \word_aligned_control_bits_r_reg[1]\ => \word_aligned_control_bits_r_reg[1]\,
      \word_aligned_data_r_reg[0]\(7 downto 0) => \word_aligned_data_r_reg[0]\(7 downto 0),
      \word_aligned_data_r_reg[8]\(7 downto 0) => \word_aligned_data_r_reg[8]\(7 downto 0)
    );
rx_cdrlock_counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => rx_cdrlock_counter0_carry_n_0,
      CO(2) => rx_cdrlock_counter0_carry_n_1,
      CO(1) => rx_cdrlock_counter0_carry_n_2,
      CO(0) => rx_cdrlock_counter0_carry_n_3,
      CYINIT => \rx_cdrlock_counter_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \rx_cdrlock_counter_reg_n_0_[4]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[3]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[2]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[1]\
    );
\rx_cdrlock_counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => rx_cdrlock_counter0_carry_n_0,
      CO(3) => \rx_cdrlock_counter0_carry__0_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__0_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__0_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \rx_cdrlock_counter_reg_n_0_[8]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[7]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[6]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[5]\
    );
\rx_cdrlock_counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__0_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__1_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__1_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__1_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \rx_cdrlock_counter_reg_n_0_[12]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[11]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[10]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[9]\
    );
\rx_cdrlock_counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__1_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__2_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__2_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__2_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \rx_cdrlock_counter_reg_n_0_[16]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[15]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[14]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[13]\
    );
\rx_cdrlock_counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__2_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__3_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__3_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__3_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \rx_cdrlock_counter_reg_n_0_[20]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[19]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[18]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[17]\
    );
\rx_cdrlock_counter0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__3_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__4_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__4_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__4_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3) => \rx_cdrlock_counter_reg_n_0_[24]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[23]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[22]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[21]\
    );
\rx_cdrlock_counter0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__4_n_0\,
      CO(3) => \rx_cdrlock_counter0_carry__5_n_0\,
      CO(2) => \rx_cdrlock_counter0_carry__5_n_1\,
      CO(1) => \rx_cdrlock_counter0_carry__5_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3) => \rx_cdrlock_counter_reg_n_0_[28]\,
      S(2) => \rx_cdrlock_counter_reg_n_0_[27]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[26]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[25]\
    );
\rx_cdrlock_counter0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \rx_cdrlock_counter0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \rx_cdrlock_counter0_carry__6_n_2\,
      CO(0) => \rx_cdrlock_counter0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_rx_cdrlock_counter0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2) => \rx_cdrlock_counter_reg_n_0_[31]\,
      S(1) => \rx_cdrlock_counter_reg_n_0_[30]\,
      S(0) => \rx_cdrlock_counter_reg_n_0_[29]\
    );
\rx_cdrlock_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => \rx_cdrlock_counter_reg_n_0_[0]\,
      O => \rx_cdrlock_counter[0]_i_1_n_0\
    );
\rx_cdrlock_counter[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(10),
      O => rx_cdrlock_counter(10)
    );
\rx_cdrlock_counter[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(11),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter(11)
    );
\rx_cdrlock_counter[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(12),
      O => rx_cdrlock_counter(12)
    );
\rx_cdrlock_counter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(13),
      O => rx_cdrlock_counter(13)
    );
\rx_cdrlock_counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(14),
      O => rx_cdrlock_counter(14)
    );
\rx_cdrlock_counter[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(15),
      O => rx_cdrlock_counter(15)
    );
\rx_cdrlock_counter[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(16),
      O => rx_cdrlock_counter(16)
    );
\rx_cdrlock_counter[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(17),
      O => rx_cdrlock_counter(17)
    );
\rx_cdrlock_counter[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(18),
      O => rx_cdrlock_counter(18)
    );
\rx_cdrlock_counter[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(19),
      O => rx_cdrlock_counter(19)
    );
\rx_cdrlock_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(1),
      O => rx_cdrlock_counter(1)
    );
\rx_cdrlock_counter[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(20),
      O => rx_cdrlock_counter(20)
    );
\rx_cdrlock_counter[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(21),
      O => rx_cdrlock_counter(21)
    );
\rx_cdrlock_counter[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(22),
      O => rx_cdrlock_counter(22)
    );
\rx_cdrlock_counter[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(23),
      O => rx_cdrlock_counter(23)
    );
\rx_cdrlock_counter[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(24),
      O => rx_cdrlock_counter(24)
    );
\rx_cdrlock_counter[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(25),
      O => rx_cdrlock_counter(25)
    );
\rx_cdrlock_counter[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(26),
      O => rx_cdrlock_counter(26)
    );
\rx_cdrlock_counter[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(27),
      O => rx_cdrlock_counter(27)
    );
\rx_cdrlock_counter[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(28),
      O => rx_cdrlock_counter(28)
    );
\rx_cdrlock_counter[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(29),
      O => rx_cdrlock_counter(29)
    );
\rx_cdrlock_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(2),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter(2)
    );
\rx_cdrlock_counter[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(30),
      O => rx_cdrlock_counter(30)
    );
\rx_cdrlock_counter[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(31),
      O => rx_cdrlock_counter(31)
    );
\rx_cdrlock_counter[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[18]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[19]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[16]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[17]\,
      I4 => \rx_cdrlock_counter[31]_i_6_n_0\,
      O => \rx_cdrlock_counter[31]_i_2_n_0\
    );
\rx_cdrlock_counter[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[26]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[27]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[24]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[25]\,
      I4 => \rx_cdrlock_counter[31]_i_7_n_0\,
      O => \rx_cdrlock_counter[31]_i_3_n_0\
    );
\rx_cdrlock_counter[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[3]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[2]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[0]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[1]\,
      I4 => \rx_cdrlock_counter[31]_i_8_n_0\,
      O => \rx_cdrlock_counter[31]_i_4_n_0\
    );
\rx_cdrlock_counter[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[10]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[11]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[9]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[8]\,
      I4 => \rx_cdrlock_counter[31]_i_9_n_0\,
      O => \rx_cdrlock_counter[31]_i_5_n_0\
    );
\rx_cdrlock_counter[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[21]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[20]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[23]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[22]\,
      O => \rx_cdrlock_counter[31]_i_6_n_0\
    );
\rx_cdrlock_counter[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[29]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[28]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[31]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[30]\,
      O => \rx_cdrlock_counter[31]_i_7_n_0\
    );
\rx_cdrlock_counter[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[5]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[4]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[6]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[7]\,
      O => \rx_cdrlock_counter[31]_i_8_n_0\
    );
\rx_cdrlock_counter[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \rx_cdrlock_counter_reg_n_0_[13]\,
      I1 => \rx_cdrlock_counter_reg_n_0_[12]\,
      I2 => \rx_cdrlock_counter_reg_n_0_[15]\,
      I3 => \rx_cdrlock_counter_reg_n_0_[14]\,
      O => \rx_cdrlock_counter[31]_i_9_n_0\
    );
\rx_cdrlock_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(3),
      O => rx_cdrlock_counter(3)
    );
\rx_cdrlock_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(4),
      O => rx_cdrlock_counter(4)
    );
\rx_cdrlock_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(5),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter(5)
    );
\rx_cdrlock_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(6),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter(6)
    );
\rx_cdrlock_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(7),
      O => rx_cdrlock_counter(7)
    );
\rx_cdrlock_counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(8),
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlock_counter(8)
    );
\rx_cdrlock_counter[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I1 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_5_n_0\,
      I4 => data0(9),
      O => rx_cdrlock_counter(9)
    );
\rx_cdrlock_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \rx_cdrlock_counter[0]_i_1_n_0\,
      Q => \rx_cdrlock_counter_reg_n_0_[0]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(10),
      Q => \rx_cdrlock_counter_reg_n_0_[10]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(11),
      Q => \rx_cdrlock_counter_reg_n_0_[11]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(12),
      Q => \rx_cdrlock_counter_reg_n_0_[12]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(13),
      Q => \rx_cdrlock_counter_reg_n_0_[13]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(14),
      Q => \rx_cdrlock_counter_reg_n_0_[14]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(15),
      Q => \rx_cdrlock_counter_reg_n_0_[15]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(16),
      Q => \rx_cdrlock_counter_reg_n_0_[16]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(17),
      Q => \rx_cdrlock_counter_reg_n_0_[17]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(18),
      Q => \rx_cdrlock_counter_reg_n_0_[18]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(19),
      Q => \rx_cdrlock_counter_reg_n_0_[19]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(1),
      Q => \rx_cdrlock_counter_reg_n_0_[1]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(20),
      Q => \rx_cdrlock_counter_reg_n_0_[20]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(21),
      Q => \rx_cdrlock_counter_reg_n_0_[21]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(22),
      Q => \rx_cdrlock_counter_reg_n_0_[22]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(23),
      Q => \rx_cdrlock_counter_reg_n_0_[23]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(24),
      Q => \rx_cdrlock_counter_reg_n_0_[24]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(25),
      Q => \rx_cdrlock_counter_reg_n_0_[25]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(26),
      Q => \rx_cdrlock_counter_reg_n_0_[26]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(27),
      Q => \rx_cdrlock_counter_reg_n_0_[27]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(28),
      Q => \rx_cdrlock_counter_reg_n_0_[28]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(29),
      Q => \rx_cdrlock_counter_reg_n_0_[29]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(2),
      Q => \rx_cdrlock_counter_reg_n_0_[2]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(30),
      Q => \rx_cdrlock_counter_reg_n_0_[30]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(31),
      Q => \rx_cdrlock_counter_reg_n_0_[31]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(3),
      Q => \rx_cdrlock_counter_reg_n_0_[3]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(4),
      Q => \rx_cdrlock_counter_reg_n_0_[4]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(5),
      Q => \rx_cdrlock_counter_reg_n_0_[5]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(6),
      Q => \rx_cdrlock_counter_reg_n_0_[6]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(7),
      Q => \rx_cdrlock_counter_reg_n_0_[7]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(8),
      Q => \rx_cdrlock_counter_reg_n_0_[8]\,
      R => gt_rx_reset_i
    );
\rx_cdrlock_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlock_counter(9),
      Q => \rx_cdrlock_counter_reg_n_0_[9]\,
      R => gt_rx_reset_i
    );
rx_cdrlocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => rx_cdrlocked_reg_n_0,
      I1 => \rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => \rx_cdrlock_counter[31]_i_5_n_0\,
      O => rx_cdrlocked_i_1_n_0
    );
rx_cdrlocked_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => rx_cdrlocked_i_1_n_0,
      Q => rx_cdrlocked_reg_n_0,
      R => gt_rx_reset_i
    );
rxfsm_rxresetdone_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rxfsm_rxresetdone_r,
      Q => rxfsm_rxresetdone_r2,
      R => '0'
    );
rxfsm_rxresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => rxfsm_rxresetdone_r2,
      Q => \^rx_resetdone_out\,
      R => '0'
    );
rxfsm_rxresetdone_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gt0_rxresetdone_r3_reg_srl3_n_0,
      Q => rxfsm_rxresetdone_r,
      R => '0'
    );
rxfsm_soft_reset_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => link_reset_r2,
      I1 => gtrxreset_pulse,
      I2 => gt_rst_r_reg,
      O => rxfsm_soft_reset_r_i_1_n_0
    );
rxfsm_soft_reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => rxfsm_soft_reset_r_i_1_n_0,
      Q => rxfsm_soft_reset_r,
      R => '0'
    );
txfsm_txresetdone_r_reg: unisim.vcomponents.FDRE
     port map (
      C => gtrxreset_o_reg,
      CE => '1',
      D => gt0_txresetdone_r3_reg_srl3_n_0,
      Q => txfsm_txresetdone_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_core is
  port (
    soft_err : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    lane_up : out STD_LOGIC;
    m_axi_rx_snf : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    m_axi_rx_fc_nb : out STD_LOGIC_VECTOR ( 0 to 3 );
    tx_resetdone_out : out STD_LOGIC;
    drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    common_reset_i : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    s_axi_nfc_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    crc_valid : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_tlast : out STD_LOGIC;
    crc_pass_fail_n : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    gtrxreset_o_reg : in STD_LOGIC;
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    in0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    quad1_common_lock_out : in STD_LOGIC;
    gt_rst_r_reg : in STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_pll0outclk_out : in STD_LOGIC;
    gt0_pll0outrefclk_out : in STD_LOGIC;
    gt0_pll1outclk_out : in STD_LOGIC;
    gt0_pll1outrefclk_out : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    s_axi_nfc_req : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    drpen_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_core : entity is "merger_aurora_core";
end merger_aurora_merger_aurora_core;

architecture STRUCTURE of merger_aurora_merger_aurora_core is
  signal aurora_lane_0_i_n_31 : STD_LOGIC;
  signal aurora_lane_0_i_n_33 : STD_LOGIC;
  signal aurora_lane_0_i_n_34 : STD_LOGIC;
  signal aurora_lane_0_i_n_35 : STD_LOGIC;
  signal aurora_lane_0_i_n_36 : STD_LOGIC;
  signal aurora_lane_0_i_n_53 : STD_LOGIC;
  signal axi_to_ll_pdu_i_n_0 : STD_LOGIC;
  signal \channel_init_sm_i/wait_for_lane_up_r0\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal core_reset_logic_i_n_2 : STD_LOGIC;
  signal do_cc_i : STD_LOGIC;
  signal ena_comma_align_i : STD_LOGIC;
  signal \err_detect_i/bucket_full_r\ : STD_LOGIC;
  signal \err_detect_i/hard_err_flop_r0\ : STD_LOGIC;
  signal \err_detect_i/p_2_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal fc_nb_i : STD_LOGIC_VECTOR ( 0 to 3 );
  signal gen_a_i : STD_LOGIC;
  signal gen_cc_i : STD_LOGIC;
  signal gen_ecp_i : STD_LOGIC;
  signal gen_k_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal gen_pad_i : STD_LOGIC;
  signal gen_r_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal gen_scp_i : STD_LOGIC;
  signal gen_snf_i : STD_LOGIC;
  signal gen_v_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal got_v_i : STD_LOGIC;
  signal gt_wrapper_i_n_27 : STD_LOGIC;
  signal gt_wrapper_i_n_28 : STD_LOGIC;
  signal gt_wrapper_i_n_29 : STD_LOGIC;
  signal gt_wrapper_i_n_33 : STD_LOGIC;
  signal gt_wrapper_i_n_34 : STD_LOGIC;
  signal gt_wrapper_i_n_35 : STD_LOGIC;
  signal gt_wrapper_i_n_36 : STD_LOGIC;
  signal gt_wrapper_i_n_37 : STD_LOGIC;
  signal gt_wrapper_i_n_38 : STD_LOGIC;
  signal gt_wrapper_i_n_39 : STD_LOGIC;
  signal gt_wrapper_i_n_40 : STD_LOGIC;
  signal gt_wrapper_i_n_41 : STD_LOGIC;
  signal gt_wrapper_i_n_42 : STD_LOGIC;
  signal gt_wrapper_i_n_43 : STD_LOGIC;
  signal gt_wrapper_i_n_44 : STD_LOGIC;
  signal gt_wrapper_i_n_45 : STD_LOGIC;
  signal gt_wrapper_i_n_46 : STD_LOGIC;
  signal gt_wrapper_i_n_47 : STD_LOGIC;
  signal gt_wrapper_i_n_48 : STD_LOGIC;
  signal gt_wrapper_i_n_49 : STD_LOGIC;
  signal gt_wrapper_i_n_50 : STD_LOGIC;
  signal gt_wrapper_i_n_51 : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal hard_err_i : STD_LOGIC;
  signal hard_err_reset_i : STD_LOGIC;
  signal \lane_init_sm_i/ready_r_reg0\ : STD_LOGIC;
  signal \^lane_up\ : STD_LOGIC;
  signal \^link_reset_out\ : STD_LOGIC;
  signal link_reset_r : STD_LOGIC;
  signal \^m_axi_rx_fc_nb\ : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \^m_axi_rx_snf\ : STD_LOGIC;
  signal new_pkt_r : STD_LOGIC;
  signal \nfc_module_i/nfc_counter_r_reg\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC;
  signal rem_in0 : STD_LOGIC;
  signal reset_channel_i : STD_LOGIC;
  signal reset_lanes_i : STD_LOGIC;
  signal rx_char_is_comma_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_crc_i_n_1 : STD_LOGIC;
  signal rx_crc_i_n_10 : STD_LOGIC;
  signal rx_crc_i_n_11 : STD_LOGIC;
  signal rx_crc_i_n_4 : STD_LOGIC;
  signal rx_crc_i_n_5 : STD_LOGIC;
  signal rx_crc_i_n_6 : STD_LOGIC;
  signal rx_crc_i_n_7 : STD_LOGIC;
  signal rx_crc_i_n_8 : STD_LOGIC;
  signal rx_crc_i_n_9 : STD_LOGIC;
  signal rx_data_crc : STD_LOGIC_VECTOR ( 0 to 15 );
  signal rx_ecp_i : STD_LOGIC;
  signal rx_eof_crc : STD_LOGIC;
  signal rx_ll_i_n_42 : STD_LOGIC;
  signal rx_ll_i_n_7 : STD_LOGIC;
  signal \rx_ll_pdu_datapath_i/in_frame_r\ : STD_LOGIC;
  signal \rx_ll_pdu_datapath_i/storage_v_r\ : STD_LOGIC;
  signal rx_pad_i : STD_LOGIC;
  signal rx_pe_data_i : STD_LOGIC_VECTOR ( 0 to 15 );
  signal rx_pe_data_v_i : STD_LOGIC;
  signal rx_polarity_i : STD_LOGIC;
  signal rx_realign_i : STD_LOGIC;
  signal rx_rem_crc : STD_LOGIC;
  signal rx_scp_i : STD_LOGIC;
  signal rx_sof_crc : STD_LOGIC;
  signal rx_src_rdy_crc : STD_LOGIC;
  signal \^s_axi_nfc_tx_tready\ : STD_LOGIC;
  signal \^s_axi_tx_tready\ : STD_LOGIC;
  signal sof_ds_c : STD_LOGIC;
  signal \^sys_reset_out\ : STD_LOGIC;
  signal tx_char_is_k_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal tx_crc : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal tx_crc_i_n_8 : STD_LOGIC;
  signal tx_data_crc : STD_LOGIC_VECTOR ( 0 to 15 );
  signal tx_data_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal tx_dst_rdy_crc : STD_LOGIC;
  signal tx_eof_crc : STD_LOGIC;
  signal \tx_ll_control_i/data_eof_3_r\ : STD_LOGIC;
  signal \tx_ll_control_i/do_cc_r\ : STD_LOGIC;
  signal \tx_ll_control_i/do_eof_c__0\ : STD_LOGIC;
  signal \tx_ll_control_i/do_nfc_r\ : STD_LOGIC;
  signal \tx_ll_control_i/idle_r\ : STD_LOGIC;
  signal \tx_ll_control_i/next_sof_c\ : STD_LOGIC;
  signal \tx_ll_control_i/next_sof_data_eof_1_c\ : STD_LOGIC;
  signal \tx_ll_control_i/sof_data_eof_3_r\ : STD_LOGIC;
  signal \tx_ll_datapath_i/storage_pad_r0\ : STD_LOGIC;
  signal tx_ll_i_n_12 : STD_LOGIC;
  signal tx_pe_data_i : STD_LOGIC_VECTOR ( 0 to 15 );
  signal tx_pe_data_v_i : STD_LOGIC;
  signal tx_reset_i : STD_LOGIC;
  signal tx_sof_crc : STD_LOGIC;
  signal tx_src_rdy_crc : STD_LOGIC;
  signal wait_r : STD_LOGIC;
  signal warn_cc : STD_LOGIC;
begin
  lane_up <= \^lane_up\;
  link_reset_out <= \^link_reset_out\;
  m_axi_rx_fc_nb(0 to 3) <= \^m_axi_rx_fc_nb\(0 to 3);
  m_axi_rx_snf <= \^m_axi_rx_snf\;
  s_axi_nfc_tx_tready <= \^s_axi_nfc_tx_tready\;
  s_axi_tx_tready <= \^s_axi_tx_tready\;
  sys_reset_out <= \^sys_reset_out\;
aurora_lane_0_i: entity work.merger_aurora_merger_aurora_AURORA_LANE
     port map (
      CHANNEL_SOFT_ERR_reg => aurora_lane_0_i_n_53,
      D(15) => rx_pe_data_i(0),
      D(14) => rx_pe_data_i(1),
      D(13) => rx_pe_data_i(2),
      D(12) => rx_pe_data_i(3),
      D(11) => rx_pe_data_i(4),
      D(10) => rx_pe_data_i(5),
      D(9) => rx_pe_data_i(6),
      D(8) => rx_pe_data_i(7),
      D(7) => \^m_axi_rx_fc_nb\(0),
      D(6) => \^m_axi_rx_fc_nb\(1),
      D(5) => \^m_axi_rx_fc_nb\(2),
      D(4) => \^m_axi_rx_fc_nb\(3),
      D(3) => rx_pe_data_i(12),
      D(2) => rx_pe_data_i(13),
      D(1) => rx_pe_data_i(14),
      D(0) => rx_pe_data_i(15),
      \FC_NB_reg[0]\(3) => fc_nb_i(0),
      \FC_NB_reg[0]\(2) => fc_nb_i(1),
      \FC_NB_reg[0]\(1) => fc_nb_i(2),
      \FC_NB_reg[0]\(0) => fc_nb_i(3),
      Q(15) => tx_pe_data_i(0),
      Q(14) => tx_pe_data_i(1),
      Q(13) => tx_pe_data_i(2),
      Q(12) => tx_pe_data_i(3),
      Q(11) => tx_pe_data_i(4),
      Q(10) => tx_pe_data_i(5),
      Q(9) => tx_pe_data_i(6),
      Q(8) => tx_pe_data_i(7),
      Q(7) => tx_pe_data_i(8),
      Q(6) => tx_pe_data_i(9),
      Q(5) => tx_pe_data_i(10),
      Q(4) => tx_pe_data_i(11),
      Q(3) => tx_pe_data_i(12),
      Q(2) => tx_pe_data_i(13),
      Q(1) => tx_pe_data_i(14),
      Q(0) => tx_pe_data_i(15),
      RX_EOF_N_reg => aurora_lane_0_i_n_34,
      SR(0) => reset_lanes_i,
      TXCHARISK(1 downto 0) => tx_char_is_k_i(1 downto 0),
      TXDATA(15 downto 0) => tx_data_i(15 downto 0),
      ena_comma_align_i => ena_comma_align_i,
      gen_a_i => gen_a_i,
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_k_flop_0_i(1) => gen_k_i(0),
      gen_k_flop_0_i(0) => gen_k_i(1),
      gen_pad_i => gen_pad_i,
      gen_r_flop_0_i(1) => gen_r_i(0),
      gen_r_flop_0_i(0) => gen_r_i(1),
      gen_scp_i => gen_scp_i,
      gen_snf_i => gen_snf_i,
      gen_v_flop_0_i(1) => gen_v_i(0),
      gen_v_flop_0_i(0) => gen_v_i(1),
      got_v_i => got_v_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      gtrxreset_o_reg_0(1 downto 0) => rx_char_is_comma_i(1 downto 0),
      gtrxreset_o_reg_1(1 downto 0) => \err_detect_i/p_2_out\(1 downto 0),
      hard_err_flop_r0 => \err_detect_i/hard_err_flop_r0\,
      hard_err_flop_r_reg => \err_detect_i/bucket_full_r\,
      hard_err_i => hard_err_i,
      hard_err_reset_i => hard_err_reset_i,
      in_frame_r => \rx_ll_pdu_datapath_i/in_frame_r\,
      in_frame_r_reg => aurora_lane_0_i_n_35,
      init_clk_in => init_clk_in,
      lane_up => \^lane_up\,
      left_aligned_r_reg => aurora_lane_0_i_n_31,
      left_aligned_r_reg_0 => aurora_lane_0_i_n_33,
      left_aligned_r_reg_1 => gt_wrapper_i_n_27,
      left_aligned_r_reg_2 => gt_wrapper_i_n_28,
      left_aligned_r_reg_3 => gt_wrapper_i_n_49,
      left_aligned_r_reg_4(7) => gt_wrapper_i_n_33,
      left_aligned_r_reg_4(6) => gt_wrapper_i_n_34,
      left_aligned_r_reg_4(5) => gt_wrapper_i_n_35,
      left_aligned_r_reg_4(4) => gt_wrapper_i_n_36,
      left_aligned_r_reg_4(3) => gt_wrapper_i_n_37,
      left_aligned_r_reg_4(2) => gt_wrapper_i_n_38,
      left_aligned_r_reg_4(1) => gt_wrapper_i_n_39,
      left_aligned_r_reg_4(0) => gt_wrapper_i_n_40,
      left_aligned_r_reg_5(7) => gt_wrapper_i_n_41,
      left_aligned_r_reg_5(6) => gt_wrapper_i_n_42,
      left_aligned_r_reg_5(5) => gt_wrapper_i_n_43,
      left_aligned_r_reg_5(4) => gt_wrapper_i_n_44,
      left_aligned_r_reg_5(3) => gt_wrapper_i_n_45,
      left_aligned_r_reg_5(2) => gt_wrapper_i_n_46,
      left_aligned_r_reg_5(1) => gt_wrapper_i_n_47,
      left_aligned_r_reg_5(0) => gt_wrapper_i_n_48,
      link_reset_out => \^link_reset_out\,
      m_axi_rx_snf => \^m_axi_rx_snf\,
      ready_r_reg0 => \lane_init_sm_i/ready_r_reg0\,
      rst_r_reg => gt_wrapper_i_n_29,
      rx_ecp_i => rx_ecp_i,
      rx_pad_i => rx_pad_i,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rx_scp_i => rx_scp_i,
      storage_v_r => \rx_ll_pdu_datapath_i/storage_v_r\,
      storage_v_r_reg => aurora_lane_0_i_n_36,
      tx_pe_data_v_i => tx_pe_data_v_i,
      tx_reset_i => tx_reset_i
    );
axi_to_ll_pdu_i: entity work.merger_aurora_merger_aurora_AXI_TO_LL
     port map (
      \crcreg_reg[0]\ => axi_to_ll_pdu_i_n_0,
      gtrxreset_o_reg => gtrxreset_o_reg,
      new_pkt_r => new_pkt_r
    );
core_reset_logic_i: entity work.merger_aurora_merger_aurora_RESET_LOGIC
     port map (
      E(0) => core_reset_logic_i_n_2,
      SR(0) => \^sys_reset_out\,
      gtrxreset_o_reg => gtrxreset_o_reg,
      in0 => in0,
      init_clk_in => init_clk_in,
      link_reset_r => link_reset_r,
      quad1_common_lock_out => quad1_common_lock_out,
      reset_channel_i => reset_channel_i,
      rxfsm_rxresetdone_r3_reg => gt_wrapper_i_n_51,
      s_level_out_d3_reg => gt_wrapper_i_n_50,
      tx_dst_rdy_crc => tx_dst_rdy_crc,
      wait_for_lane_up_r0 => \channel_init_sm_i/wait_for_lane_up_r0\
    );
global_logic_i: entity work.merger_aurora_merger_aurora_GLOBAL_LOGIC
     port map (
      SR(0) => reset_lanes_i,
      SS(0) => clear,
      SYSTEM_RESET_reg(0) => \^sys_reset_out\,
      channel_up => channel_up,
      \count_reg[1]\ => \^s_axi_tx_tready\,
      gen_a_i => gen_a_i,
      \gen_k_r_reg[0]\(1) => gen_k_i(0),
      \gen_k_r_reg[0]\(0) => gen_k_i(1),
      \gen_r_r_reg[0]\(1) => gen_r_i(0),
      \gen_r_r_reg[0]\(0) => gen_r_i(1),
      \gen_v_r_reg[0]\(1) => gen_v_i(0),
      \gen_v_r_reg[0]\(0) => gen_v_i(1),
      got_v_i => got_v_i,
      gtrxreset_i => gtrxreset_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      hard_err => hard_err,
      hard_err_i => hard_err_i,
      hard_err_reset_i => hard_err_reset_i,
      lane_up => \^lane_up\,
      new_pkt_r => new_pkt_r,
      new_pkt_r_reg => axi_to_ll_pdu_i_n_0,
      p_0_in => p_0_in,
      power_down => power_down,
      ready_r_reg0 => \lane_init_sm_i/ready_r_reg0\,
      reset_channel_i => reset_channel_i,
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      soft_err => soft_err,
      \soft_err_r_reg[1]\ => aurora_lane_0_i_n_53,
      wait_for_lane_up_r0 => \channel_init_sm_i/wait_for_lane_up_r0\
    );
gt_wrapper_i: entity work.merger_aurora_merger_aurora_GT_WRAPPER
     port map (
      \RX_CHAR_IS_COMMA_R_reg[1]\(1 downto 0) => rx_char_is_comma_i(1 downto 0),
      TXCHARISK(1 downto 0) => tx_char_is_k_i(1 downto 0),
      TXDATA(15 downto 0) => tx_data_i(15 downto 0),
      bucket_full_r_reg => \err_detect_i/bucket_full_r\,
      common_reset_i => common_reset_i,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      ena_comma_align_i => ena_comma_align_i,
      first_v_received_r_reg => aurora_lane_0_i_n_33,
      gt0_pll0outclk_out => gt0_pll0outclk_out,
      gt0_pll0outrefclk_out => gt0_pll0outrefclk_out,
      gt0_pll1outclk_out => gt0_pll1outclk_out,
      gt0_pll1outrefclk_out => gt0_pll1outrefclk_out,
      gt_rst_r_reg => gt_rst_r_reg,
      gt_rxresetdone_r2_reg => gt_wrapper_i_n_51,
      gt_txresetdone_r2_reg => gt_wrapper_i_n_50,
      gtrxreset_i => gtrxreset_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      hard_err_flop_r0 => \err_detect_i/hard_err_flop_r0\,
      init_clk_in => init_clk_in,
      left_aligned_r_reg => gt_wrapper_i_n_49,
      left_aligned_r_reg_0 => aurora_lane_0_i_n_31,
      link_reset_out => \^link_reset_out\,
      link_reset_r => link_reset_r,
      loopback(2 downto 0) => loopback(2 downto 0),
      \out\ => tx_resetdone_out,
      power_down => power_down,
      quad1_common_lock_out => quad1_common_lock_out,
      reset_count_r_reg => gt_wrapper_i_n_29,
      rx_polarity_i => rx_polarity_i,
      rx_realign_i => rx_realign_i,
      rx_resetdone_out => rx_resetdone_out,
      rxn => rxn,
      rxp => rxp,
      \soft_err_r_reg[0]\(1 downto 0) => \err_detect_i/p_2_out\(1 downto 0),
      tx_out_clk => tx_out_clk,
      tx_reset_i => tx_reset_i,
      txn => txn,
      txp => txp,
      \word_aligned_control_bits_r_reg[0]\ => gt_wrapper_i_n_28,
      \word_aligned_control_bits_r_reg[1]\ => gt_wrapper_i_n_27,
      \word_aligned_data_r_reg[0]\(7) => gt_wrapper_i_n_41,
      \word_aligned_data_r_reg[0]\(6) => gt_wrapper_i_n_42,
      \word_aligned_data_r_reg[0]\(5) => gt_wrapper_i_n_43,
      \word_aligned_data_r_reg[0]\(4) => gt_wrapper_i_n_44,
      \word_aligned_data_r_reg[0]\(3) => gt_wrapper_i_n_45,
      \word_aligned_data_r_reg[0]\(2) => gt_wrapper_i_n_46,
      \word_aligned_data_r_reg[0]\(1) => gt_wrapper_i_n_47,
      \word_aligned_data_r_reg[0]\(0) => gt_wrapper_i_n_48,
      \word_aligned_data_r_reg[8]\(7) => gt_wrapper_i_n_33,
      \word_aligned_data_r_reg[8]\(6) => gt_wrapper_i_n_34,
      \word_aligned_data_r_reg[8]\(5) => gt_wrapper_i_n_35,
      \word_aligned_data_r_reg[8]\(4) => gt_wrapper_i_n_36,
      \word_aligned_data_r_reg[8]\(3) => gt_wrapper_i_n_37,
      \word_aligned_data_r_reg[8]\(2) => gt_wrapper_i_n_38,
      \word_aligned_data_r_reg[8]\(1) => gt_wrapper_i_n_39,
      \word_aligned_data_r_reg[8]\(0) => gt_wrapper_i_n_40
    );
hpcnt_reset_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_1
     port map (
      in0 => in0,
      init_clk_in => init_clk_in
    );
rx_crc_i: entity work.merger_aurora_merger_aurora_RX_CRC
     port map (
      D(15 downto 0) => tx_crc(15 downto 0),
      E(0) => rem_in0,
      Q(15) => rx_data_crc(0),
      Q(14) => rx_data_crc(1),
      Q(13) => rx_data_crc(2),
      Q(12) => rx_data_crc(3),
      Q(11) => rx_data_crc(4),
      Q(10) => rx_data_crc(5),
      Q(9) => rx_data_crc(6),
      Q(8) => rx_data_crc(7),
      Q(7) => rx_data_crc(8),
      Q(6) => rx_data_crc(9),
      Q(5) => rx_data_crc(10),
      Q(4) => rx_data_crc(11),
      Q(3) => rx_data_crc(12),
      Q(2) => rx_data_crc(13),
      Q(1) => rx_data_crc(14),
      Q(0) => rx_data_crc(15),
      \RX_REM_reg[0]\(0) => rx_ll_i_n_7,
      SOF_N_US_r_reg_0 => rx_crc_i_n_1,
      SR(0) => \^sys_reset_out\,
      \count_reg[0]_0\ => rx_ll_i_n_42,
      \crc_data_i_reg[0]\(7) => rx_crc_i_n_4,
      \crc_data_i_reg[0]\(6) => rx_crc_i_n_5,
      \crc_data_i_reg[0]\(5) => rx_crc_i_n_6,
      \crc_data_i_reg[0]\(4) => rx_crc_i_n_7,
      \crc_data_i_reg[0]\(3) => rx_crc_i_n_8,
      \crc_data_i_reg[0]\(2) => rx_crc_i_n_9,
      \crc_data_i_reg[0]\(1) => rx_crc_i_n_10,
      \crc_data_i_reg[0]\(0) => rx_crc_i_n_11,
      crc_pass_fail_n => crc_pass_fail_n,
      crc_valid => crc_valid,
      gtrxreset_o_reg => gtrxreset_o_reg,
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0) => m_axi_rx_tkeep(0),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      rx_eof_crc => rx_eof_crc,
      rx_rem_crc => rx_rem_crc,
      rx_sof_crc => rx_sof_crc,
      rx_src_rdy_crc => rx_src_rdy_crc,
      sof_ds_c => sof_ds_c,
      wait_r => wait_r
    );
rx_ll_i: entity work.merger_aurora_merger_aurora_RX_LL
     port map (
      D(15 downto 0) => tx_crc(15 downto 0),
      \DATA_US_r_reg[15]\(15) => rx_data_crc(0),
      \DATA_US_r_reg[15]\(14) => rx_data_crc(1),
      \DATA_US_r_reg[15]\(13) => rx_data_crc(2),
      \DATA_US_r_reg[15]\(12) => rx_data_crc(3),
      \DATA_US_r_reg[15]\(11) => rx_data_crc(4),
      \DATA_US_r_reg[15]\(10) => rx_data_crc(5),
      \DATA_US_r_reg[15]\(9) => rx_data_crc(6),
      \DATA_US_r_reg[15]\(8) => rx_data_crc(7),
      \DATA_US_r_reg[15]\(7) => rx_data_crc(8),
      \DATA_US_r_reg[15]\(6) => rx_data_crc(9),
      \DATA_US_r_reg[15]\(5) => rx_data_crc(10),
      \DATA_US_r_reg[15]\(4) => rx_data_crc(11),
      \DATA_US_r_reg[15]\(3) => rx_data_crc(12),
      \DATA_US_r_reg[15]\(2) => rx_data_crc(13),
      \DATA_US_r_reg[15]\(1) => rx_data_crc(14),
      \DATA_US_r_reg[15]\(0) => rx_data_crc(15),
      \DATA_US_r_reg[7]\(7) => rx_crc_i_n_4,
      \DATA_US_r_reg[7]\(6) => rx_crc_i_n_5,
      \DATA_US_r_reg[7]\(5) => rx_crc_i_n_6,
      \DATA_US_r_reg[7]\(4) => rx_crc_i_n_7,
      \DATA_US_r_reg[7]\(3) => rx_crc_i_n_8,
      \DATA_US_r_reg[7]\(2) => rx_crc_i_n_9,
      \DATA_US_r_reg[7]\(1) => rx_crc_i_n_10,
      \DATA_US_r_reg[7]\(0) => rx_crc_i_n_11,
      E(0) => rem_in0,
      Q(0) => \nfc_module_i/nfc_counter_r_reg\(0),
      RX_ECP_reg => aurora_lane_0_i_n_36,
      RX_ECP_reg_0 => aurora_lane_0_i_n_34,
      \RX_PE_DATA_reg[0]\(15) => rx_pe_data_i(0),
      \RX_PE_DATA_reg[0]\(14) => rx_pe_data_i(1),
      \RX_PE_DATA_reg[0]\(13) => rx_pe_data_i(2),
      \RX_PE_DATA_reg[0]\(12) => rx_pe_data_i(3),
      \RX_PE_DATA_reg[0]\(11) => rx_pe_data_i(4),
      \RX_PE_DATA_reg[0]\(10) => rx_pe_data_i(5),
      \RX_PE_DATA_reg[0]\(9) => rx_pe_data_i(6),
      \RX_PE_DATA_reg[0]\(8) => rx_pe_data_i(7),
      \RX_PE_DATA_reg[0]\(7) => \^m_axi_rx_fc_nb\(0),
      \RX_PE_DATA_reg[0]\(6) => \^m_axi_rx_fc_nb\(1),
      \RX_PE_DATA_reg[0]\(5) => \^m_axi_rx_fc_nb\(2),
      \RX_PE_DATA_reg[0]\(4) => \^m_axi_rx_fc_nb\(3),
      \RX_PE_DATA_reg[0]\(3) => rx_pe_data_i(12),
      \RX_PE_DATA_reg[0]\(2) => rx_pe_data_i(13),
      \RX_PE_DATA_reg[0]\(1) => rx_pe_data_i(14),
      \RX_PE_DATA_reg[0]\(0) => rx_pe_data_i(15),
      RX_SCP_reg => aurora_lane_0_i_n_35,
      SS(0) => clear,
      \count_reg[0]\ => rx_crc_i_n_1,
      \crc_data_i_reg[0]\(0) => rx_ll_i_n_7,
      data_width_reg => rx_ll_i_n_42,
      do_cc_r => \tx_ll_control_i/do_cc_r\,
      frame_err => frame_err,
      gtrxreset_o_reg => gtrxreset_o_reg,
      in_frame_r => \rx_ll_pdu_datapath_i/in_frame_r\,
      m_axi_rx_snf => \^m_axi_rx_snf\,
      rx_ecp_i => rx_ecp_i,
      rx_eof_crc => rx_eof_crc,
      rx_pad_i => rx_pad_i,
      rx_pe_data_v_i => rx_pe_data_v_i,
      rx_rem_crc => rx_rem_crc,
      rx_scp_i => rx_scp_i,
      rx_sof_crc => rx_sof_crc,
      rx_src_rdy_crc => rx_src_rdy_crc,
      sof_ds_c => sof_ds_c,
      storage_v_r => \rx_ll_pdu_datapath_i/storage_v_r\,
      tx_dst_rdy_crc => tx_dst_rdy_crc,
      wait_r => wait_r
    );
standard_cc_module_i: entity work.merger_aurora_merger_aurora_STANDARD_CC_MODULE
     port map (
      Q => do_cc_i,
      SR(0) => \^sys_reset_out\,
      do_nfc_r => \tx_ll_control_i/do_nfc_r\,
      do_nfc_r_reg => \^s_axi_nfc_tx_tready\,
      gtrxreset_o_reg => gtrxreset_o_reg,
      s_axi_nfc_req => s_axi_nfc_req,
      warn_cc => warn_cc
    );
tx_crc_i: entity work.merger_aurora_merger_aurora_TX_CRC
     port map (
      E(0) => core_reset_logic_i_n_2,
      Q(15) => tx_data_crc(0),
      Q(14) => tx_data_crc(1),
      Q(13) => tx_data_crc(2),
      Q(12) => tx_data_crc(3),
      Q(11) => tx_data_crc(4),
      Q(10) => tx_data_crc(5),
      Q(9) => tx_data_crc(6),
      Q(8) => tx_data_crc(7),
      Q(7) => tx_data_crc(8),
      Q(6) => tx_data_crc(9),
      Q(5) => tx_data_crc(10),
      Q(4) => tx_data_crc(11),
      Q(3) => tx_data_crc(12),
      Q(2) => tx_data_crc(13),
      Q(1) => tx_data_crc(14),
      Q(0) => tx_data_crc(15),
      SR(0) => \^sys_reset_out\,
      data_eof_3_r => \tx_ll_control_i/data_eof_3_r\,
      \do_eof_c__0\ => \tx_ll_control_i/do_eof_c__0\,
      gtrxreset_o_reg => gtrxreset_o_reg,
      idle_r => \tx_ll_control_i/idle_r\,
      in_frame_r_reg => tx_crc_i_n_8,
      in_frame_r_reg_0 => tx_ll_i_n_12,
      new_pkt_r_reg => axi_to_ll_pdu_i_n_0,
      next_sof_c => \tx_ll_control_i/next_sof_c\,
      next_sof_data_eof_1_c => \tx_ll_control_i/next_sof_data_eof_1_c\,
      p_0_in => p_0_in_0,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => \^s_axi_tx_tready\,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      sof_data_eof_3_r => \tx_ll_control_i/sof_data_eof_3_r\,
      storage_pad_r0 => \tx_ll_datapath_i/storage_pad_r0\,
      tx_dst_rdy_crc => tx_dst_rdy_crc,
      tx_eof_crc => tx_eof_crc,
      tx_sof_crc => tx_sof_crc,
      tx_src_rdy_crc => tx_src_rdy_crc
    );
tx_ll_i: entity work.merger_aurora_merger_aurora_TX_LL
     port map (
      D(15) => tx_data_crc(0),
      D(14) => tx_data_crc(1),
      D(13) => tx_data_crc(2),
      D(12) => tx_data_crc(3),
      D(11) => tx_data_crc(4),
      D(10) => tx_data_crc(5),
      D(9) => tx_data_crc(6),
      D(8) => tx_data_crc(7),
      D(7) => tx_data_crc(8),
      D(6) => tx_data_crc(9),
      D(5) => tx_data_crc(10),
      D(4) => tx_data_crc(11),
      D(3) => tx_data_crc(12),
      D(2) => tx_data_crc(13),
      D(1) => tx_data_crc(14),
      D(0) => tx_data_crc(15),
      EOF_N_DS_reg => tx_crc_i_n_8,
      Q => do_cc_i,
      data_eof_3_r => \tx_ll_control_i/data_eof_3_r\,
      do_cc_r => \tx_ll_control_i/do_cc_r\,
      \do_eof_c__0\ => \tx_ll_control_i/do_eof_c__0\,
      do_nfc_r => \tx_ll_control_i/do_nfc_r\,
      \fc_nb_r_reg[0]\(3) => fc_nb_i(0),
      \fc_nb_r_reg[0]\(2) => fc_nb_i(1),
      \fc_nb_r_reg[0]\(1) => fc_nb_i(2),
      \fc_nb_r_reg[0]\(0) => fc_nb_i(3),
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_pad_i => gen_pad_i,
      gen_scp_i => gen_scp_i,
      gen_snf_i => gen_snf_i,
      gtrxreset_o_reg => gtrxreset_o_reg,
      idle_r => \tx_ll_control_i/idle_r\,
      next_sof_c => \tx_ll_control_i/next_sof_c\,
      next_sof_data_eof_1_c => \tx_ll_control_i/next_sof_data_eof_1_c\,
      \nfc_counter_r_reg[0]\(0) => \nfc_module_i/nfc_counter_r_reg\(0),
      p_0_in => p_0_in_0,
      p_0_in_0 => p_0_in,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_nb(0 to 3),
      s_axi_nfc_req => s_axi_nfc_req,
      s_axi_nfc_tx_tready => \^s_axi_nfc_tx_tready\,
      sof_data_eof_3_r => \tx_ll_control_i/sof_data_eof_3_r\,
      storage_pad_r0 => \tx_ll_datapath_i/storage_pad_r0\,
      storage_v_r_reg => tx_ll_i_n_12,
      tx_dst_rdy_crc => tx_dst_rdy_crc,
      tx_eof_crc => tx_eof_crc,
      \tx_pe_data_r_reg[0]\(15) => tx_pe_data_i(0),
      \tx_pe_data_r_reg[0]\(14) => tx_pe_data_i(1),
      \tx_pe_data_r_reg[0]\(13) => tx_pe_data_i(2),
      \tx_pe_data_r_reg[0]\(12) => tx_pe_data_i(3),
      \tx_pe_data_r_reg[0]\(11) => tx_pe_data_i(4),
      \tx_pe_data_r_reg[0]\(10) => tx_pe_data_i(5),
      \tx_pe_data_r_reg[0]\(9) => tx_pe_data_i(6),
      \tx_pe_data_r_reg[0]\(8) => tx_pe_data_i(7),
      \tx_pe_data_r_reg[0]\(7) => tx_pe_data_i(8),
      \tx_pe_data_r_reg[0]\(6) => tx_pe_data_i(9),
      \tx_pe_data_r_reg[0]\(5) => tx_pe_data_i(10),
      \tx_pe_data_r_reg[0]\(4) => tx_pe_data_i(11),
      \tx_pe_data_r_reg[0]\(3) => tx_pe_data_i(12),
      \tx_pe_data_r_reg[0]\(2) => tx_pe_data_i(13),
      \tx_pe_data_r_reg[0]\(1) => tx_pe_data_i(14),
      \tx_pe_data_r_reg[0]\(0) => tx_pe_data_i(15),
      tx_pe_data_v_i => tx_pe_data_v_i,
      tx_sof_crc => tx_sof_crc,
      tx_src_rdy_crc => tx_src_rdy_crc,
      warn_cc => warn_cc
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora_merger_aurora_support is
  port (
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 1 );
    m_axi_rx_tvalid : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    s_axi_nfc_req : in STD_LOGIC;
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_nfc_ack : out STD_LOGIC;
    m_axi_rx_snf : out STD_LOGIC;
    m_axi_rx_fc_nb : out STD_LOGIC_VECTOR ( 0 to 3 );
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    gt_refclk1_p : in STD_LOGIC;
    gt_refclk1_n : in STD_LOGIC;
    gt_refclk1_out : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    lane_up : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    crc_pass_fail_n : out STD_LOGIC;
    crc_valid : out STD_LOGIC;
    user_clk_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    gt_reset : in STD_LOGIC;
    reset : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    drpen_in : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drprdy_out : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    gt0_pll0refclklost_out : out STD_LOGIC;
    quad1_common_lock_out : out STD_LOGIC;
    gt0_pll0outclk_out : out STD_LOGIC;
    gt0_pll1outclk_out : out STD_LOGIC;
    gt0_pll0outrefclk_out : out STD_LOGIC;
    gt0_pll1outrefclk_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of merger_aurora_merger_aurora_support : entity is "merger_aurora_support";
end merger_aurora_merger_aurora_support;

architecture STRUCTURE of merger_aurora_merger_aurora_support is
  signal \<const1>\ : STD_LOGIC;
  signal common_reset_i : STD_LOGIC;
  signal \^gt0_pll0outclk_out\ : STD_LOGIC;
  signal \^gt0_pll0outrefclk_out\ : STD_LOGIC;
  signal \^gt0_pll1outclk_out\ : STD_LOGIC;
  signal \^gt0_pll1outrefclk_out\ : STD_LOGIC;
  signal \^gt_refclk1_out\ : STD_LOGIC;
  signal \^gt_reset_out\ : STD_LOGIC;
  signal gt_reset_sync_init_clk : STD_LOGIC;
  signal \^m_axi_rx_tkeep\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^quad1_common_lock_out\ : STD_LOGIC;
  signal reset_sync_user_clk : STD_LOGIC;
  signal system_reset_i : STD_LOGIC;
  signal tx_out_clk_i : STD_LOGIC;
  signal \^user_clk_out\ : STD_LOGIC;
  signal NLW_IBUFDS_GTE2_CLK1_ODIV2_UNCONNECTED : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of IBUFDS_GTE2_CLK1 : label is "PRIMITIVE";
begin
  gt0_pll0outclk_out <= \^gt0_pll0outclk_out\;
  gt0_pll0outrefclk_out <= \^gt0_pll0outrefclk_out\;
  gt0_pll1outclk_out <= \^gt0_pll1outclk_out\;
  gt0_pll1outrefclk_out <= \^gt0_pll1outrefclk_out\;
  gt_refclk1_out <= \^gt_refclk1_out\;
  gt_reset_out <= \^gt_reset_out\;
  m_axi_rx_tkeep(0) <= \<const1>\;
  m_axi_rx_tkeep(1) <= \^m_axi_rx_tkeep\(1);
  quad1_common_lock_out <= \^quad1_common_lock_out\;
  sync_clk_out <= \^user_clk_out\;
  tx_lock <= \^quad1_common_lock_out\;
  user_clk_out <= \^user_clk_out\;
IBUFDS_GTE2_CLK1: unisim.vcomponents.IBUFDS_GTE2
    generic map(
      CLKCM_CFG => true,
      CLKRCV_TRST => true,
      CLKSWING_CFG => B"11"
    )
        port map (
      CEB => '0',
      I => gt_refclk1_p,
      IB => gt_refclk1_n,
      O => \^gt_refclk1_out\,
      ODIV2 => NLW_IBUFDS_GTE2_CLK1_ODIV2_UNCONNECTED
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
clock_module_i: entity work.merger_aurora_merger_aurora_CLOCK_MODULE
     port map (
      tx_out_clk => tx_out_clk_i,
      user_clk_out => \^user_clk_out\
    );
gt_common_support: entity work.merger_aurora_merger_aurora_gt_common_wrapper
     port map (
      common_reset_i => common_reset_i,
      gt0_pll0outclk_out => \^gt0_pll0outclk_out\,
      gt0_pll0outrefclk_out => \^gt0_pll0outrefclk_out\,
      gt0_pll0refclklost_out => gt0_pll0refclklost_out,
      gt0_pll1outclk_out => \^gt0_pll1outclk_out\,
      gt0_pll1outrefclk_out => \^gt0_pll1outrefclk_out\,
      gt_refclk1_n => \^gt_refclk1_out\,
      init_clk_in => init_clk_in,
      pll_not_locked_out => pll_not_locked_out,
      quad1_common_lock_out => \^quad1_common_lock_out\
    );
gt_reset_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync
     port map (
      D(0) => gt_reset_sync_init_clk,
      gt_reset => gt_reset,
      init_clk_in => init_clk_in
    );
merger_aurora_core_i: entity work.merger_aurora_merger_aurora_core
     port map (
      channel_up => channel_up,
      common_reset_i => common_reset_i,
      crc_pass_fail_n => crc_pass_fail_n,
      crc_valid => crc_valid,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      frame_err => frame_err,
      gt0_pll0outclk_out => \^gt0_pll0outclk_out\,
      gt0_pll0outrefclk_out => \^gt0_pll0outrefclk_out\,
      gt0_pll1outclk_out => \^gt0_pll1outclk_out\,
      gt0_pll1outrefclk_out => \^gt0_pll1outrefclk_out\,
      gt_rst_r_reg => \^gt_reset_out\,
      gtrxreset_o_reg => \^user_clk_out\,
      hard_err => hard_err,
      in0 => system_reset_i,
      init_clk_in => init_clk_in,
      lane_up => lane_up,
      link_reset_out => link_reset_out,
      loopback(2 downto 0) => loopback(2 downto 0),
      m_axi_rx_fc_nb(0 to 3) => m_axi_rx_fc_nb(0 to 3),
      m_axi_rx_snf => m_axi_rx_snf,
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0) => \^m_axi_rx_tkeep\(1),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      power_down => power_down,
      quad1_common_lock_out => \^quad1_common_lock_out\,
      rx_resetdone_out => rx_resetdone_out,
      rxn => rxn,
      rxp => rxp,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_nb(0 to 3),
      s_axi_nfc_req => s_axi_nfc_req,
      s_axi_nfc_tx_tready => s_axi_nfc_ack,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      soft_err => soft_err,
      sys_reset_out => sys_reset_out,
      tx_out_clk => tx_out_clk_i,
      tx_resetdone_out => tx_resetdone_out,
      txn => txn,
      txp => txp
    );
reset_sync_user_clk_cdc_sync: entity work.merger_aurora_merger_aurora_cdc_sync_0
     port map (
      D(0) => reset_sync_user_clk,
      gtrxreset_o_reg => \^user_clk_out\,
      reset => reset
    );
support_reset_logic_i: entity work.merger_aurora_merger_aurora_SUPPORT_RESET_LOGIC
     port map (
      D(0) => reset_sync_user_clk,
      gt_reset_out => \^gt_reset_out\,
      gtrxreset_o_reg => \^user_clk_out\,
      in0 => system_reset_i,
      init_clk_in => init_clk_in,
      s_level_out_d3_reg(0) => gt_reset_sync_init_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity merger_aurora is
  port (
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 15 );
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 1 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 15 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 1 );
    m_axi_rx_tvalid : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    s_axi_nfc_tx_tvalid : in STD_LOGIC;
    s_axi_nfc_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_nfc_tx_tready : out STD_LOGIC;
    m_axi_nfc_rx_tvalid : out STD_LOGIC;
    m_axi_nfc_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 3 );
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    gt_refclk1_p : in STD_LOGIC;
    gt_refclk1_n : in STD_LOGIC;
    gt_refclk1_out : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    lane_up : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    crc_pass_fail_n : out STD_LOGIC;
    crc_valid : out STD_LOGIC;
    user_clk_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    gt_reset : in STD_LOGIC;
    reset : in STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    drpclk_in : in STD_LOGIC;
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    drpen_in : in STD_LOGIC;
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drprdy_out : out STD_LOGIC;
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drpwe_in : in STD_LOGIC;
    gt0_pll0refclklost_out : out STD_LOGIC;
    quad1_common_lock_out : out STD_LOGIC;
    gt0_pll0outclk_out : out STD_LOGIC;
    gt0_pll1outclk_out : out STD_LOGIC;
    gt0_pll0outrefclk_out : out STD_LOGIC;
    gt0_pll1outrefclk_out : out STD_LOGIC;
    pll_not_locked_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of merger_aurora : entity is true;
end merger_aurora;

architecture STRUCTURE of merger_aurora is
begin
inst: entity work.merger_aurora_merger_aurora_support
     port map (
      channel_up => channel_up,
      crc_pass_fail_n => crc_pass_fail_n,
      crc_valid => crc_valid,
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in => drpclk_in,
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in => drpen_in,
      drprdy_out => drprdy_out,
      drpwe_in => drpwe_in,
      frame_err => frame_err,
      gt0_pll0outclk_out => gt0_pll0outclk_out,
      gt0_pll0outrefclk_out => gt0_pll0outrefclk_out,
      gt0_pll0refclklost_out => gt0_pll0refclklost_out,
      gt0_pll1outclk_out => gt0_pll1outclk_out,
      gt0_pll1outrefclk_out => gt0_pll1outrefclk_out,
      gt_refclk1_n => gt_refclk1_n,
      gt_refclk1_out => gt_refclk1_out,
      gt_refclk1_p => gt_refclk1_p,
      gt_reset => gt_reset,
      gt_reset_out => gt_reset_out,
      hard_err => hard_err,
      init_clk_in => init_clk_in,
      lane_up => lane_up,
      link_reset_out => link_reset_out,
      loopback(2 downto 0) => loopback(2 downto 0),
      m_axi_rx_fc_nb(0 to 3) => m_axi_nfc_rx_tdata(0 to 3),
      m_axi_rx_snf => m_axi_nfc_rx_tvalid,
      m_axi_rx_tdata(0 to 15) => m_axi_rx_tdata(0 to 15),
      m_axi_rx_tkeep(0 to 1) => m_axi_rx_tkeep(0 to 1),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      pll_not_locked_out => pll_not_locked_out,
      power_down => power_down,
      quad1_common_lock_out => quad1_common_lock_out,
      reset => reset,
      rx_resetdone_out => rx_resetdone_out,
      rxn => rxn,
      rxp => rxp,
      s_axi_nfc_ack => s_axi_nfc_tx_tready,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_tx_tdata(0 to 3),
      s_axi_nfc_req => s_axi_nfc_tx_tvalid,
      s_axi_tx_tdata(0 to 15) => s_axi_tx_tdata(0 to 15),
      s_axi_tx_tkeep(0 to 1) => s_axi_tx_tkeep(0 to 1),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      soft_err => soft_err,
      sync_clk_out => sync_clk_out,
      sys_reset_out => sys_reset_out,
      tx_lock => tx_lock,
      tx_resetdone_out => tx_resetdone_out,
      txn => txn,
      txp => txp,
      user_clk_out => user_clk_out
    );
end STRUCTURE;
