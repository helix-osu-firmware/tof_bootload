/*
 * == pblaze-cc ==
 * source : tof_controller_v2.c
 * create : Sat Jan  4 10:37:19 2020
 * modify : Sat Jan  4 10:37:19 2020
 */
`timescale 1 ps / 1ps

/* 
 * == pblaze-as ==
 * source : tof_controller_v2.s
 * create : Sat Jan  4 10:37:41 2020
 * modify : Sat Jan  4 10:37:41 2020
 */
/* 
 * == pblaze-ld ==
 * target : kcpsm3
 */

module tof_controller_v2 (address, instruction, clk);
input [9:0] address;
input clk;
output [17:0] instruction;

// Debugging symbols. Note that they're
// only 48 characters long max.
// synthesis translate_off

// allocate a bunch of space for the text
   reg [8*48-1:0] dbg_instr;
   always @(*) begin
     case(address)
         0 : dbg_instr = "boot                                           ";
         1 : dbg_instr = "loop                                           ";
         2 : dbg_instr = "loop+0x001                                     ";
         3 : dbg_instr = "loop+0x002                                     ";
         4 : dbg_instr = "control                                        ";
         5 : dbg_instr = "control+0x001                                  ";
         6 : dbg_instr = "control+0x002                                  ";
         7 : dbg_instr = "control+0x003                                  ";
         8 : dbg_instr = "control+0x004                                  ";
         9 : dbg_instr = "control+0x005                                  ";
         10 : dbg_instr = "control+0x006                                  ";
         11 : dbg_instr = "control+0x007                                  ";
         12 : dbg_instr = "control+0x008                                  ";
         13 : dbg_instr = "control+0x009                                  ";
         14 : dbg_instr = "control+0x00a                                  ";
         15 : dbg_instr = "control+0x00b                                  ";
         16 : dbg_instr = "control+0x00c                                  ";
         17 : dbg_instr = "control+0x00d                                  ";
         18 : dbg_instr = "control+0x00e                                  ";
         19 : dbg_instr = "control+0x00f                                  ";
         20 : dbg_instr = "control+0x010                                  ";
         21 : dbg_instr = "control+0x011                                  ";
         22 : dbg_instr = "control+0x012                                  ";
         23 : dbg_instr = "control+0x013                                  ";
         24 : dbg_instr = "control+0x014                                  ";
         25 : dbg_instr = "control+0x015                                  ";
         26 : dbg_instr = "control+0x016                                  ";
         27 : dbg_instr = "control+0x017                                  ";
         28 : dbg_instr = "control+0x018                                  ";
         29 : dbg_instr = "control+0x019                                  ";
         30 : dbg_instr = "control+0x01a                                  ";
         31 : dbg_instr = "control+0x01b                                  ";
         32 : dbg_instr = "control+0x01c                                  ";
         33 : dbg_instr = "control+0x01d                                  ";
         34 : dbg_instr = "I2C_delay_5us                                  ";
         35 : dbg_instr = "I2C_delay_4us                                  ";
         36 : dbg_instr = "I2C_delay_2us                                  ";
         37 : dbg_instr = "I2C_delay_1us                                  ";
         38 : dbg_instr = "I2C_delay_1us+0x001                            ";
         39 : dbg_instr = "I2C_delay_1us+0x002                            ";
         40 : dbg_instr = "I2C_delay_1us+0x003                            ";
         41 : dbg_instr = "toggle_xsel                                    ";
         42 : dbg_instr = "toggle_xsel+0x001                              ";
         43 : dbg_instr = "toggle_xsel+0x002                              ";
         44 : dbg_instr = "toggle_xsel+0x003                              ";
         45 : dbg_instr = "toggle_xsel+0x004                              ";
         46 : dbg_instr = "toggle_xsel+0x005                              ";
         47 : dbg_instr = "gpio_read_input                                ";
         48 : dbg_instr = "gpio_read_input+0x001                          ";
         49 : dbg_instr = "gpio_read_input+0x002                          ";
         50 : dbg_instr = "gpio_read_input+0x003                          ";
         51 : dbg_instr = "monitor_temp_read                              ";
         52 : dbg_instr = "monitor_temp_read+0x001                        ";
         53 : dbg_instr = "monitor_temp_read+0x002                        ";
         54 : dbg_instr = "monitor_temp_read+0x003                        ";
         55 : dbg_instr = "monitor_temp_read+0x004                        ";
         56 : dbg_instr = "monitor_temp_read+0x005                        ";
         57 : dbg_instr = "monitor_temp_read+0x006                        ";
         58 : dbg_instr = "monitor_temp_read+0x007                        ";
         59 : dbg_instr = "monitor_temp_read+0x008                        ";
         60 : dbg_instr = "monitor_temp_read+0x009                        ";
         61 : dbg_instr = "I2C_reg_write                                  ";
         62 : dbg_instr = "I2C_reg_write+0x001                            ";
         63 : dbg_instr = "I2C_reg_write+0x002                            ";
         64 : dbg_instr = "I2C_reg_write+0x003                            ";
         65 : dbg_instr = "I2C_reg_write+0x004                            ";
         66 : dbg_instr = "I2C_write_bytes_process                        ";
         67 : dbg_instr = "I2C_write_bytes_process+0x001                  ";
         68 : dbg_instr = "I2C_write_bytes_process+0x002                  ";
         69 : dbg_instr = "I2C_write_bytes_process+0x003                  ";
         70 : dbg_instr = "I2C_write_bytes_process+0x004                  ";
         71 : dbg_instr = "I2C_write_bytes_process_failure                ";
         72 : dbg_instr = "I2C_write_bytes_process_failure+0x001          ";
         73 : dbg_instr = "I2C_write_bytes_process_failure+0x002          ";
         74 : dbg_instr = "I2C_clk_Low                                    ";
         75 : dbg_instr = "I2C_clk_Low+0x001                              ";
         76 : dbg_instr = "I2C_clk_Low+0x002                              ";
         77 : dbg_instr = "I2C_Rx_ACK                                     ";
         78 : dbg_instr = "I2C_Rx_ACK+0x001                               ";
         79 : dbg_instr = "I2C_Rx_ACK+0x002                               ";
         80 : dbg_instr = "monitor_tick                                   ";
         81 : dbg_instr = "monitor_tick+0x001                             ";
         82 : dbg_instr = "monitor_tick+0x002                             ";
         83 : dbg_instr = "monitor_tick+0x003                             ";
         84 : dbg_instr = "monitor_tick+0x004                             ";
         85 : dbg_instr = "monitor_tick+0x005                             ";
         86 : dbg_instr = "monitor_tick+0x006                             ";
         87 : dbg_instr = "monitor_tick+0x007                             ";
         88 : dbg_instr = "monitor_tick+0x008                             ";
         89 : dbg_instr = "monitor_tick+0x009                             ";
         90 : dbg_instr = "monitor_tick+0x00a                             ";
         91 : dbg_instr = "monitor_tick+0x00b                             ";
         92 : dbg_instr = "monitor_tick+0x00c                             ";
         93 : dbg_instr = "monitor_tick+0x00d                             ";
         94 : dbg_instr = "monitor_tick+0x00e                             ";
         95 : dbg_instr = "monitor_tick+0x00f                             ";
         96 : dbg_instr = "monitor_tick+0x010                             ";
         97 : dbg_instr = "monitor_tick+0x011                             ";
         98 : dbg_instr = "monitor_tick+0x012                             ";
         99 : dbg_instr = "I2C_Tx_NACK                                    ";
         100 : dbg_instr = "I2C_Tx_NACK+0x001                              ";
         101 : dbg_instr = "I2C_Tx_ACK                                     ";
         102 : dbg_instr = "I2C_clk_pulse                                  ";
         103 : dbg_instr = "I2C_clk_pulse+0x001                            ";
         104 : dbg_instr = "I2C_clk_pulse+0x002                            ";
         105 : dbg_instr = "I2C_clk_pulse+0x003                            ";
         106 : dbg_instr = "I2C_clk_pulse+0x004                            ";
         107 : dbg_instr = "dac_convert_address                            ";
         108 : dbg_instr = "dac_convert_address+0x001                      ";
         109 : dbg_instr = "dac_convert_address+0x002                      ";
         110 : dbg_instr = "dac_convert_address+0x003                      ";
         111 : dbg_instr = "dac_convert_address+0x004                      ";
         112 : dbg_instr = "dac_convert_address+0x005                      ";
         113 : dbg_instr = "dac_convert_address+0x006                      ";
         114 : dbg_instr = "dac_convert_address+0x007                      ";
         115 : dbg_instr = "dac_convert_address+0x008                      ";
         116 : dbg_instr = "dac_convert_address+0x009                      ";
         117 : dbg_instr = "dac_convert_address+0x00a                      ";
         118 : dbg_instr = "dac_convert_address+0x00b                      ";
         119 : dbg_instr = "dac_convert_address+0x00c                      ";
         120 : dbg_instr = "dac_convert_address+0x00d                      ";
         121 : dbg_instr = "dac_convert_address+0x00e                      ";
         122 : dbg_instr = "dac_convert_address+0x00f                      ";
         123 : dbg_instr = "dac_convert_address+0x010                      ";
         124 : dbg_instr = "dac_convert_address+0x011                      ";
         125 : dbg_instr = "dac_convert_address+0x012                      ";
         126 : dbg_instr = "dac_convert_address+0x013                      ";
         127 : dbg_instr = "gpio1_read_input                               ";
         128 : dbg_instr = "gpio1_read_input+0x001                         ";
         129 : dbg_instr = "gpio1_read_input+0x002                         ";
         130 : dbg_instr = "I2C_update_read_reg_turnaround                 ";
         131 : dbg_instr = "I2C_update_read_reg_turnaround+0x001           ";
         132 : dbg_instr = "I2C_update_read_reg_turnaround+0x002           ";
         133 : dbg_instr = "I2C_update_read_reg_turnaround+0x003           ";
         134 : dbg_instr = "I2C_update_read_reg_turnaround+0x004           ";
         135 : dbg_instr = "I2C_update_read_reg_turnaround+0x005           ";
         136 : dbg_instr = "I2C_update_read_reg_turnaround+0x006           ";
         137 : dbg_instr = "I2C_update_read_reg_turnaround+0x007           ";
         138 : dbg_instr = "I2C_update_read_reg_turnaround+0x008           ";
         139 : dbg_instr = "gpio1_write                                    ";
         140 : dbg_instr = "gpio1_write+0x001                              ";
         141 : dbg_instr = "gpio1_write+0x002                              ";
         142 : dbg_instr = "gpio_init                                      ";
         143 : dbg_instr = "gpio_init+0x001                                ";
         144 : dbg_instr = "gpio_init+0x002                                ";
         145 : dbg_instr = "gpio_init+0x003                                ";
         146 : dbg_instr = "gpio_init+0x004                                ";
         147 : dbg_instr = "gpio_init+0x005                                ";
         148 : dbg_instr = "gpio_init+0x006                                ";
         149 : dbg_instr = "gpio0_write                                    ";
         150 : dbg_instr = "gpio0_write+0x001                              ";
         151 : dbg_instr = "gpio0_write+0x002                              ";
         152 : dbg_instr = "monitor                                        ";
         153 : dbg_instr = "monitor+0x001                                  ";
         154 : dbg_instr = "monitor+0x002                                  ";
         155 : dbg_instr = "monitor+0x003                                  ";
         156 : dbg_instr = "monitor+0x004                                  ";
         157 : dbg_instr = "monitor+0x005                                  ";
         158 : dbg_instr = "monitor+0x006                                  ";
         159 : dbg_instr = "monitor+0x007                                  ";
         160 : dbg_instr = "monitor+0x008                                  ";
         161 : dbg_instr = "monitor+0x009                                  ";
         162 : dbg_instr = "monitor+0x00a                                  ";
         163 : dbg_instr = "monitor+0x00b                                  ";
         164 : dbg_instr = "monitor+0x00c                                  ";
         165 : dbg_instr = "monitor+0x00d                                  ";
         166 : dbg_instr = "monitor+0x00e                                  ";
         167 : dbg_instr = "monitor+0x00f                                  ";
         168 : dbg_instr = "monitor+0x010                                  ";
         169 : dbg_instr = "monitor+0x011                                  ";
         170 : dbg_instr = "monitor+0x012                                  ";
         171 : dbg_instr = "monitor+0x013                                  ";
         172 : dbg_instr = "monitor+0x014                                  ";
         173 : dbg_instr = "monitor+0x015                                  ";
         174 : dbg_instr = "monitor+0x016                                  ";
         175 : dbg_instr = "monitor+0x017                                  ";
         176 : dbg_instr = "monitor+0x018                                  ";
         177 : dbg_instr = "monitor+0x019                                  ";
         178 : dbg_instr = "monitor+0x01a                                  ";
         179 : dbg_instr = "monitor+0x01b                                  ";
         180 : dbg_instr = "monitor+0x01c                                  ";
         181 : dbg_instr = "monitor+0x01d                                  ";
         182 : dbg_instr = "monitor+0x01e                                  ";
         183 : dbg_instr = "monitor+0x01f                                  ";
         184 : dbg_instr = "monitor+0x020                                  ";
         185 : dbg_instr = "monitor+0x021                                  ";
         186 : dbg_instr = "monitor+0x022                                  ";
         187 : dbg_instr = "monitor+0x023                                  ";
         188 : dbg_instr = "monitor+0x024                                  ";
         189 : dbg_instr = "monitor+0x025                                  ";
         190 : dbg_instr = "monitor+0x026                                  ";
         191 : dbg_instr = "monitor+0x027                                  ";
         192 : dbg_instr = "monitor+0x028                                  ";
         193 : dbg_instr = "monitor+0x029                                  ";
         194 : dbg_instr = "monitor+0x02a                                  ";
         195 : dbg_instr = "monitor+0x02b                                  ";
         196 : dbg_instr = "monitor+0x02c                                  ";
         197 : dbg_instr = "monitor+0x02d                                  ";
         198 : dbg_instr = "monitor+0x02e                                  ";
         199 : dbg_instr = "monitor+0x02f                                  ";
         200 : dbg_instr = "monitor+0x030                                  ";
         201 : dbg_instr = "monitor+0x031                                  ";
         202 : dbg_instr = "monitor+0x032                                  ";
         203 : dbg_instr = "monitor+0x033                                  ";
         204 : dbg_instr = "monitor+0x034                                  ";
         205 : dbg_instr = "monitor+0x035                                  ";
         206 : dbg_instr = "monitor+0x036                                  ";
         207 : dbg_instr = "monitor+0x037                                  ";
         208 : dbg_instr = "monitor+0x038                                  ";
         209 : dbg_instr = "monitor+0x039                                  ";
         210 : dbg_instr = "monitor+0x03a                                  ";
         211 : dbg_instr = "monitor+0x03b                                  ";
         212 : dbg_instr = "monitor+0x03c                                  ";
         213 : dbg_instr = "monitor+0x03d                                  ";
         214 : dbg_instr = "monitor_finish                                 ";
         215 : dbg_instr = "monitor_finish+0x001                           ";
         216 : dbg_instr = "monitor_finish+0x002                           ";
         217 : dbg_instr = "switch_set                                     ";
         218 : dbg_instr = "switch_set+0x001                               ";
         219 : dbg_instr = "switch_set+0x002                               ";
         220 : dbg_instr = "switch_set+0x003                               ";
         221 : dbg_instr = "switch_set+0x004                               ";
         222 : dbg_instr = "switch_set+0x005                               ";
         223 : dbg_instr = "switch_set+0x006                               ";
         224 : dbg_instr = "switch_set+0x007                               ";
         225 : dbg_instr = "switch_set+0x008                               ";
         226 : dbg_instr = "switch_set+0x009                               ";
         227 : dbg_instr = "switch_set+0x00a                               ";
         228 : dbg_instr = "switch_set+0x00b                               ";
         229 : dbg_instr = "switch_set+0x00c                               ";
         230 : dbg_instr = "switch_set+0x00d                               ";
         231 : dbg_instr = "I2C_write_bytes                                ";
         232 : dbg_instr = "I2C_write_bytes+0x001                          ";
         233 : dbg_instr = "I2C_write_bytes+0x002                          ";
         234 : dbg_instr = "I2C_write_bytes+0x003                          ";
         235 : dbg_instr = "I2C_write_bytes+0x004                          ";
         236 : dbg_instr = "init                                           ";
         237 : dbg_instr = "init+0x001                                     ";
         238 : dbg_instr = "init+0x002                                     ";
         239 : dbg_instr = "init+0x003                                     ";
         240 : dbg_instr = "init+0x004                                     ";
         241 : dbg_instr = "init+0x005                                     ";
         242 : dbg_instr = "init+0x006                                     ";
         243 : dbg_instr = "init+0x007                                     ";
         244 : dbg_instr = "init+0x008                                     ";
         245 : dbg_instr = "init+0x009                                     ";
         246 : dbg_instr = "init+0x00a                                     ";
         247 : dbg_instr = "init+0x00b                                     ";
         248 : dbg_instr = "init+0x00c                                     ";
         249 : dbg_instr = "init+0x00d                                     ";
         250 : dbg_instr = "init+0x00e                                     ";
         251 : dbg_instr = "init+0x00f                                     ";
         252 : dbg_instr = "init+0x010                                     ";
         253 : dbg_instr = "init+0x011                                     ";
         254 : dbg_instr = "init+0x012                                     ";
         255 : dbg_instr = "init+0x013                                     ";
         256 : dbg_instr = "init+0x014                                     ";
         257 : dbg_instr = "init+0x015                                     ";
         258 : dbg_instr = "init+0x016                                     ";
         259 : dbg_instr = "init+0x017                                     ";
         260 : dbg_instr = "init+0x018                                     ";
         261 : dbg_instr = "init+0x019                                     ";
         262 : dbg_instr = "init+0x01a                                     ";
         263 : dbg_instr = "init+0x01b                                     ";
         264 : dbg_instr = "init+0x01c                                     ";
         265 : dbg_instr = "init+0x01d                                     ";
         266 : dbg_instr = "init+0x01e                                     ";
         267 : dbg_instr = "init+0x01f                                     ";
         268 : dbg_instr = "init+0x020                                     ";
         269 : dbg_instr = "init+0x021                                     ";
         270 : dbg_instr = "init+0x022                                     ";
         271 : dbg_instr = "init+0x023                                     ";
         272 : dbg_instr = "init+0x024                                     ";
         273 : dbg_instr = "init+0x025                                     ";
         274 : dbg_instr = "init+0x026                                     ";
         275 : dbg_instr = "gpio_write                                     ";
         276 : dbg_instr = "gpio_write+0x001                               ";
         277 : dbg_instr = "gpio_write+0x002                               ";
         278 : dbg_instr = "spi_stop                                       ";
         279 : dbg_instr = "spi_stop+0x001                                 ";
         280 : dbg_instr = "spi_stop+0x002                                 ";
         281 : dbg_instr = "monitor_normalextend_read                      ";
         282 : dbg_instr = "monitor_normalextend_read+0x001                ";
         283 : dbg_instr = "monitor_normalextend_read+0x002                ";
         284 : dbg_instr = "monitor_normalextend_read+0x003                ";
         285 : dbg_instr = "monitor_normalextend_read+0x004                ";
         286 : dbg_instr = "monitor_normalextend_read+0x005                ";
         287 : dbg_instr = "monitor_normalextend_read+0x006                ";
         288 : dbg_instr = "monitor_normalextend_read+0x007                ";
         289 : dbg_instr = "monitor_normalextend_read+0x008                ";
         290 : dbg_instr = "monitor_normalextend_read+0x009                ";
         291 : dbg_instr = "monitor_normalextend_read+0x00a                ";
         292 : dbg_instr = "monitor_normalextend_read+0x00b                ";
         293 : dbg_instr = "I2C_Tx_byte_and_Rx_ACK                         ";
         294 : dbg_instr = "I2C_Tx_byte_and_Rx_ACK+0x001                   ";
         295 : dbg_instr = "I2C_Tx_byte_and_Rx_ACK+0x002                   ";
         296 : dbg_instr = "I2C_reg_read16                                 ";
         297 : dbg_instr = "I2C_reg_read16+0x001                           ";
         298 : dbg_instr = "I2C_reg_read16+0x002                           ";
         299 : dbg_instr = "I2C_read_two_bytes                             ";
         300 : dbg_instr = "I2C_read_two_bytes+0x001                       ";
         301 : dbg_instr = "I2C_read_two_bytes+0x002                       ";
         302 : dbg_instr = "I2C_read_two_bytes+0x003                       ";
         303 : dbg_instr = "I2C_read_two_bytes+0x004                       ";
         304 : dbg_instr = "I2C_read_two_bytes+0x005                       ";
         305 : dbg_instr = "I2C_read_two_bytes+0x006                       ";
         306 : dbg_instr = "I2C_read_two_bytes+0x007                       ";
         307 : dbg_instr = "I2C_read_two_bytes+0x008                       ";
         308 : dbg_instr = "I2C_reg_read16_failure                         ";
         309 : dbg_instr = "I2C_reg_read16_failure+0x001                   ";
         310 : dbg_instr = "I2C_reg_read16_finish                          ";
         311 : dbg_instr = "I2C_reg_read16_finish+0x001                    ";
         312 : dbg_instr = "monitor_pmon_read                              ";
         313 : dbg_instr = "monitor_pmon_read+0x001                        ";
         314 : dbg_instr = "monitor_pmon_read+0x002                        ";
         315 : dbg_instr = "monitor_pmon_read+0x003                        ";
         316 : dbg_instr = "monitor_pmon_read+0x004                        ";
         317 : dbg_instr = "monitor_pmon_read+0x005                        ";
         318 : dbg_instr = "monitor_pmon_read+0x006                        ";
         319 : dbg_instr = "monitor_pmon_read+0x007                        ";
         320 : dbg_instr = "monitor_pmon_read+0x008                        ";
         321 : dbg_instr = "monitor_pmon_read+0x009                        ";
         322 : dbg_instr = "monitor_pmon_read+0x00a                        ";
         323 : dbg_instr = "monitor_pmon_read+0x00b                        ";
         324 : dbg_instr = "push3                                          ";
         325 : dbg_instr = "push3+0x001                                    ";
         326 : dbg_instr = "push2                                          ";
         327 : dbg_instr = "push2+0x001                                    ";
         328 : dbg_instr = "push1                                          ";
         329 : dbg_instr = "push1+0x001                                    ";
         330 : dbg_instr = "push1+0x002                                    ";
         331 : dbg_instr = "gpio0_read_input                               ";
         332 : dbg_instr = "gpio0_read_input+0x001                         ";
         333 : dbg_instr = "gpio0_read_input+0x002                         ";
         334 : dbg_instr = "gpio1_write_output                             ";
         335 : dbg_instr = "gpio1_write_output+0x001                       ";
         336 : dbg_instr = "gpio1_write_output+0x002                       ";
         337 : dbg_instr = "gpio_write_output                              ";
         338 : dbg_instr = "gpio_write_output+0x001                        ";
         339 : dbg_instr = "gpio_write_output+0x002                        ";
         340 : dbg_instr = "switch_calc_address                            ";
         341 : dbg_instr = "switch_calc_address+0x001                      ";
         342 : dbg_instr = "switch_calc_address+0x002                      ";
         343 : dbg_instr = "switch_calc_address+0x003                      ";
         344 : dbg_instr = "switch_calc_address+0x004                      ";
         345 : dbg_instr = "monitor_init                                   ";
         346 : dbg_instr = "monitor_init+0x001                             ";
         347 : dbg_instr = "monitor_init+0x002                             ";
         348 : dbg_instr = "monitor_init+0x003                             ";
         349 : dbg_instr = "monitor_init+0x004                             ";
         350 : dbg_instr = "monitor_init+0x005                             ";
         351 : dbg_instr = "monitor_init+0x006                             ";
         352 : dbg_instr = "monitor_init+0x007                             ";
         353 : dbg_instr = "monitor_init+0x008                             ";
         354 : dbg_instr = "I2C_start                                      ";
         355 : dbg_instr = "I2C_start+0x001                                ";
         356 : dbg_instr = "I2C_start+0x002                                ";
         357 : dbg_instr = "I2C_start+0x003                                ";
         358 : dbg_instr = "I2C_start+0x004                                ";
         359 : dbg_instr = "I2C_start+0x005                                ";
         360 : dbg_instr = "I2C_start+0x006                                ";
         361 : dbg_instr = "pop3                                           ";
         362 : dbg_instr = "pop3+0x001                                     ";
         363 : dbg_instr = "pop3+0x002                                     ";
         364 : dbg_instr = "pop3+0x003                                     ";
         365 : dbg_instr = "pop2                                           ";
         366 : dbg_instr = "pop2+0x001                                     ";
         367 : dbg_instr = "pop2+0x002                                     ";
         368 : dbg_instr = "pop2+0x003                                     ";
         369 : dbg_instr = "pop1                                           ";
         370 : dbg_instr = "pop1+0x001                                     ";
         371 : dbg_instr = "pop1+0x002                                     ";
         372 : dbg_instr = "gpio0_write_output                             ";
         373 : dbg_instr = "gpio0_write_output+0x001                       ";
         374 : dbg_instr = "gpio0_write_output+0x002                       ";
         375 : dbg_instr = "I2C_clk_Z                                      ";
         376 : dbg_instr = "I2C_clk_Z+0x001                                ";
         377 : dbg_instr = "I2C_clk_Z+0x002                                ";
         378 : dbg_instr = "I2C_clk_Z+0x003                                ";
         379 : dbg_instr = "I2C_clk_Z+0x004                                ";
         380 : dbg_instr = "monitor_reset                                  ";
         381 : dbg_instr = "monitor_reset+0x001                            ";
         382 : dbg_instr = "monitor_reset+0x002                            ";
         383 : dbg_instr = "monitor_reset+0x003                            ";
         384 : dbg_instr = "monitor_reset+0x004                            ";
         385 : dbg_instr = "monitor_reset+0x005                            ";
         386 : dbg_instr = "monitor_reset+0x006                            ";
         387 : dbg_instr = "monitor_sync_check                             ";
         388 : dbg_instr = "monitor_sync_check+0x001                       ";
         389 : dbg_instr = "monitor_sync_check+0x002                       ";
         390 : dbg_instr = "monitor_sync_check+0x003                       ";
         391 : dbg_instr = "monitor_sync_check+0x004                       ";
         392 : dbg_instr = "monitor_sync_check+0x005                       ";
         393 : dbg_instr = "monitor_sync_check+0x006                       ";
         394 : dbg_instr = "monitor_sync_check+0x007                       ";
         395 : dbg_instr = "I2C_stop                                       ";
         396 : dbg_instr = "I2C_stop+0x001                                 ";
         397 : dbg_instr = "I2C_stop+0x002                                 ";
         398 : dbg_instr = "I2C_stop+0x003                                 ";
         399 : dbg_instr = "I2C_stop+0x004                                 ";
         400 : dbg_instr = "I2C_stop+0x005                                 ";
         401 : dbg_instr = "dac_write                                      ";
         402 : dbg_instr = "dac_write+0x001                                ";
         403 : dbg_instr = "dac_write+0x002                                ";
         404 : dbg_instr = "dac_write+0x003                                ";
         405 : dbg_instr = "dac_write+0x004                                ";
         406 : dbg_instr = "dac_write+0x005                                ";
         407 : dbg_instr = "dac_write+0x006                                ";
         408 : dbg_instr = "dac_write+0x007                                ";
         409 : dbg_instr = "dac_write+0x008                                ";
         410 : dbg_instr = "dac_write+0x009                                ";
         411 : dbg_instr = "dac_write+0x00a                                ";
         412 : dbg_instr = "dac_write+0x00b                                ";
         413 : dbg_instr = "dac_write+0x00c                                ";
         414 : dbg_instr = "dac_write+0x00d                                ";
         415 : dbg_instr = "dac_write+0x00e                                ";
         416 : dbg_instr = "dac_write+0x00f                                ";
         417 : dbg_instr = "dac_write+0x010                                ";
         418 : dbg_instr = "I2C_Rx_bit                                     ";
         419 : dbg_instr = "I2C_Rx_bit+0x001                               ";
         420 : dbg_instr = "I2C_Rx_bit+0x002                               ";
         421 : dbg_instr = "I2C_Rx_bit+0x003                               ";
         422 : dbg_instr = "I2C_Rx_bit+0x004                               ";
         423 : dbg_instr = "I2C_Rx_bit+0x005                               ";
         424 : dbg_instr = "I2C_Rx_bit+0x006                               ";
         425 : dbg_instr = "I2C_Rx_bit+0x007                               ";
         426 : dbg_instr = "I2C_Rx_bit+0x008                               ";
         427 : dbg_instr = "I2C_Rx_bit+0x009                               ";
         428 : dbg_instr = "monitor_output                                 ";
         429 : dbg_instr = "monitor_output+0x001                           ";
         430 : dbg_instr = "monitor_output+0x002                           ";
         431 : dbg_instr = "monitor_output+0x003                           ";
         432 : dbg_instr = "monitor_output+0x004                           ";
         433 : dbg_instr = "monitor_output+0x005                           ";
         434 : dbg_instr = "spi_begin                                      ";
         435 : dbg_instr = "spi_begin+0x001                                ";
         436 : dbg_instr = "spi_begin+0x002                                ";
         437 : dbg_instr = "I2C_reg_read                                   ";
         438 : dbg_instr = "I2C_reg_read+0x001                             ";
         439 : dbg_instr = "I2C_reg_read+0x002                             ";
         440 : dbg_instr = "I2C_read_one_byte                              ";
         441 : dbg_instr = "I2C_read_one_byte+0x001                        ";
         442 : dbg_instr = "I2C_read_one_byte+0x002                        ";
         443 : dbg_instr = "I2C_read_one_byte+0x003                        ";
         444 : dbg_instr = "I2C_reg_read_failure                           ";
         445 : dbg_instr = "I2C_reg_read_finish                            ";
         446 : dbg_instr = "I2C_reg_read_finish+0x001                      ";
         447 : dbg_instr = "I2C_Rx_byte                                    ";
         448 : dbg_instr = "I2C_Rx_byte+0x001                              ";
         449 : dbg_instr = "I2C_Rx_byte+0x002                              ";
         450 : dbg_instr = "I2C_Rx_byte+0x003                              ";
         451 : dbg_instr = "I2C_Rx_byte+0x004                              ";
         452 : dbg_instr = "I2C_Rx_byte+0x005                              ";
         453 : dbg_instr = "adc_init                                       ";
         454 : dbg_instr = "adc_init+0x001                                 ";
         455 : dbg_instr = "adc_init+0x002                                 ";
         456 : dbg_instr = "adc_init+0x003                                 ";
         457 : dbg_instr = "adc_init+0x004                                 ";
         458 : dbg_instr = "adc_init+0x005                                 ";
         459 : dbg_instr = "adc_init+0x006                                 ";
         460 : dbg_instr = "adc_init+0x007                                 ";
         461 : dbg_instr = "adc_init+0x008                                 ";
         462 : dbg_instr = "adc_init+0x009                                 ";
         463 : dbg_instr = "adc_init+0x00a                                 ";
         464 : dbg_instr = "adc_init+0x00b                                 ";
         465 : dbg_instr = "adc_init+0x00c                                 ";
         466 : dbg_instr = "adc_init+0x00d                                 ";
         467 : dbg_instr = "adc_init+0x00e                                 ";
         468 : dbg_instr = "adc_init+0x00f                                 ";
         469 : dbg_instr = "adc_init+0x010                                 ";
         470 : dbg_instr = "adc_init+0x011                                 ";
         471 : dbg_instr = "adc_init+0x012                                 ";
         472 : dbg_instr = "adc_init+0x013                                 ";
         473 : dbg_instr = "I2C_read1_process                              ";
         474 : dbg_instr = "I2C_read1_process+0x001                        ";
         475 : dbg_instr = "I2C_read1_process+0x002                        ";
         476 : dbg_instr = "I2C_read1_process+0x003                        ";
         477 : dbg_instr = "I2C_read1_process+0x004                        ";
         478 : dbg_instr = "spi_write_byte                                 ";
         479 : dbg_instr = "spi_write_byte+0x001                           ";
         480 : dbg_instr = "spi_write_byte+0x002                           ";
         481 : dbg_instr = "spi_write_byte+0x003                           ";
         482 : dbg_instr = "spi_write_byte+0x004                           ";
         483 : dbg_instr = "spi_write_byte+0x005                           ";
         484 : dbg_instr = "spi_write_byte+0x006                           ";
         485 : dbg_instr = "spi_write_byte+0x007                           ";
         486 : dbg_instr = "spi_write_byte+0x008                           ";
         487 : dbg_instr = "spi_write_byte+0x009                           ";
         488 : dbg_instr = "spi_write_byte+0x00a                           ";
         489 : dbg_instr = "spi_write_byte+0x00b                           ";
         490 : dbg_instr = "spi_write_byte+0x00c                           ";
         491 : dbg_instr = "spi_write_byte+0x00d                           ";
         492 : dbg_instr = "spi_write_byte+0x00e                           ";
         493 : dbg_instr = "switch_clear                                   ";
         494 : dbg_instr = "switch_clear+0x001                             ";
         495 : dbg_instr = "switch_clear+0x002                             ";
         496 : dbg_instr = "switch_clear+0x003                             ";
         497 : dbg_instr = "switch_clear+0x004                             ";
         498 : dbg_instr = "switch_clear+0x005                             ";
         499 : dbg_instr = "switch_clear+0x006                             ";
         500 : dbg_instr = "monitor_operation                              ";
         501 : dbg_instr = "monitor_operation+0x001                        ";
         502 : dbg_instr = "monitor_operation+0x002                        ";
         503 : dbg_instr = "monitor_operation+0x003                        ";
         504 : dbg_instr = "monitor_operation+0x004                        ";
         505 : dbg_instr = "monitor_operation+0x005                        ";
         506 : dbg_instr = "monitor_operation+0x006                        ";
         507 : dbg_instr = "monitor_operation+0x007                        ";
         508 : dbg_instr = "adc_write_fn                                   ";
         509 : dbg_instr = "adc_write_fn+0x001                             ";
         510 : dbg_instr = "adc_write_fn+0x002                             ";
         511 : dbg_instr = "adc_write_fn+0x003                             ";
         512 : dbg_instr = "adc_write_fn+0x004                             ";
         513 : dbg_instr = "adc_write_fn+0x005                             ";
         514 : dbg_instr = "adc_write_fn+0x006                             ";
         515 : dbg_instr = "adc_write_fn+0x007                             ";
         516 : dbg_instr = "I2C_Tx_byte                                    ";
         517 : dbg_instr = "I2C_Tx_byte+0x001                              ";
         518 : dbg_instr = "I2C_Tx_byte+0x002                              ";
         519 : dbg_instr = "I2C_Tx_byte+0x003                              ";
         520 : dbg_instr = "I2C_Tx_byte+0x004                              ";
         521 : dbg_instr = "I2C_Tx_byte+0x005                              ";
         522 : dbg_instr = "I2C_Tx_byte+0x006                              ";
         523 : dbg_instr = "I2C_Tx_byte+0x007                              ";
         524 : dbg_instr = "I2C_Tx_byte+0x008                              ";
         525 : dbg_instr = "I2C_Tx_byte+0x009                              ";
         526 : dbg_instr = "I2C_Tx_byte+0x00a                              ";
         527 : dbg_instr = "I2C_Tx_byte+0x00b                              ";
         528 : dbg_instr = "I2C_Tx_byte+0x00c                              ";
         529 : dbg_instr = "I2C_Tx_byte+0x00d                              ";
         530 : dbg_instr = "I2C_Tx_byte+0x00e                              ";
         531 : dbg_instr = "I2C_Tx_byte+0x00f                              ";
         532 : dbg_instr = "I2C_Tx_byte+0x010                              ";
         533 : dbg_instr = "I2C_Tx_byte+0x011                              ";
         534 : dbg_instr = "I2C_Tx_byte+0x012                              ";
         535 : dbg_instr = "I2C_Tx_byte+0x013                              ";
         536 : dbg_instr = "I2C_Tx_byte+0x014                              ";
         537 : dbg_instr = "I2C_Tx_byte+0x015                              ";
         538 : dbg_instr = "I2C_Tx_byte+0x016                              ";
         539 : dbg_instr = "I2C_Tx_byte+0x017                              ";
         540 : dbg_instr = "I2C_Tx_byte+0x018                              ";
         541 : dbg_instr = "I2C_Tx_byte+0x019                              ";
         542 : dbg_instr = "I2C_Tx_byte+0x01a                              ";
         543 : dbg_instr = "I2C_Tx_byte+0x01b                              ";
         544 : dbg_instr = "I2C_Tx_byte+0x01c                              ";
         545 : dbg_instr = "I2C_Tx_byte+0x01d                              ";
         546 : dbg_instr = "I2C_Tx_byte+0x01e                              ";
         547 : dbg_instr = "I2C_Tx_byte+0x01f                              ";
         548 : dbg_instr = "I2C_Tx_byte+0x020                              ";
         549 : dbg_instr = "I2C_Tx_byte+0x021                              ";
         550 : dbg_instr = "I2C_Tx_byte+0x022                              ";
         551 : dbg_instr = "I2C_Tx_byte+0x023                              ";
         552 : dbg_instr = "I2C_Tx_byte+0x024                              ";
         553 : dbg_instr = "I2C_Tx_byte+0x025                              ";
         554 : dbg_instr = "I2C_Tx_byte+0x026                              ";
         555 : dbg_instr = "I2C_Tx_byte+0x027                              ";
         556 : dbg_instr = "I2C_Tx_byte+0x028                              ";
         557 : dbg_instr = "I2C_Tx_byte+0x029                              ";
         558 : dbg_instr = "I2C_Tx_byte+0x02a                              ";
         559 : dbg_instr = "I2C_Tx_byte+0x02b                              ";
         560 : dbg_instr = "I2C_Tx_byte+0x02c                              ";
         561 : dbg_instr = "I2C_Tx_byte+0x02d                              ";
         562 : dbg_instr = "I2C_Tx_byte+0x02e                              ";
         563 : dbg_instr = "I2C_Tx_byte+0x02f                              ";
         564 : dbg_instr = "I2C_Tx_byte+0x030                              ";
         565 : dbg_instr = "I2C_Tx_byte+0x031                              ";
         566 : dbg_instr = "I2C_Tx_byte+0x032                              ";
         567 : dbg_instr = "I2C_Tx_byte+0x033                              ";
         568 : dbg_instr = "I2C_Tx_byte+0x034                              ";
         569 : dbg_instr = "I2C_Tx_byte+0x035                              ";
         570 : dbg_instr = "I2C_Tx_byte+0x036                              ";
         571 : dbg_instr = "I2C_Tx_byte+0x037                              ";
         572 : dbg_instr = "I2C_Tx_byte+0x038                              ";
         573 : dbg_instr = "I2C_Tx_byte+0x039                              ";
         574 : dbg_instr = "I2C_Tx_byte+0x03a                              ";
         575 : dbg_instr = "I2C_Tx_byte+0x03b                              ";
         576 : dbg_instr = "I2C_Tx_byte+0x03c                              ";
         577 : dbg_instr = "I2C_Tx_byte+0x03d                              ";
         578 : dbg_instr = "I2C_Tx_byte+0x03e                              ";
         579 : dbg_instr = "I2C_Tx_byte+0x03f                              ";
         580 : dbg_instr = "I2C_Tx_byte+0x040                              ";
         581 : dbg_instr = "I2C_Tx_byte+0x041                              ";
         582 : dbg_instr = "I2C_Tx_byte+0x042                              ";
         583 : dbg_instr = "I2C_Tx_byte+0x043                              ";
         584 : dbg_instr = "I2C_Tx_byte+0x044                              ";
         585 : dbg_instr = "I2C_Tx_byte+0x045                              ";
         586 : dbg_instr = "I2C_Tx_byte+0x046                              ";
         587 : dbg_instr = "I2C_Tx_byte+0x047                              ";
         588 : dbg_instr = "I2C_Tx_byte+0x048                              ";
         589 : dbg_instr = "I2C_Tx_byte+0x049                              ";
         590 : dbg_instr = "I2C_Tx_byte+0x04a                              ";
         591 : dbg_instr = "I2C_Tx_byte+0x04b                              ";
         592 : dbg_instr = "I2C_Tx_byte+0x04c                              ";
         593 : dbg_instr = "I2C_Tx_byte+0x04d                              ";
         594 : dbg_instr = "I2C_Tx_byte+0x04e                              ";
         595 : dbg_instr = "I2C_Tx_byte+0x04f                              ";
         596 : dbg_instr = "I2C_Tx_byte+0x050                              ";
         597 : dbg_instr = "I2C_Tx_byte+0x051                              ";
         598 : dbg_instr = "I2C_Tx_byte+0x052                              ";
         599 : dbg_instr = "I2C_Tx_byte+0x053                              ";
         600 : dbg_instr = "I2C_Tx_byte+0x054                              ";
         601 : dbg_instr = "I2C_Tx_byte+0x055                              ";
         602 : dbg_instr = "I2C_Tx_byte+0x056                              ";
         603 : dbg_instr = "I2C_Tx_byte+0x057                              ";
         604 : dbg_instr = "I2C_Tx_byte+0x058                              ";
         605 : dbg_instr = "I2C_Tx_byte+0x059                              ";
         606 : dbg_instr = "I2C_Tx_byte+0x05a                              ";
         607 : dbg_instr = "I2C_Tx_byte+0x05b                              ";
         608 : dbg_instr = "I2C_Tx_byte+0x05c                              ";
         609 : dbg_instr = "I2C_Tx_byte+0x05d                              ";
         610 : dbg_instr = "I2C_Tx_byte+0x05e                              ";
         611 : dbg_instr = "I2C_Tx_byte+0x05f                              ";
         612 : dbg_instr = "I2C_Tx_byte+0x060                              ";
         613 : dbg_instr = "I2C_Tx_byte+0x061                              ";
         614 : dbg_instr = "I2C_Tx_byte+0x062                              ";
         615 : dbg_instr = "I2C_Tx_byte+0x063                              ";
         616 : dbg_instr = "I2C_Tx_byte+0x064                              ";
         617 : dbg_instr = "I2C_Tx_byte+0x065                              ";
         618 : dbg_instr = "I2C_Tx_byte+0x066                              ";
         619 : dbg_instr = "I2C_Tx_byte+0x067                              ";
         620 : dbg_instr = "I2C_Tx_byte+0x068                              ";
         621 : dbg_instr = "I2C_Tx_byte+0x069                              ";
         622 : dbg_instr = "I2C_Tx_byte+0x06a                              ";
         623 : dbg_instr = "I2C_Tx_byte+0x06b                              ";
         624 : dbg_instr = "I2C_Tx_byte+0x06c                              ";
         625 : dbg_instr = "I2C_Tx_byte+0x06d                              ";
         626 : dbg_instr = "I2C_Tx_byte+0x06e                              ";
         627 : dbg_instr = "I2C_Tx_byte+0x06f                              ";
         628 : dbg_instr = "I2C_Tx_byte+0x070                              ";
         629 : dbg_instr = "I2C_Tx_byte+0x071                              ";
         630 : dbg_instr = "I2C_Tx_byte+0x072                              ";
         631 : dbg_instr = "I2C_Tx_byte+0x073                              ";
         632 : dbg_instr = "I2C_Tx_byte+0x074                              ";
         633 : dbg_instr = "I2C_Tx_byte+0x075                              ";
         634 : dbg_instr = "I2C_Tx_byte+0x076                              ";
         635 : dbg_instr = "I2C_Tx_byte+0x077                              ";
         636 : dbg_instr = "I2C_Tx_byte+0x078                              ";
         637 : dbg_instr = "I2C_Tx_byte+0x079                              ";
         638 : dbg_instr = "I2C_Tx_byte+0x07a                              ";
         639 : dbg_instr = "I2C_Tx_byte+0x07b                              ";
         640 : dbg_instr = "I2C_Tx_byte+0x07c                              ";
         641 : dbg_instr = "I2C_Tx_byte+0x07d                              ";
         642 : dbg_instr = "I2C_Tx_byte+0x07e                              ";
         643 : dbg_instr = "I2C_Tx_byte+0x07f                              ";
         644 : dbg_instr = "I2C_Tx_byte+0x080                              ";
         645 : dbg_instr = "I2C_Tx_byte+0x081                              ";
         646 : dbg_instr = "I2C_Tx_byte+0x082                              ";
         647 : dbg_instr = "I2C_Tx_byte+0x083                              ";
         648 : dbg_instr = "I2C_Tx_byte+0x084                              ";
         649 : dbg_instr = "I2C_Tx_byte+0x085                              ";
         650 : dbg_instr = "I2C_Tx_byte+0x086                              ";
         651 : dbg_instr = "I2C_Tx_byte+0x087                              ";
         652 : dbg_instr = "I2C_Tx_byte+0x088                              ";
         653 : dbg_instr = "I2C_Tx_byte+0x089                              ";
         654 : dbg_instr = "I2C_Tx_byte+0x08a                              ";
         655 : dbg_instr = "I2C_Tx_byte+0x08b                              ";
         656 : dbg_instr = "I2C_Tx_byte+0x08c                              ";
         657 : dbg_instr = "I2C_Tx_byte+0x08d                              ";
         658 : dbg_instr = "I2C_Tx_byte+0x08e                              ";
         659 : dbg_instr = "I2C_Tx_byte+0x08f                              ";
         660 : dbg_instr = "I2C_Tx_byte+0x090                              ";
         661 : dbg_instr = "I2C_Tx_byte+0x091                              ";
         662 : dbg_instr = "I2C_Tx_byte+0x092                              ";
         663 : dbg_instr = "I2C_Tx_byte+0x093                              ";
         664 : dbg_instr = "I2C_Tx_byte+0x094                              ";
         665 : dbg_instr = "I2C_Tx_byte+0x095                              ";
         666 : dbg_instr = "I2C_Tx_byte+0x096                              ";
         667 : dbg_instr = "I2C_Tx_byte+0x097                              ";
         668 : dbg_instr = "I2C_Tx_byte+0x098                              ";
         669 : dbg_instr = "I2C_Tx_byte+0x099                              ";
         670 : dbg_instr = "I2C_Tx_byte+0x09a                              ";
         671 : dbg_instr = "I2C_Tx_byte+0x09b                              ";
         672 : dbg_instr = "I2C_Tx_byte+0x09c                              ";
         673 : dbg_instr = "I2C_Tx_byte+0x09d                              ";
         674 : dbg_instr = "I2C_Tx_byte+0x09e                              ";
         675 : dbg_instr = "I2C_Tx_byte+0x09f                              ";
         676 : dbg_instr = "I2C_Tx_byte+0x0a0                              ";
         677 : dbg_instr = "I2C_Tx_byte+0x0a1                              ";
         678 : dbg_instr = "I2C_Tx_byte+0x0a2                              ";
         679 : dbg_instr = "I2C_Tx_byte+0x0a3                              ";
         680 : dbg_instr = "I2C_Tx_byte+0x0a4                              ";
         681 : dbg_instr = "I2C_Tx_byte+0x0a5                              ";
         682 : dbg_instr = "I2C_Tx_byte+0x0a6                              ";
         683 : dbg_instr = "I2C_Tx_byte+0x0a7                              ";
         684 : dbg_instr = "I2C_Tx_byte+0x0a8                              ";
         685 : dbg_instr = "I2C_Tx_byte+0x0a9                              ";
         686 : dbg_instr = "I2C_Tx_byte+0x0aa                              ";
         687 : dbg_instr = "I2C_Tx_byte+0x0ab                              ";
         688 : dbg_instr = "I2C_Tx_byte+0x0ac                              ";
         689 : dbg_instr = "I2C_Tx_byte+0x0ad                              ";
         690 : dbg_instr = "I2C_Tx_byte+0x0ae                              ";
         691 : dbg_instr = "I2C_Tx_byte+0x0af                              ";
         692 : dbg_instr = "I2C_Tx_byte+0x0b0                              ";
         693 : dbg_instr = "I2C_Tx_byte+0x0b1                              ";
         694 : dbg_instr = "I2C_Tx_byte+0x0b2                              ";
         695 : dbg_instr = "I2C_Tx_byte+0x0b3                              ";
         696 : dbg_instr = "I2C_Tx_byte+0x0b4                              ";
         697 : dbg_instr = "I2C_Tx_byte+0x0b5                              ";
         698 : dbg_instr = "I2C_Tx_byte+0x0b6                              ";
         699 : dbg_instr = "I2C_Tx_byte+0x0b7                              ";
         700 : dbg_instr = "I2C_Tx_byte+0x0b8                              ";
         701 : dbg_instr = "I2C_Tx_byte+0x0b9                              ";
         702 : dbg_instr = "I2C_Tx_byte+0x0ba                              ";
         703 : dbg_instr = "I2C_Tx_byte+0x0bb                              ";
         704 : dbg_instr = "I2C_Tx_byte+0x0bc                              ";
         705 : dbg_instr = "I2C_Tx_byte+0x0bd                              ";
         706 : dbg_instr = "I2C_Tx_byte+0x0be                              ";
         707 : dbg_instr = "I2C_Tx_byte+0x0bf                              ";
         708 : dbg_instr = "I2C_Tx_byte+0x0c0                              ";
         709 : dbg_instr = "I2C_Tx_byte+0x0c1                              ";
         710 : dbg_instr = "I2C_Tx_byte+0x0c2                              ";
         711 : dbg_instr = "I2C_Tx_byte+0x0c3                              ";
         712 : dbg_instr = "I2C_Tx_byte+0x0c4                              ";
         713 : dbg_instr = "I2C_Tx_byte+0x0c5                              ";
         714 : dbg_instr = "I2C_Tx_byte+0x0c6                              ";
         715 : dbg_instr = "I2C_Tx_byte+0x0c7                              ";
         716 : dbg_instr = "I2C_Tx_byte+0x0c8                              ";
         717 : dbg_instr = "I2C_Tx_byte+0x0c9                              ";
         718 : dbg_instr = "I2C_Tx_byte+0x0ca                              ";
         719 : dbg_instr = "I2C_Tx_byte+0x0cb                              ";
         720 : dbg_instr = "I2C_Tx_byte+0x0cc                              ";
         721 : dbg_instr = "I2C_Tx_byte+0x0cd                              ";
         722 : dbg_instr = "I2C_Tx_byte+0x0ce                              ";
         723 : dbg_instr = "I2C_Tx_byte+0x0cf                              ";
         724 : dbg_instr = "I2C_Tx_byte+0x0d0                              ";
         725 : dbg_instr = "I2C_Tx_byte+0x0d1                              ";
         726 : dbg_instr = "I2C_Tx_byte+0x0d2                              ";
         727 : dbg_instr = "I2C_Tx_byte+0x0d3                              ";
         728 : dbg_instr = "I2C_Tx_byte+0x0d4                              ";
         729 : dbg_instr = "I2C_Tx_byte+0x0d5                              ";
         730 : dbg_instr = "I2C_Tx_byte+0x0d6                              ";
         731 : dbg_instr = "I2C_Tx_byte+0x0d7                              ";
         732 : dbg_instr = "I2C_Tx_byte+0x0d8                              ";
         733 : dbg_instr = "I2C_Tx_byte+0x0d9                              ";
         734 : dbg_instr = "I2C_Tx_byte+0x0da                              ";
         735 : dbg_instr = "I2C_Tx_byte+0x0db                              ";
         736 : dbg_instr = "I2C_Tx_byte+0x0dc                              ";
         737 : dbg_instr = "I2C_Tx_byte+0x0dd                              ";
         738 : dbg_instr = "I2C_Tx_byte+0x0de                              ";
         739 : dbg_instr = "I2C_Tx_byte+0x0df                              ";
         740 : dbg_instr = "I2C_Tx_byte+0x0e0                              ";
         741 : dbg_instr = "I2C_Tx_byte+0x0e1                              ";
         742 : dbg_instr = "I2C_Tx_byte+0x0e2                              ";
         743 : dbg_instr = "I2C_Tx_byte+0x0e3                              ";
         744 : dbg_instr = "I2C_Tx_byte+0x0e4                              ";
         745 : dbg_instr = "I2C_Tx_byte+0x0e5                              ";
         746 : dbg_instr = "I2C_Tx_byte+0x0e6                              ";
         747 : dbg_instr = "I2C_Tx_byte+0x0e7                              ";
         748 : dbg_instr = "I2C_Tx_byte+0x0e8                              ";
         749 : dbg_instr = "I2C_Tx_byte+0x0e9                              ";
         750 : dbg_instr = "I2C_Tx_byte+0x0ea                              ";
         751 : dbg_instr = "I2C_Tx_byte+0x0eb                              ";
         752 : dbg_instr = "I2C_Tx_byte+0x0ec                              ";
         753 : dbg_instr = "I2C_Tx_byte+0x0ed                              ";
         754 : dbg_instr = "I2C_Tx_byte+0x0ee                              ";
         755 : dbg_instr = "I2C_Tx_byte+0x0ef                              ";
         756 : dbg_instr = "I2C_Tx_byte+0x0f0                              ";
         757 : dbg_instr = "I2C_Tx_byte+0x0f1                              ";
         758 : dbg_instr = "I2C_Tx_byte+0x0f2                              ";
         759 : dbg_instr = "I2C_Tx_byte+0x0f3                              ";
         760 : dbg_instr = "I2C_Tx_byte+0x0f4                              ";
         761 : dbg_instr = "I2C_Tx_byte+0x0f5                              ";
         762 : dbg_instr = "I2C_Tx_byte+0x0f6                              ";
         763 : dbg_instr = "I2C_Tx_byte+0x0f7                              ";
         764 : dbg_instr = "I2C_Tx_byte+0x0f8                              ";
         765 : dbg_instr = "I2C_Tx_byte+0x0f9                              ";
         766 : dbg_instr = "I2C_Tx_byte+0x0fa                              ";
         767 : dbg_instr = "I2C_Tx_byte+0x0fb                              ";
         768 : dbg_instr = "I2C_Tx_byte+0x0fc                              ";
         769 : dbg_instr = "I2C_Tx_byte+0x0fd                              ";
         770 : dbg_instr = "I2C_Tx_byte+0x0fe                              ";
         771 : dbg_instr = "I2C_Tx_byte+0x0ff                              ";
         772 : dbg_instr = "I2C_Tx_byte+0x100                              ";
         773 : dbg_instr = "I2C_Tx_byte+0x101                              ";
         774 : dbg_instr = "I2C_Tx_byte+0x102                              ";
         775 : dbg_instr = "I2C_Tx_byte+0x103                              ";
         776 : dbg_instr = "I2C_Tx_byte+0x104                              ";
         777 : dbg_instr = "I2C_Tx_byte+0x105                              ";
         778 : dbg_instr = "I2C_Tx_byte+0x106                              ";
         779 : dbg_instr = "I2C_Tx_byte+0x107                              ";
         780 : dbg_instr = "I2C_Tx_byte+0x108                              ";
         781 : dbg_instr = "I2C_Tx_byte+0x109                              ";
         782 : dbg_instr = "I2C_Tx_byte+0x10a                              ";
         783 : dbg_instr = "I2C_Tx_byte+0x10b                              ";
         784 : dbg_instr = "I2C_Tx_byte+0x10c                              ";
         785 : dbg_instr = "I2C_Tx_byte+0x10d                              ";
         786 : dbg_instr = "I2C_Tx_byte+0x10e                              ";
         787 : dbg_instr = "I2C_Tx_byte+0x10f                              ";
         788 : dbg_instr = "I2C_Tx_byte+0x110                              ";
         789 : dbg_instr = "I2C_Tx_byte+0x111                              ";
         790 : dbg_instr = "I2C_Tx_byte+0x112                              ";
         791 : dbg_instr = "I2C_Tx_byte+0x113                              ";
         792 : dbg_instr = "I2C_Tx_byte+0x114                              ";
         793 : dbg_instr = "I2C_Tx_byte+0x115                              ";
         794 : dbg_instr = "I2C_Tx_byte+0x116                              ";
         795 : dbg_instr = "I2C_Tx_byte+0x117                              ";
         796 : dbg_instr = "I2C_Tx_byte+0x118                              ";
         797 : dbg_instr = "I2C_Tx_byte+0x119                              ";
         798 : dbg_instr = "I2C_Tx_byte+0x11a                              ";
         799 : dbg_instr = "I2C_Tx_byte+0x11b                              ";
         800 : dbg_instr = "I2C_Tx_byte+0x11c                              ";
         801 : dbg_instr = "I2C_Tx_byte+0x11d                              ";
         802 : dbg_instr = "I2C_Tx_byte+0x11e                              ";
         803 : dbg_instr = "I2C_Tx_byte+0x11f                              ";
         804 : dbg_instr = "I2C_Tx_byte+0x120                              ";
         805 : dbg_instr = "I2C_Tx_byte+0x121                              ";
         806 : dbg_instr = "I2C_Tx_byte+0x122                              ";
         807 : dbg_instr = "I2C_Tx_byte+0x123                              ";
         808 : dbg_instr = "I2C_Tx_byte+0x124                              ";
         809 : dbg_instr = "I2C_Tx_byte+0x125                              ";
         810 : dbg_instr = "I2C_Tx_byte+0x126                              ";
         811 : dbg_instr = "I2C_Tx_byte+0x127                              ";
         812 : dbg_instr = "I2C_Tx_byte+0x128                              ";
         813 : dbg_instr = "I2C_Tx_byte+0x129                              ";
         814 : dbg_instr = "I2C_Tx_byte+0x12a                              ";
         815 : dbg_instr = "I2C_Tx_byte+0x12b                              ";
         816 : dbg_instr = "I2C_Tx_byte+0x12c                              ";
         817 : dbg_instr = "I2C_Tx_byte+0x12d                              ";
         818 : dbg_instr = "I2C_Tx_byte+0x12e                              ";
         819 : dbg_instr = "I2C_Tx_byte+0x12f                              ";
         820 : dbg_instr = "I2C_Tx_byte+0x130                              ";
         821 : dbg_instr = "I2C_Tx_byte+0x131                              ";
         822 : dbg_instr = "I2C_Tx_byte+0x132                              ";
         823 : dbg_instr = "I2C_Tx_byte+0x133                              ";
         824 : dbg_instr = "I2C_Tx_byte+0x134                              ";
         825 : dbg_instr = "I2C_Tx_byte+0x135                              ";
         826 : dbg_instr = "I2C_Tx_byte+0x136                              ";
         827 : dbg_instr = "I2C_Tx_byte+0x137                              ";
         828 : dbg_instr = "I2C_Tx_byte+0x138                              ";
         829 : dbg_instr = "I2C_Tx_byte+0x139                              ";
         830 : dbg_instr = "I2C_Tx_byte+0x13a                              ";
         831 : dbg_instr = "I2C_Tx_byte+0x13b                              ";
         832 : dbg_instr = "I2C_Tx_byte+0x13c                              ";
         833 : dbg_instr = "I2C_Tx_byte+0x13d                              ";
         834 : dbg_instr = "I2C_Tx_byte+0x13e                              ";
         835 : dbg_instr = "I2C_Tx_byte+0x13f                              ";
         836 : dbg_instr = "I2C_Tx_byte+0x140                              ";
         837 : dbg_instr = "I2C_Tx_byte+0x141                              ";
         838 : dbg_instr = "I2C_Tx_byte+0x142                              ";
         839 : dbg_instr = "I2C_Tx_byte+0x143                              ";
         840 : dbg_instr = "I2C_Tx_byte+0x144                              ";
         841 : dbg_instr = "I2C_Tx_byte+0x145                              ";
         842 : dbg_instr = "I2C_Tx_byte+0x146                              ";
         843 : dbg_instr = "I2C_Tx_byte+0x147                              ";
         844 : dbg_instr = "I2C_Tx_byte+0x148                              ";
         845 : dbg_instr = "I2C_Tx_byte+0x149                              ";
         846 : dbg_instr = "I2C_Tx_byte+0x14a                              ";
         847 : dbg_instr = "I2C_Tx_byte+0x14b                              ";
         848 : dbg_instr = "I2C_Tx_byte+0x14c                              ";
         849 : dbg_instr = "I2C_Tx_byte+0x14d                              ";
         850 : dbg_instr = "I2C_Tx_byte+0x14e                              ";
         851 : dbg_instr = "I2C_Tx_byte+0x14f                              ";
         852 : dbg_instr = "I2C_Tx_byte+0x150                              ";
         853 : dbg_instr = "I2C_Tx_byte+0x151                              ";
         854 : dbg_instr = "I2C_Tx_byte+0x152                              ";
         855 : dbg_instr = "I2C_Tx_byte+0x153                              ";
         856 : dbg_instr = "I2C_Tx_byte+0x154                              ";
         857 : dbg_instr = "I2C_Tx_byte+0x155                              ";
         858 : dbg_instr = "I2C_Tx_byte+0x156                              ";
         859 : dbg_instr = "I2C_Tx_byte+0x157                              ";
         860 : dbg_instr = "I2C_Tx_byte+0x158                              ";
         861 : dbg_instr = "I2C_Tx_byte+0x159                              ";
         862 : dbg_instr = "I2C_Tx_byte+0x15a                              ";
         863 : dbg_instr = "I2C_Tx_byte+0x15b                              ";
         864 : dbg_instr = "I2C_Tx_byte+0x15c                              ";
         865 : dbg_instr = "I2C_Tx_byte+0x15d                              ";
         866 : dbg_instr = "I2C_Tx_byte+0x15e                              ";
         867 : dbg_instr = "I2C_Tx_byte+0x15f                              ";
         868 : dbg_instr = "I2C_Tx_byte+0x160                              ";
         869 : dbg_instr = "I2C_Tx_byte+0x161                              ";
         870 : dbg_instr = "I2C_Tx_byte+0x162                              ";
         871 : dbg_instr = "I2C_Tx_byte+0x163                              ";
         872 : dbg_instr = "I2C_Tx_byte+0x164                              ";
         873 : dbg_instr = "I2C_Tx_byte+0x165                              ";
         874 : dbg_instr = "I2C_Tx_byte+0x166                              ";
         875 : dbg_instr = "I2C_Tx_byte+0x167                              ";
         876 : dbg_instr = "I2C_Tx_byte+0x168                              ";
         877 : dbg_instr = "I2C_Tx_byte+0x169                              ";
         878 : dbg_instr = "I2C_Tx_byte+0x16a                              ";
         879 : dbg_instr = "I2C_Tx_byte+0x16b                              ";
         880 : dbg_instr = "I2C_Tx_byte+0x16c                              ";
         881 : dbg_instr = "I2C_Tx_byte+0x16d                              ";
         882 : dbg_instr = "I2C_Tx_byte+0x16e                              ";
         883 : dbg_instr = "I2C_Tx_byte+0x16f                              ";
         884 : dbg_instr = "I2C_Tx_byte+0x170                              ";
         885 : dbg_instr = "I2C_Tx_byte+0x171                              ";
         886 : dbg_instr = "I2C_Tx_byte+0x172                              ";
         887 : dbg_instr = "I2C_Tx_byte+0x173                              ";
         888 : dbg_instr = "I2C_Tx_byte+0x174                              ";
         889 : dbg_instr = "I2C_Tx_byte+0x175                              ";
         890 : dbg_instr = "I2C_Tx_byte+0x176                              ";
         891 : dbg_instr = "I2C_Tx_byte+0x177                              ";
         892 : dbg_instr = "I2C_Tx_byte+0x178                              ";
         893 : dbg_instr = "I2C_Tx_byte+0x179                              ";
         894 : dbg_instr = "I2C_Tx_byte+0x17a                              ";
         895 : dbg_instr = "I2C_Tx_byte+0x17b                              ";
         896 : dbg_instr = "I2C_Tx_byte+0x17c                              ";
         897 : dbg_instr = "I2C_Tx_byte+0x17d                              ";
         898 : dbg_instr = "I2C_Tx_byte+0x17e                              ";
         899 : dbg_instr = "I2C_Tx_byte+0x17f                              ";
         900 : dbg_instr = "I2C_Tx_byte+0x180                              ";
         901 : dbg_instr = "I2C_Tx_byte+0x181                              ";
         902 : dbg_instr = "I2C_Tx_byte+0x182                              ";
         903 : dbg_instr = "I2C_Tx_byte+0x183                              ";
         904 : dbg_instr = "I2C_Tx_byte+0x184                              ";
         905 : dbg_instr = "I2C_Tx_byte+0x185                              ";
         906 : dbg_instr = "I2C_Tx_byte+0x186                              ";
         907 : dbg_instr = "I2C_Tx_byte+0x187                              ";
         908 : dbg_instr = "I2C_Tx_byte+0x188                              ";
         909 : dbg_instr = "I2C_Tx_byte+0x189                              ";
         910 : dbg_instr = "I2C_Tx_byte+0x18a                              ";
         911 : dbg_instr = "I2C_Tx_byte+0x18b                              ";
         912 : dbg_instr = "I2C_Tx_byte+0x18c                              ";
         913 : dbg_instr = "I2C_Tx_byte+0x18d                              ";
         914 : dbg_instr = "I2C_Tx_byte+0x18e                              ";
         915 : dbg_instr = "I2C_Tx_byte+0x18f                              ";
         916 : dbg_instr = "I2C_Tx_byte+0x190                              ";
         917 : dbg_instr = "I2C_Tx_byte+0x191                              ";
         918 : dbg_instr = "I2C_Tx_byte+0x192                              ";
         919 : dbg_instr = "I2C_Tx_byte+0x193                              ";
         920 : dbg_instr = "I2C_Tx_byte+0x194                              ";
         921 : dbg_instr = "I2C_Tx_byte+0x195                              ";
         922 : dbg_instr = "I2C_Tx_byte+0x196                              ";
         923 : dbg_instr = "I2C_Tx_byte+0x197                              ";
         924 : dbg_instr = "I2C_Tx_byte+0x198                              ";
         925 : dbg_instr = "I2C_Tx_byte+0x199                              ";
         926 : dbg_instr = "I2C_Tx_byte+0x19a                              ";
         927 : dbg_instr = "I2C_Tx_byte+0x19b                              ";
         928 : dbg_instr = "I2C_Tx_byte+0x19c                              ";
         929 : dbg_instr = "I2C_Tx_byte+0x19d                              ";
         930 : dbg_instr = "I2C_Tx_byte+0x19e                              ";
         931 : dbg_instr = "I2C_Tx_byte+0x19f                              ";
         932 : dbg_instr = "I2C_Tx_byte+0x1a0                              ";
         933 : dbg_instr = "I2C_Tx_byte+0x1a1                              ";
         934 : dbg_instr = "I2C_Tx_byte+0x1a2                              ";
         935 : dbg_instr = "I2C_Tx_byte+0x1a3                              ";
         936 : dbg_instr = "I2C_Tx_byte+0x1a4                              ";
         937 : dbg_instr = "I2C_Tx_byte+0x1a5                              ";
         938 : dbg_instr = "I2C_Tx_byte+0x1a6                              ";
         939 : dbg_instr = "I2C_Tx_byte+0x1a7                              ";
         940 : dbg_instr = "I2C_Tx_byte+0x1a8                              ";
         941 : dbg_instr = "I2C_Tx_byte+0x1a9                              ";
         942 : dbg_instr = "I2C_Tx_byte+0x1aa                              ";
         943 : dbg_instr = "I2C_Tx_byte+0x1ab                              ";
         944 : dbg_instr = "I2C_Tx_byte+0x1ac                              ";
         945 : dbg_instr = "I2C_Tx_byte+0x1ad                              ";
         946 : dbg_instr = "I2C_Tx_byte+0x1ae                              ";
         947 : dbg_instr = "I2C_Tx_byte+0x1af                              ";
         948 : dbg_instr = "I2C_Tx_byte+0x1b0                              ";
         949 : dbg_instr = "I2C_Tx_byte+0x1b1                              ";
         950 : dbg_instr = "I2C_Tx_byte+0x1b2                              ";
         951 : dbg_instr = "I2C_Tx_byte+0x1b3                              ";
         952 : dbg_instr = "I2C_Tx_byte+0x1b4                              ";
         953 : dbg_instr = "I2C_Tx_byte+0x1b5                              ";
         954 : dbg_instr = "I2C_Tx_byte+0x1b6                              ";
         955 : dbg_instr = "I2C_Tx_byte+0x1b7                              ";
         956 : dbg_instr = "I2C_Tx_byte+0x1b8                              ";
         957 : dbg_instr = "I2C_Tx_byte+0x1b9                              ";
         958 : dbg_instr = "I2C_Tx_byte+0x1ba                              ";
         959 : dbg_instr = "I2C_Tx_byte+0x1bb                              ";
         960 : dbg_instr = "I2C_Tx_byte+0x1bc                              ";
         961 : dbg_instr = "I2C_Tx_byte+0x1bd                              ";
         962 : dbg_instr = "I2C_Tx_byte+0x1be                              ";
         963 : dbg_instr = "I2C_Tx_byte+0x1bf                              ";
         964 : dbg_instr = "I2C_Tx_byte+0x1c0                              ";
         965 : dbg_instr = "I2C_Tx_byte+0x1c1                              ";
         966 : dbg_instr = "I2C_Tx_byte+0x1c2                              ";
         967 : dbg_instr = "I2C_Tx_byte+0x1c3                              ";
         968 : dbg_instr = "I2C_Tx_byte+0x1c4                              ";
         969 : dbg_instr = "I2C_Tx_byte+0x1c5                              ";
         970 : dbg_instr = "I2C_Tx_byte+0x1c6                              ";
         971 : dbg_instr = "I2C_Tx_byte+0x1c7                              ";
         972 : dbg_instr = "I2C_Tx_byte+0x1c8                              ";
         973 : dbg_instr = "I2C_Tx_byte+0x1c9                              ";
         974 : dbg_instr = "I2C_Tx_byte+0x1ca                              ";
         975 : dbg_instr = "I2C_Tx_byte+0x1cb                              ";
         976 : dbg_instr = "I2C_Tx_byte+0x1cc                              ";
         977 : dbg_instr = "I2C_Tx_byte+0x1cd                              ";
         978 : dbg_instr = "I2C_Tx_byte+0x1ce                              ";
         979 : dbg_instr = "I2C_Tx_byte+0x1cf                              ";
         980 : dbg_instr = "I2C_Tx_byte+0x1d0                              ";
         981 : dbg_instr = "I2C_Tx_byte+0x1d1                              ";
         982 : dbg_instr = "I2C_Tx_byte+0x1d2                              ";
         983 : dbg_instr = "I2C_Tx_byte+0x1d3                              ";
         984 : dbg_instr = "I2C_Tx_byte+0x1d4                              ";
         985 : dbg_instr = "I2C_Tx_byte+0x1d5                              ";
         986 : dbg_instr = "I2C_Tx_byte+0x1d6                              ";
         987 : dbg_instr = "I2C_Tx_byte+0x1d7                              ";
         988 : dbg_instr = "I2C_Tx_byte+0x1d8                              ";
         989 : dbg_instr = "I2C_Tx_byte+0x1d9                              ";
         990 : dbg_instr = "I2C_Tx_byte+0x1da                              ";
         991 : dbg_instr = "I2C_Tx_byte+0x1db                              ";
         992 : dbg_instr = "I2C_Tx_byte+0x1dc                              ";
         993 : dbg_instr = "I2C_Tx_byte+0x1dd                              ";
         994 : dbg_instr = "I2C_Tx_byte+0x1de                              ";
         995 : dbg_instr = "I2C_Tx_byte+0x1df                              ";
         996 : dbg_instr = "I2C_Tx_byte+0x1e0                              ";
         997 : dbg_instr = "I2C_Tx_byte+0x1e1                              ";
         998 : dbg_instr = "I2C_Tx_byte+0x1e2                              ";
         999 : dbg_instr = "I2C_Tx_byte+0x1e3                              ";
         1000 : dbg_instr = "I2C_Tx_byte+0x1e4                              ";
         1001 : dbg_instr = "I2C_Tx_byte+0x1e5                              ";
         1002 : dbg_instr = "I2C_Tx_byte+0x1e6                              ";
         1003 : dbg_instr = "I2C_Tx_byte+0x1e7                              ";
         1004 : dbg_instr = "I2C_Tx_byte+0x1e8                              ";
         1005 : dbg_instr = "I2C_Tx_byte+0x1e9                              ";
         1006 : dbg_instr = "I2C_Tx_byte+0x1ea                              ";
         1007 : dbg_instr = "I2C_Tx_byte+0x1eb                              ";
         1008 : dbg_instr = "I2C_Tx_byte+0x1ec                              ";
         1009 : dbg_instr = "I2C_Tx_byte+0x1ed                              ";
         1010 : dbg_instr = "I2C_Tx_byte+0x1ee                              ";
         1011 : dbg_instr = "I2C_Tx_byte+0x1ef                              ";
         1012 : dbg_instr = "I2C_Tx_byte+0x1f0                              ";
         1013 : dbg_instr = "I2C_Tx_byte+0x1f1                              ";
         1014 : dbg_instr = "I2C_Tx_byte+0x1f2                              ";
         1015 : dbg_instr = "I2C_Tx_byte+0x1f3                              ";
         1016 : dbg_instr = "I2C_Tx_byte+0x1f4                              ";
         1017 : dbg_instr = "I2C_Tx_byte+0x1f5                              ";
         1018 : dbg_instr = "I2C_Tx_byte+0x1f6                              ";
         1019 : dbg_instr = "I2C_Tx_byte+0x1f7                              ";
         1020 : dbg_instr = "I2C_Tx_byte+0x1f8                              ";
         1021 : dbg_instr = "I2C_Tx_byte+0x1f9                              ";
         1022 : dbg_instr = "I2C_Tx_byte+0x1fa                              ";
         1023 : dbg_instr = "I2C_Tx_byte+0x1fb                              ";
     endcase
   end
// synthesis translate_on

RAMB16_S18 #(
    .INIT(18'h00000),

    // The following INIT_xx declarations specify the initial contents of the RAM
    // Address 0 to 255
    .INIT_00(256'h0A102011DC809B209C21D1401100D0C050022021D00190C020010098000400EC),
    .INIT_01(256'h5084014E0AB0B010014E5A03B000E01F4B069B219A20D140600AD14111010191),
    .INIT_02(256'h1A01500001747A10602DD4031AFF500060269F014F800025002400255000D0C0),
    .INIT_03(256'h1A02FA00FB0121AC136D054001281A00FF011F90DF009F050F40500001B5FF01),
    .INIT_04(256'h5000DA0101A250000022B00150009AFF0AC0E0429C01A0470125AAC0500000E7),
    .INIT_05(256'h2062DF02D3E2D4E1DFE01F022062DF019FE092A191A010006062B200B1009001),
    .INIT_06(256'h50001A20B0006070DA405000004A002301770022B0022066B0225000205E9FE0),
    .INIT_07(256'h1F4250001A80607EDA681A624A063A03DF004F00DA044A0E4A0E4A0E3B070BA0),
    .INIT_08(256'h1A011B03500001131F425000BA02500000420162FA025A01BA011C015000002F),
    .INIT_09(256'h0A40E0A6D4031401017C609DD4007001500001131F405000008B1A001B030095),
    .INIT_0A(256'h0B301500160860AE064016FD60D60050E0BED40520D6140160D60183DA009A01),
    .INIT_0B(256'hE0CAD40720D61401130060BDD320036020AFD5021501430E011943060A600AB0),
    .INIT_0C(256'h1401013860D6005060CED40720D6003DFF021F301A011BD360C9D40714010033),
    .INIT_0D(256'h4C0620E2DB001C0101543B070BA050007000D4E1DFE01F801300140360D6D40A),
    .INIT_0E(256'hB010008EB000193F5000018B004201620CA0500000E71A01FC00FA0120DD9B01),
    .INIT_0F(256'hD11091C0D1C011402106D001210FD00300A01AFF20F7D00890C0007FB000008E),

    // Address 256 to 511
    .INIT_10(256'h10A02111014E0A007002D1C0118001C52111D002014E0A007001D1C0110020FE),
    .INIT_11(256'h1A00016D002901466120DA20D500500001741AFF5000003DFF0250000159D0C0),
    .INIT_12(256'h01BF00650148A13401D961340082FA005000004D020421AC55406124D40301F4),
    .INIT_13(256'h0A501502613F95070540FF011F30B0105000018B1BFF1AFF213601710BA00063),
    .INIT_14(256'h01511F425000002F1F4050009901EA909901EB909901EC9021AC137401281A88),
    .INIT_15(256'h1300140092A191A01000193F700150001A984A0E4A0E3AF8500001131B015000),
    .INIT_16(256'hAB90190101715000AC901901016D5000004A0023B00200220177B02250007000),
    .INIT_17(256'hB01000D91A00B00050002178DF019F00B011500001511F405000AA9019015000),
    .INIT_18(256'hB022002301770022B00250001A0000E71A01FA011A28FA001A00500000D91A00),
    .INIT_19(256'h1A03FB02FA035B30006BFB00FC014C004B064C004B064C004B064C004B065000),
    .INIT_1A(256'hDB60DA61D58005305000004A00244A00DF029F00002401770022B022500000E7),
    .INIT_1B(256'h1A015000018B1AFF21BD0063A1BC01D961BC0082FA00500001741A0050003501),
    .INIT_1C(256'h01FC1B001A0201FC1B001A0101FC1B001A00D8001801500001A221C0DA8001A2),
    .INIT_1D(256'h1E800DA0500001BF900001250162500061C6980101FC1B001A0401FC1B021A03),
    .INIT_1E(256'h1F00FA0101545000E1E04E0E01747A020171017401481A0021E51A0421E4CDE0),
    .INIT_1F(256'h01DE017101B201465000012B1A2900D9017101ED0AB00148500000E71A01FF00),

    // Address 512 to 767
    .INIT_20(256'h000000005000E2054B0E0066B002220AB0222209CBA01B805000011601DE0171),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // Address 768 to 1023
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // The next set of INITP_xx are for the parity bits
    // Address 0 to 255
    .INITP_00(256'h235491508B6AAAA8CA8C00D58AA9378A2A08892A28D2D6AA228B42D6302230AA),
    .INITP_01(256'h08CC0C2AA8AA28A97482E80D6EDA80D6D935C594074ED9E934B7A2820A23A80A),

    // Address 256 to 511
    .INITP_02(256'hA2B0A8861A1AAAAB000E54A28A2666891D22A0A2ABBAAA362ADA8AAA2822C823),
    .INITP_03(256'hAAA2A2A22AD8A88C0AEAD820820822B228AEEA88A9A90AAA28A95556AAA62228),

    // Address 512 to 767
    .INITP_04(256'h000000000000000000000000000000000000000000000000000000000B6AB0AA),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // Address 768 to 1023
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // Output value upon SSR assertion
    .SRVAL(18'h000000),
    .WRITE_MODE("WRITE_FIRST")
) ram_1024_x_18(
    .DI  (16'h0000),
    .DIP  (2'b00),
    .EN (1'b1),
    .WE (1'b0),
    .SSR (1'b0),
    .CLK (clk),
    .ADDR (address),
    .DO (instruction[15:0]),
    .DOP (instruction[17:16])
);

endmodule
