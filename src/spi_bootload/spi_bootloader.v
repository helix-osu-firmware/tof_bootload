/*
 * == pblaze-cc ==
 * source : spi_bootloader.c
 * create : Fri Jan 10 12:19:02 2020
 * modify : Fri Jan 10 12:19:02 2020
 */
`timescale 1 ps / 1ps

/* 
 * == pblaze-as ==
 * source : spi_bootloader.s
 * create : Fri Jan 10 12:20:35 2020
 * modify : Fri Jan 10 12:20:35 2020
 */
/* 
 * == pblaze-ld ==
 * target : kcpsm3
 */

module spi_bootloader (address, instruction, clk);
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
         3 : dbg_instr = "SPI_Flash_tx_address                           ";
         4 : dbg_instr = "SPI_Flash_tx_stack2                            ";
         5 : dbg_instr = "SPI_Flash_tx_stack                             ";
         6 : dbg_instr = "SPI_Flash_tx_stack+0x001                       ";
         7 : dbg_instr = "SPI_Flash_tx_stack+0x002                       ";
         8 : dbg_instr = "SPI_tx_rx_twice                                ";
         9 : dbg_instr = "SPI_tx_rx                                      ";
         10 : dbg_instr = "SPI_tx_rx+0x001                                ";
         11 : dbg_instr = "SPI_tx_rx+0x002                                ";
         12 : dbg_instr = "SPI_tx_rx+0x003                                ";
         13 : dbg_instr = "SPI_tx_rx+0x004                                ";
         14 : dbg_instr = "SPI_tx_rx+0x005                                ";
         15 : dbg_instr = "SPI_tx_rx+0x006                                ";
         16 : dbg_instr = "SPI_tx_rx+0x007                                ";
         17 : dbg_instr = "SPI_tx_rx+0x008                                ";
         18 : dbg_instr = "SPI_tx_rx+0x009                                ";
         19 : dbg_instr = "SPI_tx_rx+0x00a                                ";
         20 : dbg_instr = "SPI_Flash_read_begin                           ";
         21 : dbg_instr = "SPI_Flash_read_begin+0x001                     ";
         22 : dbg_instr = "SPI_Flash_read_begin+0x002                     ";
         23 : dbg_instr = "SPI_Flash_read_begin+0x003                     ";
         24 : dbg_instr = "SPI_Flash_read_begin+0x004                     ";
         25 : dbg_instr = "SPI_Flash_read_begin+0x005                     ";
         26 : dbg_instr = "SPI_Flash_read_begin+0x006                     ";
         27 : dbg_instr = "SPI_Flash_read_begin+0x007                     ";
         28 : dbg_instr = "SPI_Flash_read_begin+0x008                     ";
         29 : dbg_instr = "SPI_Flash_read_begin+0x009                     ";
         30 : dbg_instr = "SPI_Flash_read_begin+0x00a                     ";
         31 : dbg_instr = "SPI_Flash_erase_nonvolatile_lock_bits          ";
         32 : dbg_instr = "SPI_Flash_erase_nonvolatile_lock_bits+0x001    ";
         33 : dbg_instr = "SPI_Flash_erase_nonvolatile_lock_bits+0x002    ";
         34 : dbg_instr = "SPI_Flash_erase_nonvolatile_lock_bits+0x003    ";
         35 : dbg_instr = "SPI_Flash_erase_nonvolatile_lock_bits+0x004    ";
         36 : dbg_instr = "SPI_disable_and_return                         ";
         37 : dbg_instr = "SPI_disable_and_return+0x001                   ";
         38 : dbg_instr = "SPI_Flash_write_begin                          ";
         39 : dbg_instr = "SPI_Flash_write_begin+0x001                    ";
         40 : dbg_instr = "SPI_Flash_write_begin+0x002                    ";
         41 : dbg_instr = "SPI_Flash_write_begin+0x003                    ";
         42 : dbg_instr = "SPI_Flash_write_begin+0x004                    ";
         43 : dbg_instr = "SPI_Flash_write_begin+0x005                    ";
         44 : dbg_instr = "SPI_Flash_write_begin+0x006                    ";
         45 : dbg_instr = "SPI_Flash_write_begin+0x007                    ";
         46 : dbg_instr = "SPI_Flash_write_begin+0x008                    ";
         47 : dbg_instr = "SPI_Flash_write_begin+0x009                    ";
         48 : dbg_instr = "SPI_Flash_write_begin+0x00a                    ";
         49 : dbg_instr = "SPI_Flash_write_begin+0x00b                    ";
         50 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits          ";
         51 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x001    ";
         52 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x002    ";
         53 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x003    ";
         54 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x004    ";
         55 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x005    ";
         56 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x006    ";
         57 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x007    ";
         58 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x008    ";
         59 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x009    ";
         60 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x00a    ";
         61 : dbg_instr = "SPI_Flash_write_nonvolatile_lock_bits+0x00b    ";
         62 : dbg_instr = "SPI_Flash_single_command                       ";
         63 : dbg_instr = "SPI_Flash_single_command+0x001                 ";
         64 : dbg_instr = "SPI_Flash_single_command+0x002                 ";
         65 : dbg_instr = "SPI_Flash_read_SR                              ";
         66 : dbg_instr = "SPI_Flash_read_SR+0x001                        ";
         67 : dbg_instr = "SPI_Flash_read_SR+0x002                        ";
         68 : dbg_instr = "SPI_Flash_read_SR+0x003                        ";
         69 : dbg_instr = "init                                           ";
         70 : dbg_instr = "init+0x001                                     ";
         71 : dbg_instr = "get_arguments                                  ";
         72 : dbg_instr = "get_arguments+0x001                            ";
         73 : dbg_instr = "get_arguments+0x002                            ";
         74 : dbg_instr = "get_arguments+0x003                            ";
         75 : dbg_instr = "get_arguments+0x004                            ";
         76 : dbg_instr = "SPI_Flash_erase_sector                         ";
         77 : dbg_instr = "SPI_Flash_erase_sector+0x001                   ";
         78 : dbg_instr = "SPI_Flash_erase_sector+0x002                   ";
         79 : dbg_instr = "SPI_Flash_erase_sector+0x003                   ";
         80 : dbg_instr = "SPI_Flash_erase_sector+0x004                   ";
         81 : dbg_instr = "SPI_Flash_erase_sector+0x005                   ";
         82 : dbg_instr = "SPI_Flash_erase_sector+0x006                   ";
         83 : dbg_instr = "SPI_Flash_erase_sector+0x007                   ";
         84 : dbg_instr = "SPI_Flash_erase_sector+0x008                   ";
         85 : dbg_instr = "SPI_Flash_erase_sector+0x009                   ";
         86 : dbg_instr = "SPI_Flash_erase_sector+0x00a                   ";
         87 : dbg_instr = "SPI_Flash_erase_sector+0x00b                   ";
         88 : dbg_instr = "SPI_Flash_erase_sector_wait                    ";
         89 : dbg_instr = "SPI_Flash_erase_sector_wait+0x001              ";
         90 : dbg_instr = "push3                                          ";
         91 : dbg_instr = "push3+0x001                                    ";
         92 : dbg_instr = "push2                                          ";
         93 : dbg_instr = "push2+0x001                                    ";
         94 : dbg_instr = "push1                                          ";
         95 : dbg_instr = "push1+0x001                                    ";
         96 : dbg_instr = "push1+0x002                                    ";
         97 : dbg_instr = "SPI_STARTUP_initialize                         ";
         98 : dbg_instr = "SPI_STARTUP_initialize+0x001                   ";
         99 : dbg_instr = "SPI_STARTUP_initialize+0x002                   ";
         100 : dbg_instr = "SPI_STARTUP_initialize+0x003                   ";
         101 : dbg_instr = "SPI_STARTUP_initialize+0x004                   ";
         102 : dbg_instr = "SPI_STARTUP_initialize+0x005                   ";
         103 : dbg_instr = "SPI_STARTUP_initialize+0x006                   ";
         104 : dbg_instr = "SPI_Flash_reset                                ";
         105 : dbg_instr = "SPI_Flash_reset+0x001                          ";
         106 : dbg_instr = "SPI_Flash_reset+0x002                          ";
         107 : dbg_instr = "SPI_Flash_reset+0x003                          ";
         108 : dbg_instr = "SPI_Flash_reset+0x004                          ";
         109 : dbg_instr = "SPI_Flash_reset+0x005                          ";
         110 : dbg_instr = "SPI_Flash_reset+0x006                          ";
         111 : dbg_instr = "pop3                                           ";
         112 : dbg_instr = "pop3+0x001                                     ";
         113 : dbg_instr = "pop3+0x002                                     ";
         114 : dbg_instr = "pop3+0x003                                     ";
         115 : dbg_instr = "pop2                                           ";
         116 : dbg_instr = "pop2+0x001                                     ";
         117 : dbg_instr = "pop2+0x002                                     ";
         118 : dbg_instr = "pop2+0x003                                     ";
         119 : dbg_instr = "pop1                                           ";
         120 : dbg_instr = "pop1+0x001                                     ";
         121 : dbg_instr = "pop1+0x002                                     ";
         122 : dbg_instr = "command_complete_with_timeout                  ";
         123 : dbg_instr = "command_complete_with_timeout+0x001            ";
         124 : dbg_instr = "command_complete_with_timeout+0x002            ";
         125 : dbg_instr = "command_complete_with_timeout+0x003            ";
         126 : dbg_instr = "command_finish                                 ";
         127 : dbg_instr = "command_finish+0x001                           ";
         128 : dbg_instr = "command_finish+0x002                           ";
         129 : dbg_instr = "SPI_Flash_read_ID                              ";
         130 : dbg_instr = "SPI_Flash_read_ID+0x001                        ";
         131 : dbg_instr = "SPI_Flash_read_ID+0x002                        ";
         132 : dbg_instr = "SPI_Flash_read_ID+0x003                        ";
         133 : dbg_instr = "SPI_Flash_read_ID+0x004                        ";
         134 : dbg_instr = "SPI_Flash_read_ID+0x005                        ";
         135 : dbg_instr = "SPI_Flash_read_ID+0x006                        ";
         136 : dbg_instr = "SPI_Flash_read_ID+0x007                        ";
         137 : dbg_instr = "SPI_Flash_read_ID+0x008                        ";
         138 : dbg_instr = "SPI_Flash_read_ID+0x009                        ";
         139 : dbg_instr = "check_command                                  ";
         140 : dbg_instr = "check_command+0x001                            ";
         141 : dbg_instr = "check_command+0x002                            ";
         142 : dbg_instr = "check_command+0x003                            ";
         143 : dbg_instr = "check_command+0x004                            ";
         144 : dbg_instr = "check_command+0x005                            ";
         145 : dbg_instr = "check_command+0x006                            ";
         146 : dbg_instr = "check_command+0x007                            ";
         147 : dbg_instr = "check_command+0x008                            ";
         148 : dbg_instr = "check_command+0x009                            ";
         149 : dbg_instr = "check_command+0x00a                            ";
         150 : dbg_instr = "check_command+0x00b                            ";
         151 : dbg_instr = "check_command+0x00c                            ";
         152 : dbg_instr = "check_command+0x00d                            ";
         153 : dbg_instr = "check_command+0x00e                            ";
         154 : dbg_instr = "check_command+0x00f                            ";
         155 : dbg_instr = "check_command+0x010                            ";
         156 : dbg_instr = "check_command+0x011                            ";
         157 : dbg_instr = "check_command+0x012                            ";
         158 : dbg_instr = "check_command+0x013                            ";
         159 : dbg_instr = "check_command+0x014                            ";
         160 : dbg_instr = "check_command+0x015                            ";
         161 : dbg_instr = "check_command+0x016                            ";
         162 : dbg_instr = "check_command+0x017                            ";
         163 : dbg_instr = "check_command+0x018                            ";
         164 : dbg_instr = "check_command+0x019                            ";
         165 : dbg_instr = "check_command+0x01a                            ";
         166 : dbg_instr = "check_command+0x01b                            ";
         167 : dbg_instr = "check_command+0x01c                            ";
         168 : dbg_instr = "check_command+0x01d                            ";
         169 : dbg_instr = "check_command+0x01e                            ";
         170 : dbg_instr = "check_command+0x01f                            ";
         171 : dbg_instr = "check_command+0x020                            ";
         172 : dbg_instr = "check_command+0x021                            ";
         173 : dbg_instr = "check_command+0x022                            ";
         174 : dbg_instr = "check_command+0x023                            ";
         175 : dbg_instr = "check_command+0x024                            ";
         176 : dbg_instr = "check_command+0x025                            ";
         177 : dbg_instr = "check_command+0x026                            ";
         178 : dbg_instr = "check_command+0x027                            ";
         179 : dbg_instr = "check_command+0x028                            ";
         180 : dbg_instr = "check_command+0x029                            ";
         181 : dbg_instr = "check_command+0x02a                            ";
         182 : dbg_instr = "check_command+0x02b                            ";
         183 : dbg_instr = "check_command+0x02c                            ";
         184 : dbg_instr = "check_command+0x02d                            ";
         185 : dbg_instr = "check_command+0x02e                            ";
         186 : dbg_instr = "check_command+0x02f                            ";
         187 : dbg_instr = "check_command+0x030                            ";
         188 : dbg_instr = "check_command+0x031                            ";
         189 : dbg_instr = "check_command+0x032                            ";
         190 : dbg_instr = "check_command+0x033                            ";
         191 : dbg_instr = "check_command+0x034                            ";
         192 : dbg_instr = "check_command+0x035                            ";
         193 : dbg_instr = "check_command+0x036                            ";
         194 : dbg_instr = "check_command+0x037                            ";
         195 : dbg_instr = "check_command+0x038                            ";
         196 : dbg_instr = "check_command+0x039                            ";
         197 : dbg_instr = "check_command+0x03a                            ";
         198 : dbg_instr = "check_command+0x03b                            ";
         199 : dbg_instr = "check_command+0x03c                            ";
         200 : dbg_instr = "check_command+0x03d                            ";
         201 : dbg_instr = "check_command+0x03e                            ";
         202 : dbg_instr = "check_command+0x03f                            ";
         203 : dbg_instr = "check_command+0x040                            ";
         204 : dbg_instr = "check_command+0x041                            ";
         205 : dbg_instr = "check_command+0x042                            ";
         206 : dbg_instr = "check_command+0x043                            ";
         207 : dbg_instr = "check_command+0x044                            ";
         208 : dbg_instr = "check_command+0x045                            ";
         209 : dbg_instr = "check_command+0x046                            ";
         210 : dbg_instr = "check_command+0x047                            ";
         211 : dbg_instr = "check_command+0x048                            ";
         212 : dbg_instr = "check_command+0x049                            ";
         213 : dbg_instr = "check_command+0x04a                            ";
         214 : dbg_instr = "check_command+0x04b                            ";
         215 : dbg_instr = "check_command+0x04c                            ";
         216 : dbg_instr = "check_command+0x04d                            ";
         217 : dbg_instr = "check_command+0x04e                            ";
         218 : dbg_instr = "check_command+0x04f                            ";
         219 : dbg_instr = "check_command+0x050                            ";
         220 : dbg_instr = "check_command+0x051                            ";
         221 : dbg_instr = "check_command+0x052                            ";
         222 : dbg_instr = "check_command+0x053                            ";
         223 : dbg_instr = "SPI_Flash_write_complete                       ";
         224 : dbg_instr = "SPI_Flash_write_complete+0x001                 ";
         225 : dbg_instr = "SPI_Flash_write_complete+0x002                 ";
         226 : dbg_instr = "SPI_Flash_write_complete+0x003                 ";
         227 : dbg_instr = "SPI_Flash_write_complete+0x004                 ";
         228 : dbg_instr = "SPI_Flash_write_complete+0x005                 ";
         229 : dbg_instr = "SPI_Flash_write_complete+0x006                 ";
         230 : dbg_instr = "SPI_Flash_write_complete+0x007                 ";
         231 : dbg_instr = "SPI_Flash_wait_WIP                             ";
         232 : dbg_instr = "SPI_Flash_wait_WIP+0x001                       ";
         233 : dbg_instr = "SPI_Flash_wait_WIP+0x002                       ";
         234 : dbg_instr = "SPI_Flash_wait_WIP+0x003                       ";
         235 : dbg_instr = "SPI_Flash_wait_WIP+0x004                       ";
         236 : dbg_instr = "SPI_Flash_wait_WIP+0x005                       ";
         237 : dbg_instr = "SPI_Flash_wait_WIP+0x006                       ";
         238 : dbg_instr = "SPI_Flash_wait_WIP+0x007                       ";
         239 : dbg_instr = "SPI_Flash_wait_WIP+0x008                       ";
         240 : dbg_instr = "SPI_Flash_wait_WIP+0x009                       ";
         241 : dbg_instr = "SPI_Flash_wait_WIP+0x00a                       ";
         242 : dbg_instr = "SPI_Flash_wait_WIP+0x00b                       ";
         243 : dbg_instr = "SPI_Flash_wait_WIP+0x00c                       ";
         244 : dbg_instr = "SPI_Flash_wait_WIP+0x00d                       ";
         245 : dbg_instr = "SPI_Flash_wait_WIP+0x00e                       ";
         246 : dbg_instr = "SPI_Flash_wait_WIP+0x00f                       ";
         247 : dbg_instr = "SPI_Flash_wait_WIP+0x010                       ";
         248 : dbg_instr = "spiisr                                         ";
         249 : dbg_instr = "spiisr+0x001                                   ";
         250 : dbg_instr = "spiisr+0x002                                   ";
         251 : dbg_instr = "spiisr+0x003                                   ";
         252 : dbg_instr = "spiisr+0x004                                   ";
         253 : dbg_instr = "spiisr+0x005                                   ";
         254 : dbg_instr = "spiisr+0x006                                   ";
         255 : dbg_instr = "spiisr+0x007                                   ";
         256 : dbg_instr = "spiisr+0x008                                   ";
         257 : dbg_instr = "spiisr+0x009                                   ";
         258 : dbg_instr = "spiisr+0x00a                                   ";
         259 : dbg_instr = "spiisr+0x00b                                   ";
         260 : dbg_instr = "spiisr+0x00c                                   ";
         261 : dbg_instr = "spiisr+0x00d                                   ";
         262 : dbg_instr = "spiisr+0x00e                                   ";
         263 : dbg_instr = "spiisr+0x00f                                   ";
         264 : dbg_instr = "spiisr+0x010                                   ";
         265 : dbg_instr = "spiisr+0x011                                   ";
         266 : dbg_instr = "spiisr+0x012                                   ";
         267 : dbg_instr = "spiisr+0x013                                   ";
         268 : dbg_instr = "spiisr+0x014                                   ";
         269 : dbg_instr = "spiisr+0x015                                   ";
         270 : dbg_instr = "spiisr+0x016                                   ";
         271 : dbg_instr = "spiisr+0x017                                   ";
         272 : dbg_instr = "spiisr+0x018                                   ";
         273 : dbg_instr = "spiisr+0x019                                   ";
         274 : dbg_instr = "spiisr+0x01a                                   ";
         275 : dbg_instr = "spiisr+0x01b                                   ";
         276 : dbg_instr = "spiisr+0x01c                                   ";
         277 : dbg_instr = "spiisr+0x01d                                   ";
         278 : dbg_instr = "spiisr+0x01e                                   ";
         279 : dbg_instr = "spiisr+0x01f                                   ";
         280 : dbg_instr = "spiisr+0x020                                   ";
         281 : dbg_instr = "spiisr+0x021                                   ";
         282 : dbg_instr = "spiisr+0x022                                   ";
         283 : dbg_instr = "spiisr+0x023                                   ";
         284 : dbg_instr = "spiisr+0x024                                   ";
         285 : dbg_instr = "spiisr+0x025                                   ";
         286 : dbg_instr = "spiisr+0x026                                   ";
         287 : dbg_instr = "spiisr+0x027                                   ";
         288 : dbg_instr = "spiisr+0x028                                   ";
         289 : dbg_instr = "spiisr+0x029                                   ";
         290 : dbg_instr = "spiisr+0x02a                                   ";
         291 : dbg_instr = "spiisr+0x02b                                   ";
         292 : dbg_instr = "spiisr+0x02c                                   ";
         293 : dbg_instr = "spiisr+0x02d                                   ";
         294 : dbg_instr = "spiisr+0x02e                                   ";
         295 : dbg_instr = "spiisr+0x02f                                   ";
         296 : dbg_instr = "spiisr+0x030                                   ";
         297 : dbg_instr = "spiisr+0x031                                   ";
         298 : dbg_instr = "spiisr+0x032                                   ";
         299 : dbg_instr = "spiisr+0x033                                   ";
         300 : dbg_instr = "spiisr+0x034                                   ";
         301 : dbg_instr = "spiisr+0x035                                   ";
         302 : dbg_instr = "spiisr+0x036                                   ";
         303 : dbg_instr = "spiisr+0x037                                   ";
         304 : dbg_instr = "spiisr+0x038                                   ";
         305 : dbg_instr = "spiisr+0x039                                   ";
         306 : dbg_instr = "spiisr+0x03a                                   ";
         307 : dbg_instr = "spiisr+0x03b                                   ";
         308 : dbg_instr = "spiisr+0x03c                                   ";
         309 : dbg_instr = "spiisr+0x03d                                   ";
         310 : dbg_instr = "spiisr+0x03e                                   ";
         311 : dbg_instr = "spiisr+0x03f                                   ";
         312 : dbg_instr = "spiisr+0x040                                   ";
         313 : dbg_instr = "spiisr+0x041                                   ";
         314 : dbg_instr = "spiisr+0x042                                   ";
         315 : dbg_instr = "spiisr+0x043                                   ";
         316 : dbg_instr = "spiisr+0x044                                   ";
         317 : dbg_instr = "spiisr+0x045                                   ";
         318 : dbg_instr = "spiisr+0x046                                   ";
         319 : dbg_instr = "spiisr+0x047                                   ";
         320 : dbg_instr = "spiisr+0x048                                   ";
         321 : dbg_instr = "spiisr+0x049                                   ";
         322 : dbg_instr = "spiisr+0x04a                                   ";
         323 : dbg_instr = "spiisr+0x04b                                   ";
         324 : dbg_instr = "spiisr+0x04c                                   ";
         325 : dbg_instr = "spiisr+0x04d                                   ";
         326 : dbg_instr = "spiisr+0x04e                                   ";
         327 : dbg_instr = "spiisr+0x04f                                   ";
         328 : dbg_instr = "spiisr+0x050                                   ";
         329 : dbg_instr = "spiisr+0x051                                   ";
         330 : dbg_instr = "spiisr+0x052                                   ";
         331 : dbg_instr = "spiisr+0x053                                   ";
         332 : dbg_instr = "spiisr+0x054                                   ";
         333 : dbg_instr = "spiisr+0x055                                   ";
         334 : dbg_instr = "spiisr+0x056                                   ";
         335 : dbg_instr = "spiisr+0x057                                   ";
         336 : dbg_instr = "spiisr+0x058                                   ";
         337 : dbg_instr = "spiisr+0x059                                   ";
         338 : dbg_instr = "spiisr+0x05a                                   ";
         339 : dbg_instr = "spiisr+0x05b                                   ";
         340 : dbg_instr = "spiisr+0x05c                                   ";
         341 : dbg_instr = "spiisr+0x05d                                   ";
         342 : dbg_instr = "spiisr+0x05e                                   ";
         343 : dbg_instr = "spiisr+0x05f                                   ";
         344 : dbg_instr = "spiisr+0x060                                   ";
         345 : dbg_instr = "spiisr+0x061                                   ";
         346 : dbg_instr = "spiisr+0x062                                   ";
         347 : dbg_instr = "spiisr+0x063                                   ";
         348 : dbg_instr = "spiisr+0x064                                   ";
         349 : dbg_instr = "spiisr+0x065                                   ";
         350 : dbg_instr = "spiisr+0x066                                   ";
         351 : dbg_instr = "spiisr+0x067                                   ";
         352 : dbg_instr = "spiisr+0x068                                   ";
         353 : dbg_instr = "spiisr+0x069                                   ";
         354 : dbg_instr = "spiisr+0x06a                                   ";
         355 : dbg_instr = "spiisr+0x06b                                   ";
         356 : dbg_instr = "spiisr+0x06c                                   ";
         357 : dbg_instr = "spiisr+0x06d                                   ";
         358 : dbg_instr = "spiisr+0x06e                                   ";
         359 : dbg_instr = "spiisr+0x06f                                   ";
         360 : dbg_instr = "spiisr+0x070                                   ";
         361 : dbg_instr = "spiisr+0x071                                   ";
         362 : dbg_instr = "spiisr+0x072                                   ";
         363 : dbg_instr = "spiisr+0x073                                   ";
         364 : dbg_instr = "spiisr+0x074                                   ";
         365 : dbg_instr = "spiisr+0x075                                   ";
         366 : dbg_instr = "spiisr+0x076                                   ";
         367 : dbg_instr = "spiisr+0x077                                   ";
         368 : dbg_instr = "spiisr+0x078                                   ";
         369 : dbg_instr = "spiisr+0x079                                   ";
         370 : dbg_instr = "spiisr+0x07a                                   ";
         371 : dbg_instr = "spiisr+0x07b                                   ";
         372 : dbg_instr = "spiisr+0x07c                                   ";
         373 : dbg_instr = "spiisr+0x07d                                   ";
         374 : dbg_instr = "spiisr+0x07e                                   ";
         375 : dbg_instr = "spiisr+0x07f                                   ";
         376 : dbg_instr = "spiisr+0x080                                   ";
         377 : dbg_instr = "spiisr+0x081                                   ";
         378 : dbg_instr = "spiisr+0x082                                   ";
         379 : dbg_instr = "spiisr+0x083                                   ";
         380 : dbg_instr = "spiisr+0x084                                   ";
         381 : dbg_instr = "spiisr+0x085                                   ";
         382 : dbg_instr = "spiisr+0x086                                   ";
         383 : dbg_instr = "spiisr+0x087                                   ";
         384 : dbg_instr = "spiisr+0x088                                   ";
         385 : dbg_instr = "spiisr+0x089                                   ";
         386 : dbg_instr = "spiisr+0x08a                                   ";
         387 : dbg_instr = "spiisr+0x08b                                   ";
         388 : dbg_instr = "spiisr+0x08c                                   ";
         389 : dbg_instr = "spiisr+0x08d                                   ";
         390 : dbg_instr = "spiisr+0x08e                                   ";
         391 : dbg_instr = "spiisr+0x08f                                   ";
         392 : dbg_instr = "spiisr+0x090                                   ";
         393 : dbg_instr = "spiisr+0x091                                   ";
         394 : dbg_instr = "spiisr+0x092                                   ";
         395 : dbg_instr = "spiisr+0x093                                   ";
         396 : dbg_instr = "spiisr+0x094                                   ";
         397 : dbg_instr = "spiisr+0x095                                   ";
         398 : dbg_instr = "spiisr+0x096                                   ";
         399 : dbg_instr = "spiisr+0x097                                   ";
         400 : dbg_instr = "spiisr+0x098                                   ";
         401 : dbg_instr = "spiisr+0x099                                   ";
         402 : dbg_instr = "spiisr+0x09a                                   ";
         403 : dbg_instr = "spiisr+0x09b                                   ";
         404 : dbg_instr = "spiisr+0x09c                                   ";
         405 : dbg_instr = "spiisr+0x09d                                   ";
         406 : dbg_instr = "spiisr+0x09e                                   ";
         407 : dbg_instr = "spiisr+0x09f                                   ";
         408 : dbg_instr = "spiisr+0x0a0                                   ";
         409 : dbg_instr = "spiisr+0x0a1                                   ";
         410 : dbg_instr = "spiisr+0x0a2                                   ";
         411 : dbg_instr = "spiisr+0x0a3                                   ";
         412 : dbg_instr = "spiisr+0x0a4                                   ";
         413 : dbg_instr = "spiisr+0x0a5                                   ";
         414 : dbg_instr = "spiisr+0x0a6                                   ";
         415 : dbg_instr = "spiisr+0x0a7                                   ";
         416 : dbg_instr = "spiisr+0x0a8                                   ";
         417 : dbg_instr = "spiisr+0x0a9                                   ";
         418 : dbg_instr = "spiisr+0x0aa                                   ";
         419 : dbg_instr = "spiisr+0x0ab                                   ";
         420 : dbg_instr = "spiisr+0x0ac                                   ";
         421 : dbg_instr = "spiisr+0x0ad                                   ";
         422 : dbg_instr = "spiisr+0x0ae                                   ";
         423 : dbg_instr = "spiisr+0x0af                                   ";
         424 : dbg_instr = "spiisr+0x0b0                                   ";
         425 : dbg_instr = "spiisr+0x0b1                                   ";
         426 : dbg_instr = "spiisr+0x0b2                                   ";
         427 : dbg_instr = "spiisr+0x0b3                                   ";
         428 : dbg_instr = "spiisr+0x0b4                                   ";
         429 : dbg_instr = "spiisr+0x0b5                                   ";
         430 : dbg_instr = "spiisr+0x0b6                                   ";
         431 : dbg_instr = "spiisr+0x0b7                                   ";
         432 : dbg_instr = "spiisr+0x0b8                                   ";
         433 : dbg_instr = "spiisr+0x0b9                                   ";
         434 : dbg_instr = "spiisr+0x0ba                                   ";
         435 : dbg_instr = "spiisr+0x0bb                                   ";
         436 : dbg_instr = "spiisr+0x0bc                                   ";
         437 : dbg_instr = "spiisr+0x0bd                                   ";
         438 : dbg_instr = "spiisr+0x0be                                   ";
         439 : dbg_instr = "spiisr+0x0bf                                   ";
         440 : dbg_instr = "spiisr+0x0c0                                   ";
         441 : dbg_instr = "spiisr+0x0c1                                   ";
         442 : dbg_instr = "spiisr+0x0c2                                   ";
         443 : dbg_instr = "spiisr+0x0c3                                   ";
         444 : dbg_instr = "spiisr+0x0c4                                   ";
         445 : dbg_instr = "spiisr+0x0c5                                   ";
         446 : dbg_instr = "spiisr+0x0c6                                   ";
         447 : dbg_instr = "spiisr+0x0c7                                   ";
         448 : dbg_instr = "spiisr+0x0c8                                   ";
         449 : dbg_instr = "spiisr+0x0c9                                   ";
         450 : dbg_instr = "spiisr+0x0ca                                   ";
         451 : dbg_instr = "spiisr+0x0cb                                   ";
         452 : dbg_instr = "spiisr+0x0cc                                   ";
         453 : dbg_instr = "spiisr+0x0cd                                   ";
         454 : dbg_instr = "spiisr+0x0ce                                   ";
         455 : dbg_instr = "spiisr+0x0cf                                   ";
         456 : dbg_instr = "spiisr+0x0d0                                   ";
         457 : dbg_instr = "spiisr+0x0d1                                   ";
         458 : dbg_instr = "spiisr+0x0d2                                   ";
         459 : dbg_instr = "spiisr+0x0d3                                   ";
         460 : dbg_instr = "spiisr+0x0d4                                   ";
         461 : dbg_instr = "spiisr+0x0d5                                   ";
         462 : dbg_instr = "spiisr+0x0d6                                   ";
         463 : dbg_instr = "spiisr+0x0d7                                   ";
         464 : dbg_instr = "spiisr+0x0d8                                   ";
         465 : dbg_instr = "spiisr+0x0d9                                   ";
         466 : dbg_instr = "spiisr+0x0da                                   ";
         467 : dbg_instr = "spiisr+0x0db                                   ";
         468 : dbg_instr = "spiisr+0x0dc                                   ";
         469 : dbg_instr = "spiisr+0x0dd                                   ";
         470 : dbg_instr = "spiisr+0x0de                                   ";
         471 : dbg_instr = "spiisr+0x0df                                   ";
         472 : dbg_instr = "spiisr+0x0e0                                   ";
         473 : dbg_instr = "spiisr+0x0e1                                   ";
         474 : dbg_instr = "spiisr+0x0e2                                   ";
         475 : dbg_instr = "spiisr+0x0e3                                   ";
         476 : dbg_instr = "spiisr+0x0e4                                   ";
         477 : dbg_instr = "spiisr+0x0e5                                   ";
         478 : dbg_instr = "spiisr+0x0e6                                   ";
         479 : dbg_instr = "spiisr+0x0e7                                   ";
         480 : dbg_instr = "spiisr+0x0e8                                   ";
         481 : dbg_instr = "spiisr+0x0e9                                   ";
         482 : dbg_instr = "spiisr+0x0ea                                   ";
         483 : dbg_instr = "spiisr+0x0eb                                   ";
         484 : dbg_instr = "spiisr+0x0ec                                   ";
         485 : dbg_instr = "spiisr+0x0ed                                   ";
         486 : dbg_instr = "spiisr+0x0ee                                   ";
         487 : dbg_instr = "spiisr+0x0ef                                   ";
         488 : dbg_instr = "spiisr+0x0f0                                   ";
         489 : dbg_instr = "spiisr+0x0f1                                   ";
         490 : dbg_instr = "spiisr+0x0f2                                   ";
         491 : dbg_instr = "spiisr+0x0f3                                   ";
         492 : dbg_instr = "spiisr+0x0f4                                   ";
         493 : dbg_instr = "spiisr+0x0f5                                   ";
         494 : dbg_instr = "spiisr+0x0f6                                   ";
         495 : dbg_instr = "spiisr+0x0f7                                   ";
         496 : dbg_instr = "spiisr+0x0f8                                   ";
         497 : dbg_instr = "spiisr+0x0f9                                   ";
         498 : dbg_instr = "spiisr+0x0fa                                   ";
         499 : dbg_instr = "spiisr+0x0fb                                   ";
         500 : dbg_instr = "spiisr+0x0fc                                   ";
         501 : dbg_instr = "spiisr+0x0fd                                   ";
         502 : dbg_instr = "spiisr+0x0fe                                   ";
         503 : dbg_instr = "spiisr+0x0ff                                   ";
         504 : dbg_instr = "spiisr+0x100                                   ";
         505 : dbg_instr = "spiisr+0x101                                   ";
         506 : dbg_instr = "spiisr+0x102                                   ";
         507 : dbg_instr = "spiisr+0x103                                   ";
         508 : dbg_instr = "spiisr+0x104                                   ";
         509 : dbg_instr = "spiisr+0x105                                   ";
         510 : dbg_instr = "spiisr+0x106                                   ";
         511 : dbg_instr = "spiisr+0x107                                   ";
         512 : dbg_instr = "spiisr+0x108                                   ";
         513 : dbg_instr = "spiisr+0x109                                   ";
         514 : dbg_instr = "spiisr+0x10a                                   ";
         515 : dbg_instr = "spiisr+0x10b                                   ";
         516 : dbg_instr = "spiisr+0x10c                                   ";
         517 : dbg_instr = "spiisr+0x10d                                   ";
         518 : dbg_instr = "spiisr+0x10e                                   ";
         519 : dbg_instr = "spiisr+0x10f                                   ";
         520 : dbg_instr = "spiisr+0x110                                   ";
         521 : dbg_instr = "spiisr+0x111                                   ";
         522 : dbg_instr = "spiisr+0x112                                   ";
         523 : dbg_instr = "spiisr+0x113                                   ";
         524 : dbg_instr = "spiisr+0x114                                   ";
         525 : dbg_instr = "spiisr+0x115                                   ";
         526 : dbg_instr = "spiisr+0x116                                   ";
         527 : dbg_instr = "spiisr+0x117                                   ";
         528 : dbg_instr = "spiisr+0x118                                   ";
         529 : dbg_instr = "spiisr+0x119                                   ";
         530 : dbg_instr = "spiisr+0x11a                                   ";
         531 : dbg_instr = "spiisr+0x11b                                   ";
         532 : dbg_instr = "spiisr+0x11c                                   ";
         533 : dbg_instr = "spiisr+0x11d                                   ";
         534 : dbg_instr = "spiisr+0x11e                                   ";
         535 : dbg_instr = "spiisr+0x11f                                   ";
         536 : dbg_instr = "spiisr+0x120                                   ";
         537 : dbg_instr = "spiisr+0x121                                   ";
         538 : dbg_instr = "spiisr+0x122                                   ";
         539 : dbg_instr = "spiisr+0x123                                   ";
         540 : dbg_instr = "spiisr+0x124                                   ";
         541 : dbg_instr = "spiisr+0x125                                   ";
         542 : dbg_instr = "spiisr+0x126                                   ";
         543 : dbg_instr = "spiisr+0x127                                   ";
         544 : dbg_instr = "spiisr+0x128                                   ";
         545 : dbg_instr = "spiisr+0x129                                   ";
         546 : dbg_instr = "spiisr+0x12a                                   ";
         547 : dbg_instr = "spiisr+0x12b                                   ";
         548 : dbg_instr = "spiisr+0x12c                                   ";
         549 : dbg_instr = "spiisr+0x12d                                   ";
         550 : dbg_instr = "spiisr+0x12e                                   ";
         551 : dbg_instr = "spiisr+0x12f                                   ";
         552 : dbg_instr = "spiisr+0x130                                   ";
         553 : dbg_instr = "spiisr+0x131                                   ";
         554 : dbg_instr = "spiisr+0x132                                   ";
         555 : dbg_instr = "spiisr+0x133                                   ";
         556 : dbg_instr = "spiisr+0x134                                   ";
         557 : dbg_instr = "spiisr+0x135                                   ";
         558 : dbg_instr = "spiisr+0x136                                   ";
         559 : dbg_instr = "spiisr+0x137                                   ";
         560 : dbg_instr = "spiisr+0x138                                   ";
         561 : dbg_instr = "spiisr+0x139                                   ";
         562 : dbg_instr = "spiisr+0x13a                                   ";
         563 : dbg_instr = "spiisr+0x13b                                   ";
         564 : dbg_instr = "spiisr+0x13c                                   ";
         565 : dbg_instr = "spiisr+0x13d                                   ";
         566 : dbg_instr = "spiisr+0x13e                                   ";
         567 : dbg_instr = "spiisr+0x13f                                   ";
         568 : dbg_instr = "spiisr+0x140                                   ";
         569 : dbg_instr = "spiisr+0x141                                   ";
         570 : dbg_instr = "spiisr+0x142                                   ";
         571 : dbg_instr = "spiisr+0x143                                   ";
         572 : dbg_instr = "spiisr+0x144                                   ";
         573 : dbg_instr = "spiisr+0x145                                   ";
         574 : dbg_instr = "spiisr+0x146                                   ";
         575 : dbg_instr = "spiisr+0x147                                   ";
         576 : dbg_instr = "spiisr+0x148                                   ";
         577 : dbg_instr = "spiisr+0x149                                   ";
         578 : dbg_instr = "spiisr+0x14a                                   ";
         579 : dbg_instr = "spiisr+0x14b                                   ";
         580 : dbg_instr = "spiisr+0x14c                                   ";
         581 : dbg_instr = "spiisr+0x14d                                   ";
         582 : dbg_instr = "spiisr+0x14e                                   ";
         583 : dbg_instr = "spiisr+0x14f                                   ";
         584 : dbg_instr = "spiisr+0x150                                   ";
         585 : dbg_instr = "spiisr+0x151                                   ";
         586 : dbg_instr = "spiisr+0x152                                   ";
         587 : dbg_instr = "spiisr+0x153                                   ";
         588 : dbg_instr = "spiisr+0x154                                   ";
         589 : dbg_instr = "spiisr+0x155                                   ";
         590 : dbg_instr = "spiisr+0x156                                   ";
         591 : dbg_instr = "spiisr+0x157                                   ";
         592 : dbg_instr = "spiisr+0x158                                   ";
         593 : dbg_instr = "spiisr+0x159                                   ";
         594 : dbg_instr = "spiisr+0x15a                                   ";
         595 : dbg_instr = "spiisr+0x15b                                   ";
         596 : dbg_instr = "spiisr+0x15c                                   ";
         597 : dbg_instr = "spiisr+0x15d                                   ";
         598 : dbg_instr = "spiisr+0x15e                                   ";
         599 : dbg_instr = "spiisr+0x15f                                   ";
         600 : dbg_instr = "spiisr+0x160                                   ";
         601 : dbg_instr = "spiisr+0x161                                   ";
         602 : dbg_instr = "spiisr+0x162                                   ";
         603 : dbg_instr = "spiisr+0x163                                   ";
         604 : dbg_instr = "spiisr+0x164                                   ";
         605 : dbg_instr = "spiisr+0x165                                   ";
         606 : dbg_instr = "spiisr+0x166                                   ";
         607 : dbg_instr = "spiisr+0x167                                   ";
         608 : dbg_instr = "spiisr+0x168                                   ";
         609 : dbg_instr = "spiisr+0x169                                   ";
         610 : dbg_instr = "spiisr+0x16a                                   ";
         611 : dbg_instr = "spiisr+0x16b                                   ";
         612 : dbg_instr = "spiisr+0x16c                                   ";
         613 : dbg_instr = "spiisr+0x16d                                   ";
         614 : dbg_instr = "spiisr+0x16e                                   ";
         615 : dbg_instr = "spiisr+0x16f                                   ";
         616 : dbg_instr = "spiisr+0x170                                   ";
         617 : dbg_instr = "spiisr+0x171                                   ";
         618 : dbg_instr = "spiisr+0x172                                   ";
         619 : dbg_instr = "spiisr+0x173                                   ";
         620 : dbg_instr = "spiisr+0x174                                   ";
         621 : dbg_instr = "spiisr+0x175                                   ";
         622 : dbg_instr = "spiisr+0x176                                   ";
         623 : dbg_instr = "spiisr+0x177                                   ";
         624 : dbg_instr = "spiisr+0x178                                   ";
         625 : dbg_instr = "spiisr+0x179                                   ";
         626 : dbg_instr = "spiisr+0x17a                                   ";
         627 : dbg_instr = "spiisr+0x17b                                   ";
         628 : dbg_instr = "spiisr+0x17c                                   ";
         629 : dbg_instr = "spiisr+0x17d                                   ";
         630 : dbg_instr = "spiisr+0x17e                                   ";
         631 : dbg_instr = "spiisr+0x17f                                   ";
         632 : dbg_instr = "spiisr+0x180                                   ";
         633 : dbg_instr = "spiisr+0x181                                   ";
         634 : dbg_instr = "spiisr+0x182                                   ";
         635 : dbg_instr = "spiisr+0x183                                   ";
         636 : dbg_instr = "spiisr+0x184                                   ";
         637 : dbg_instr = "spiisr+0x185                                   ";
         638 : dbg_instr = "spiisr+0x186                                   ";
         639 : dbg_instr = "spiisr+0x187                                   ";
         640 : dbg_instr = "spiisr+0x188                                   ";
         641 : dbg_instr = "spiisr+0x189                                   ";
         642 : dbg_instr = "spiisr+0x18a                                   ";
         643 : dbg_instr = "spiisr+0x18b                                   ";
         644 : dbg_instr = "spiisr+0x18c                                   ";
         645 : dbg_instr = "spiisr+0x18d                                   ";
         646 : dbg_instr = "spiisr+0x18e                                   ";
         647 : dbg_instr = "spiisr+0x18f                                   ";
         648 : dbg_instr = "spiisr+0x190                                   ";
         649 : dbg_instr = "spiisr+0x191                                   ";
         650 : dbg_instr = "spiisr+0x192                                   ";
         651 : dbg_instr = "spiisr+0x193                                   ";
         652 : dbg_instr = "spiisr+0x194                                   ";
         653 : dbg_instr = "spiisr+0x195                                   ";
         654 : dbg_instr = "spiisr+0x196                                   ";
         655 : dbg_instr = "spiisr+0x197                                   ";
         656 : dbg_instr = "spiisr+0x198                                   ";
         657 : dbg_instr = "spiisr+0x199                                   ";
         658 : dbg_instr = "spiisr+0x19a                                   ";
         659 : dbg_instr = "spiisr+0x19b                                   ";
         660 : dbg_instr = "spiisr+0x19c                                   ";
         661 : dbg_instr = "spiisr+0x19d                                   ";
         662 : dbg_instr = "spiisr+0x19e                                   ";
         663 : dbg_instr = "spiisr+0x19f                                   ";
         664 : dbg_instr = "spiisr+0x1a0                                   ";
         665 : dbg_instr = "spiisr+0x1a1                                   ";
         666 : dbg_instr = "spiisr+0x1a2                                   ";
         667 : dbg_instr = "spiisr+0x1a3                                   ";
         668 : dbg_instr = "spiisr+0x1a4                                   ";
         669 : dbg_instr = "spiisr+0x1a5                                   ";
         670 : dbg_instr = "spiisr+0x1a6                                   ";
         671 : dbg_instr = "spiisr+0x1a7                                   ";
         672 : dbg_instr = "spiisr+0x1a8                                   ";
         673 : dbg_instr = "spiisr+0x1a9                                   ";
         674 : dbg_instr = "spiisr+0x1aa                                   ";
         675 : dbg_instr = "spiisr+0x1ab                                   ";
         676 : dbg_instr = "spiisr+0x1ac                                   ";
         677 : dbg_instr = "spiisr+0x1ad                                   ";
         678 : dbg_instr = "spiisr+0x1ae                                   ";
         679 : dbg_instr = "spiisr+0x1af                                   ";
         680 : dbg_instr = "spiisr+0x1b0                                   ";
         681 : dbg_instr = "spiisr+0x1b1                                   ";
         682 : dbg_instr = "spiisr+0x1b2                                   ";
         683 : dbg_instr = "spiisr+0x1b3                                   ";
         684 : dbg_instr = "spiisr+0x1b4                                   ";
         685 : dbg_instr = "spiisr+0x1b5                                   ";
         686 : dbg_instr = "spiisr+0x1b6                                   ";
         687 : dbg_instr = "spiisr+0x1b7                                   ";
         688 : dbg_instr = "spiisr+0x1b8                                   ";
         689 : dbg_instr = "spiisr+0x1b9                                   ";
         690 : dbg_instr = "spiisr+0x1ba                                   ";
         691 : dbg_instr = "spiisr+0x1bb                                   ";
         692 : dbg_instr = "spiisr+0x1bc                                   ";
         693 : dbg_instr = "spiisr+0x1bd                                   ";
         694 : dbg_instr = "spiisr+0x1be                                   ";
         695 : dbg_instr = "spiisr+0x1bf                                   ";
         696 : dbg_instr = "spiisr+0x1c0                                   ";
         697 : dbg_instr = "spiisr+0x1c1                                   ";
         698 : dbg_instr = "spiisr+0x1c2                                   ";
         699 : dbg_instr = "spiisr+0x1c3                                   ";
         700 : dbg_instr = "spiisr+0x1c4                                   ";
         701 : dbg_instr = "spiisr+0x1c5                                   ";
         702 : dbg_instr = "spiisr+0x1c6                                   ";
         703 : dbg_instr = "spiisr+0x1c7                                   ";
         704 : dbg_instr = "spiisr+0x1c8                                   ";
         705 : dbg_instr = "spiisr+0x1c9                                   ";
         706 : dbg_instr = "spiisr+0x1ca                                   ";
         707 : dbg_instr = "spiisr+0x1cb                                   ";
         708 : dbg_instr = "spiisr+0x1cc                                   ";
         709 : dbg_instr = "spiisr+0x1cd                                   ";
         710 : dbg_instr = "spiisr+0x1ce                                   ";
         711 : dbg_instr = "spiisr+0x1cf                                   ";
         712 : dbg_instr = "spiisr+0x1d0                                   ";
         713 : dbg_instr = "spiisr+0x1d1                                   ";
         714 : dbg_instr = "spiisr+0x1d2                                   ";
         715 : dbg_instr = "spiisr+0x1d3                                   ";
         716 : dbg_instr = "spiisr+0x1d4                                   ";
         717 : dbg_instr = "spiisr+0x1d5                                   ";
         718 : dbg_instr = "spiisr+0x1d6                                   ";
         719 : dbg_instr = "spiisr+0x1d7                                   ";
         720 : dbg_instr = "spiisr+0x1d8                                   ";
         721 : dbg_instr = "spiisr+0x1d9                                   ";
         722 : dbg_instr = "spiisr+0x1da                                   ";
         723 : dbg_instr = "spiisr+0x1db                                   ";
         724 : dbg_instr = "spiisr+0x1dc                                   ";
         725 : dbg_instr = "spiisr+0x1dd                                   ";
         726 : dbg_instr = "spiisr+0x1de                                   ";
         727 : dbg_instr = "spiisr+0x1df                                   ";
         728 : dbg_instr = "spiisr+0x1e0                                   ";
         729 : dbg_instr = "spiisr+0x1e1                                   ";
         730 : dbg_instr = "spiisr+0x1e2                                   ";
         731 : dbg_instr = "spiisr+0x1e3                                   ";
         732 : dbg_instr = "spiisr+0x1e4                                   ";
         733 : dbg_instr = "spiisr+0x1e5                                   ";
         734 : dbg_instr = "spiisr+0x1e6                                   ";
         735 : dbg_instr = "spiisr+0x1e7                                   ";
         736 : dbg_instr = "spiisr+0x1e8                                   ";
         737 : dbg_instr = "spiisr+0x1e9                                   ";
         738 : dbg_instr = "spiisr+0x1ea                                   ";
         739 : dbg_instr = "spiisr+0x1eb                                   ";
         740 : dbg_instr = "spiisr+0x1ec                                   ";
         741 : dbg_instr = "spiisr+0x1ed                                   ";
         742 : dbg_instr = "spiisr+0x1ee                                   ";
         743 : dbg_instr = "spiisr+0x1ef                                   ";
         744 : dbg_instr = "spiisr+0x1f0                                   ";
         745 : dbg_instr = "spiisr+0x1f1                                   ";
         746 : dbg_instr = "spiisr+0x1f2                                   ";
         747 : dbg_instr = "spiisr+0x1f3                                   ";
         748 : dbg_instr = "spiisr+0x1f4                                   ";
         749 : dbg_instr = "spiisr+0x1f5                                   ";
         750 : dbg_instr = "spiisr+0x1f6                                   ";
         751 : dbg_instr = "spiisr+0x1f7                                   ";
         752 : dbg_instr = "spiisr+0x1f8                                   ";
         753 : dbg_instr = "spiisr+0x1f9                                   ";
         754 : dbg_instr = "spiisr+0x1fa                                   ";
         755 : dbg_instr = "spiisr+0x1fb                                   ";
         756 : dbg_instr = "spiisr+0x1fc                                   ";
         757 : dbg_instr = "spiisr+0x1fd                                   ";
         758 : dbg_instr = "spiisr+0x1fe                                   ";
         759 : dbg_instr = "spiisr+0x1ff                                   ";
         760 : dbg_instr = "spiisr+0x200                                   ";
         761 : dbg_instr = "spiisr+0x201                                   ";
         762 : dbg_instr = "spiisr+0x202                                   ";
         763 : dbg_instr = "spiisr+0x203                                   ";
         764 : dbg_instr = "spiisr+0x204                                   ";
         765 : dbg_instr = "spiisr+0x205                                   ";
         766 : dbg_instr = "spiisr+0x206                                   ";
         767 : dbg_instr = "spiisr+0x207                                   ";
         768 : dbg_instr = "spiisr+0x208                                   ";
         769 : dbg_instr = "spiisr+0x209                                   ";
         770 : dbg_instr = "spiisr+0x20a                                   ";
         771 : dbg_instr = "spiisr+0x20b                                   ";
         772 : dbg_instr = "spiisr+0x20c                                   ";
         773 : dbg_instr = "spiisr+0x20d                                   ";
         774 : dbg_instr = "spiisr+0x20e                                   ";
         775 : dbg_instr = "spiisr+0x20f                                   ";
         776 : dbg_instr = "spiisr+0x210                                   ";
         777 : dbg_instr = "spiisr+0x211                                   ";
         778 : dbg_instr = "spiisr+0x212                                   ";
         779 : dbg_instr = "spiisr+0x213                                   ";
         780 : dbg_instr = "spiisr+0x214                                   ";
         781 : dbg_instr = "spiisr+0x215                                   ";
         782 : dbg_instr = "spiisr+0x216                                   ";
         783 : dbg_instr = "spiisr+0x217                                   ";
         784 : dbg_instr = "spiisr+0x218                                   ";
         785 : dbg_instr = "spiisr+0x219                                   ";
         786 : dbg_instr = "spiisr+0x21a                                   ";
         787 : dbg_instr = "spiisr+0x21b                                   ";
         788 : dbg_instr = "spiisr+0x21c                                   ";
         789 : dbg_instr = "spiisr+0x21d                                   ";
         790 : dbg_instr = "spiisr+0x21e                                   ";
         791 : dbg_instr = "spiisr+0x21f                                   ";
         792 : dbg_instr = "spiisr+0x220                                   ";
         793 : dbg_instr = "spiisr+0x221                                   ";
         794 : dbg_instr = "spiisr+0x222                                   ";
         795 : dbg_instr = "spiisr+0x223                                   ";
         796 : dbg_instr = "spiisr+0x224                                   ";
         797 : dbg_instr = "spiisr+0x225                                   ";
         798 : dbg_instr = "spiisr+0x226                                   ";
         799 : dbg_instr = "spiisr+0x227                                   ";
         800 : dbg_instr = "spiisr+0x228                                   ";
         801 : dbg_instr = "spiisr+0x229                                   ";
         802 : dbg_instr = "spiisr+0x22a                                   ";
         803 : dbg_instr = "spiisr+0x22b                                   ";
         804 : dbg_instr = "spiisr+0x22c                                   ";
         805 : dbg_instr = "spiisr+0x22d                                   ";
         806 : dbg_instr = "spiisr+0x22e                                   ";
         807 : dbg_instr = "spiisr+0x22f                                   ";
         808 : dbg_instr = "spiisr+0x230                                   ";
         809 : dbg_instr = "spiisr+0x231                                   ";
         810 : dbg_instr = "spiisr+0x232                                   ";
         811 : dbg_instr = "spiisr+0x233                                   ";
         812 : dbg_instr = "spiisr+0x234                                   ";
         813 : dbg_instr = "spiisr+0x235                                   ";
         814 : dbg_instr = "spiisr+0x236                                   ";
         815 : dbg_instr = "spiisr+0x237                                   ";
         816 : dbg_instr = "spiisr+0x238                                   ";
         817 : dbg_instr = "spiisr+0x239                                   ";
         818 : dbg_instr = "spiisr+0x23a                                   ";
         819 : dbg_instr = "spiisr+0x23b                                   ";
         820 : dbg_instr = "spiisr+0x23c                                   ";
         821 : dbg_instr = "spiisr+0x23d                                   ";
         822 : dbg_instr = "spiisr+0x23e                                   ";
         823 : dbg_instr = "spiisr+0x23f                                   ";
         824 : dbg_instr = "spiisr+0x240                                   ";
         825 : dbg_instr = "spiisr+0x241                                   ";
         826 : dbg_instr = "spiisr+0x242                                   ";
         827 : dbg_instr = "spiisr+0x243                                   ";
         828 : dbg_instr = "spiisr+0x244                                   ";
         829 : dbg_instr = "spiisr+0x245                                   ";
         830 : dbg_instr = "spiisr+0x246                                   ";
         831 : dbg_instr = "spiisr+0x247                                   ";
         832 : dbg_instr = "spiisr+0x248                                   ";
         833 : dbg_instr = "spiisr+0x249                                   ";
         834 : dbg_instr = "spiisr+0x24a                                   ";
         835 : dbg_instr = "spiisr+0x24b                                   ";
         836 : dbg_instr = "spiisr+0x24c                                   ";
         837 : dbg_instr = "spiisr+0x24d                                   ";
         838 : dbg_instr = "spiisr+0x24e                                   ";
         839 : dbg_instr = "spiisr+0x24f                                   ";
         840 : dbg_instr = "spiisr+0x250                                   ";
         841 : dbg_instr = "spiisr+0x251                                   ";
         842 : dbg_instr = "spiisr+0x252                                   ";
         843 : dbg_instr = "spiisr+0x253                                   ";
         844 : dbg_instr = "spiisr+0x254                                   ";
         845 : dbg_instr = "spiisr+0x255                                   ";
         846 : dbg_instr = "spiisr+0x256                                   ";
         847 : dbg_instr = "spiisr+0x257                                   ";
         848 : dbg_instr = "spiisr+0x258                                   ";
         849 : dbg_instr = "spiisr+0x259                                   ";
         850 : dbg_instr = "spiisr+0x25a                                   ";
         851 : dbg_instr = "spiisr+0x25b                                   ";
         852 : dbg_instr = "spiisr+0x25c                                   ";
         853 : dbg_instr = "spiisr+0x25d                                   ";
         854 : dbg_instr = "spiisr+0x25e                                   ";
         855 : dbg_instr = "spiisr+0x25f                                   ";
         856 : dbg_instr = "spiisr+0x260                                   ";
         857 : dbg_instr = "spiisr+0x261                                   ";
         858 : dbg_instr = "spiisr+0x262                                   ";
         859 : dbg_instr = "spiisr+0x263                                   ";
         860 : dbg_instr = "spiisr+0x264                                   ";
         861 : dbg_instr = "spiisr+0x265                                   ";
         862 : dbg_instr = "spiisr+0x266                                   ";
         863 : dbg_instr = "spiisr+0x267                                   ";
         864 : dbg_instr = "spiisr+0x268                                   ";
         865 : dbg_instr = "spiisr+0x269                                   ";
         866 : dbg_instr = "spiisr+0x26a                                   ";
         867 : dbg_instr = "spiisr+0x26b                                   ";
         868 : dbg_instr = "spiisr+0x26c                                   ";
         869 : dbg_instr = "spiisr+0x26d                                   ";
         870 : dbg_instr = "spiisr+0x26e                                   ";
         871 : dbg_instr = "spiisr+0x26f                                   ";
         872 : dbg_instr = "spiisr+0x270                                   ";
         873 : dbg_instr = "spiisr+0x271                                   ";
         874 : dbg_instr = "spiisr+0x272                                   ";
         875 : dbg_instr = "spiisr+0x273                                   ";
         876 : dbg_instr = "spiisr+0x274                                   ";
         877 : dbg_instr = "spiisr+0x275                                   ";
         878 : dbg_instr = "spiisr+0x276                                   ";
         879 : dbg_instr = "spiisr+0x277                                   ";
         880 : dbg_instr = "spiisr+0x278                                   ";
         881 : dbg_instr = "spiisr+0x279                                   ";
         882 : dbg_instr = "spiisr+0x27a                                   ";
         883 : dbg_instr = "spiisr+0x27b                                   ";
         884 : dbg_instr = "spiisr+0x27c                                   ";
         885 : dbg_instr = "spiisr+0x27d                                   ";
         886 : dbg_instr = "spiisr+0x27e                                   ";
         887 : dbg_instr = "spiisr+0x27f                                   ";
         888 : dbg_instr = "spiisr+0x280                                   ";
         889 : dbg_instr = "spiisr+0x281                                   ";
         890 : dbg_instr = "spiisr+0x282                                   ";
         891 : dbg_instr = "spiisr+0x283                                   ";
         892 : dbg_instr = "spiisr+0x284                                   ";
         893 : dbg_instr = "spiisr+0x285                                   ";
         894 : dbg_instr = "spiisr+0x286                                   ";
         895 : dbg_instr = "spiisr+0x287                                   ";
         896 : dbg_instr = "spiisr+0x288                                   ";
         897 : dbg_instr = "spiisr+0x289                                   ";
         898 : dbg_instr = "spiisr+0x28a                                   ";
         899 : dbg_instr = "spiisr+0x28b                                   ";
         900 : dbg_instr = "spiisr+0x28c                                   ";
         901 : dbg_instr = "spiisr+0x28d                                   ";
         902 : dbg_instr = "spiisr+0x28e                                   ";
         903 : dbg_instr = "spiisr+0x28f                                   ";
         904 : dbg_instr = "spiisr+0x290                                   ";
         905 : dbg_instr = "spiisr+0x291                                   ";
         906 : dbg_instr = "spiisr+0x292                                   ";
         907 : dbg_instr = "spiisr+0x293                                   ";
         908 : dbg_instr = "spiisr+0x294                                   ";
         909 : dbg_instr = "spiisr+0x295                                   ";
         910 : dbg_instr = "spiisr+0x296                                   ";
         911 : dbg_instr = "spiisr+0x297                                   ";
         912 : dbg_instr = "spiisr+0x298                                   ";
         913 : dbg_instr = "spiisr+0x299                                   ";
         914 : dbg_instr = "spiisr+0x29a                                   ";
         915 : dbg_instr = "spiisr+0x29b                                   ";
         916 : dbg_instr = "spiisr+0x29c                                   ";
         917 : dbg_instr = "spiisr+0x29d                                   ";
         918 : dbg_instr = "spiisr+0x29e                                   ";
         919 : dbg_instr = "spiisr+0x29f                                   ";
         920 : dbg_instr = "spiisr+0x2a0                                   ";
         921 : dbg_instr = "spiisr+0x2a1                                   ";
         922 : dbg_instr = "spiisr+0x2a2                                   ";
         923 : dbg_instr = "spiisr+0x2a3                                   ";
         924 : dbg_instr = "spiisr+0x2a4                                   ";
         925 : dbg_instr = "spiisr+0x2a5                                   ";
         926 : dbg_instr = "spiisr+0x2a6                                   ";
         927 : dbg_instr = "spiisr+0x2a7                                   ";
         928 : dbg_instr = "spiisr+0x2a8                                   ";
         929 : dbg_instr = "spiisr+0x2a9                                   ";
         930 : dbg_instr = "spiisr+0x2aa                                   ";
         931 : dbg_instr = "spiisr+0x2ab                                   ";
         932 : dbg_instr = "spiisr+0x2ac                                   ";
         933 : dbg_instr = "spiisr+0x2ad                                   ";
         934 : dbg_instr = "spiisr+0x2ae                                   ";
         935 : dbg_instr = "spiisr+0x2af                                   ";
         936 : dbg_instr = "spiisr+0x2b0                                   ";
         937 : dbg_instr = "spiisr+0x2b1                                   ";
         938 : dbg_instr = "spiisr+0x2b2                                   ";
         939 : dbg_instr = "spiisr+0x2b3                                   ";
         940 : dbg_instr = "spiisr+0x2b4                                   ";
         941 : dbg_instr = "spiisr+0x2b5                                   ";
         942 : dbg_instr = "spiisr+0x2b6                                   ";
         943 : dbg_instr = "spiisr+0x2b7                                   ";
         944 : dbg_instr = "spiisr+0x2b8                                   ";
         945 : dbg_instr = "spiisr+0x2b9                                   ";
         946 : dbg_instr = "spiisr+0x2ba                                   ";
         947 : dbg_instr = "spiisr+0x2bb                                   ";
         948 : dbg_instr = "spiisr+0x2bc                                   ";
         949 : dbg_instr = "spiisr+0x2bd                                   ";
         950 : dbg_instr = "spiisr+0x2be                                   ";
         951 : dbg_instr = "spiisr+0x2bf                                   ";
         952 : dbg_instr = "spiisr+0x2c0                                   ";
         953 : dbg_instr = "spiisr+0x2c1                                   ";
         954 : dbg_instr = "spiisr+0x2c2                                   ";
         955 : dbg_instr = "spiisr+0x2c3                                   ";
         956 : dbg_instr = "spiisr+0x2c4                                   ";
         957 : dbg_instr = "spiisr+0x2c5                                   ";
         958 : dbg_instr = "spiisr+0x2c6                                   ";
         959 : dbg_instr = "spiisr+0x2c7                                   ";
         960 : dbg_instr = "spiisr+0x2c8                                   ";
         961 : dbg_instr = "spiisr+0x2c9                                   ";
         962 : dbg_instr = "spiisr+0x2ca                                   ";
         963 : dbg_instr = "spiisr+0x2cb                                   ";
         964 : dbg_instr = "spiisr+0x2cc                                   ";
         965 : dbg_instr = "spiisr+0x2cd                                   ";
         966 : dbg_instr = "spiisr+0x2ce                                   ";
         967 : dbg_instr = "spiisr+0x2cf                                   ";
         968 : dbg_instr = "spiisr+0x2d0                                   ";
         969 : dbg_instr = "spiisr+0x2d1                                   ";
         970 : dbg_instr = "spiisr+0x2d2                                   ";
         971 : dbg_instr = "spiisr+0x2d3                                   ";
         972 : dbg_instr = "spiisr+0x2d4                                   ";
         973 : dbg_instr = "spiisr+0x2d5                                   ";
         974 : dbg_instr = "spiisr+0x2d6                                   ";
         975 : dbg_instr = "spiisr+0x2d7                                   ";
         976 : dbg_instr = "spiisr+0x2d8                                   ";
         977 : dbg_instr = "spiisr+0x2d9                                   ";
         978 : dbg_instr = "spiisr+0x2da                                   ";
         979 : dbg_instr = "spiisr+0x2db                                   ";
         980 : dbg_instr = "spiisr+0x2dc                                   ";
         981 : dbg_instr = "spiisr+0x2dd                                   ";
         982 : dbg_instr = "spiisr+0x2de                                   ";
         983 : dbg_instr = "spiisr+0x2df                                   ";
         984 : dbg_instr = "spiisr+0x2e0                                   ";
         985 : dbg_instr = "spiisr+0x2e1                                   ";
         986 : dbg_instr = "spiisr+0x2e2                                   ";
         987 : dbg_instr = "spiisr+0x2e3                                   ";
         988 : dbg_instr = "spiisr+0x2e4                                   ";
         989 : dbg_instr = "spiisr+0x2e5                                   ";
         990 : dbg_instr = "spiisr+0x2e6                                   ";
         991 : dbg_instr = "spiisr+0x2e7                                   ";
         992 : dbg_instr = "spiisr+0x2e8                                   ";
         993 : dbg_instr = "spiisr+0x2e9                                   ";
         994 : dbg_instr = "spiisr+0x2ea                                   ";
         995 : dbg_instr = "spiisr+0x2eb                                   ";
         996 : dbg_instr = "spiisr+0x2ec                                   ";
         997 : dbg_instr = "spiisr+0x2ed                                   ";
         998 : dbg_instr = "spiisr+0x2ee                                   ";
         999 : dbg_instr = "spiisr+0x2ef                                   ";
         1000 : dbg_instr = "spiisr+0x2f0                                   ";
         1001 : dbg_instr = "spiisr+0x2f1                                   ";
         1002 : dbg_instr = "spiisr+0x2f2                                   ";
         1003 : dbg_instr = "spiisr+0x2f3                                   ";
         1004 : dbg_instr = "spiisr+0x2f4                                   ";
         1005 : dbg_instr = "spiisr+0x2f5                                   ";
         1006 : dbg_instr = "spiisr+0x2f6                                   ";
         1007 : dbg_instr = "spiisr+0x2f7                                   ";
         1008 : dbg_instr = "spiisr+0x2f8                                   ";
         1009 : dbg_instr = "spiisr+0x2f9                                   ";
         1010 : dbg_instr = "spiisr+0x2fa                                   ";
         1011 : dbg_instr = "spiisr+0x2fb                                   ";
         1012 : dbg_instr = "spiisr+0x2fc                                   ";
         1013 : dbg_instr = "spiisr+0x2fd                                   ";
         1014 : dbg_instr = "spiisr+0x2fe                                   ";
         1015 : dbg_instr = "spiisr+0x2ff                                   ";
         1016 : dbg_instr = "spiisr+0x300                                   ";
         1017 : dbg_instr = "spiisr+0x301                                   ";
         1018 : dbg_instr = "spiisr+0x302                                   ";
         1019 : dbg_instr = "spiisr+0x303                                   ";
         1020 : dbg_instr = "spiisr+0x304                                   ";
         1021 : dbg_instr = "spiisr+0x305                                   ";
         1022 : dbg_instr = "spiisr+0x306                                   ";
         1023 : dbg_instr = "spiisr+0x307                                   ";
     endcase
   end
// synthesis translate_on

RAMB16_S18 #(
    .INIT(18'h00000),

    // The following INIT_xx declarations specify the initial contents of the RAM
    // Address 0 to 255
    .INIT_00(256'hB0114A00DF049F00DA02B0011B080009500000090077000500052001008B0045),
    .INIT_01(256'h1A065000000300090AD000091A13201CDDFF1A03005AB0235000600B9B01B001),
    .INIT_02(256'h00090AD000091A12202FDDFF1A02003E1A06005A5000B0232058003E1AE4003E),
    .INIT_03(256'h0009B02320DF000300090AD000091AE3003E1A06005A9D0120351D0150000003),
    .INIT_04(256'h1AD8003E1A06005A50009C149B159A169D1750000061202400081A05B0232024),
    .INIT_05(256'h9901EA909901EB909901EC9020E71AAAB023000300090AD000091ADC2055DDFF),
    .INIT_06(256'h0073203E1A99003E1AF0003E1A66B023500060639F01B001B0111F08B0235000),
    .INIT_07(256'hDF10DF115F08207EDA001F025000AA9019015000AB90190100775000AC901901),
    .INIT_08(256'h10125000608FD00E90102024006F005E0009005E0009005E00081A9FB0235000),
    .INIT_09(256'h004760B7DF023FEE0F009012207E1F06209AD100A091D018100161F08F001100),
    .INIT_0A(256'h11FF0014207A00DF60A8910100099A2011FF002660AED00230EF1DFF60A3D010),
    .INIT_0B(256'h004C1DFF20BFD002004760C1DFDE3F230F00207E1F02B02360B09101DA200009),
    .INIT_0C(256'h60D2D0E4207A0032004760CED0E3207E1F02DA14DB15DC16008160C9D09E207A),
    .INIT_0D(256'hB023207E1F06207E1F02DF301F80DD37DA36DB35DC34004760DDD0FF207A001F),
    .INIT_0E(256'h00411C004E004D064E004D064E004D060DA050000077003E1A04005E00E71A01),
    .INIT_0F(256'h10001000100010009001DF301F010068500060EFBE01BD019C01500060F33A01),

    // Address 256 to 511
    .INIT_10(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_11(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_12(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_13(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_14(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_15(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_16(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_17(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_18(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_19(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_1A(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_1B(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_1C(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_1D(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_1E(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_1F(256'h1000100010001000100010001000100010001000100010001000100010001000),

    // Address 512 to 767
    .INIT_20(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_21(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_22(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_23(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_24(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_25(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_26(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_27(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_28(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_29(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_2A(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_2B(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_2C(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_2D(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_2E(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_2F(256'h1000100010001000100010001000100010001000100010001000100010001000),

    // Address 768 to 1023
    .INIT_30(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_31(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_32(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_33(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_34(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_35(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_36(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_37(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_38(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_39(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_3A(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_3B(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_3C(256'h1000100010001000100010001000100010001000100010001000100010001000),
    .INIT_3D(256'h00000000000000000000000000000000000000000000000000000000000020F8),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // The next set of INITP_xx are for the parity bits
    // Address 0 to 255
    .INITP_00(256'hA34861A1A222B68A6668A88D22802A8AAA8889DA88D22AA22A234AB690A2AAAA),
    .INITP_01(256'h00A2B56C85552A28A222AADADAB62AB68CB422DA2AD82D0CB408DD402C2AAA8A),

    // Address 256 to 511
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // Address 512 to 767
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),

    // Address 768 to 1023
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000020000000000000000000000000000000000000000),

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
