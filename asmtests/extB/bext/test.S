# RISC-V Bit Manipulation Instruction Support
#
# Copyright (c) 2019, Imperas Software Ltd. Additions
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * the name of Imperas Software Ltd. nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Codasip Ltd., Imperas Software Ltd.
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
.include "extB.S.include"

# use s0(r8)  - s1(r9)
# use s2(r18) - s11(r27)

.macro test_BEXT imm1 imm2
    WRITE_LOG_N str1
    WRITE_S sep
    li s3, \imm1
    li s4, \imm2
    BEXT 18 19 20
    WRITE_RAW s3
    WRITE_S op
    WRITE_RAW s4
    WRITE_S gives
    WRITE_RAW s2
    WRITE_NL
.endm

START_TEST:
    test_BEXT 0x12345678 0x0000000F
    test_BEXT 0x12345678 0x000000F0
    test_BEXT 0x12345678 0x00000F00
    test_BEXT 0x12345678 0x0000F000
    test_BEXT 0x12345678 0x000F0000
    test_BEXT 0x12345678 0x00F00000
    test_BEXT 0x12345678 0x0F000000
    test_BEXT 0x12345678 0xF0000000

    test_BEXT 0x12345678 0x000000FF
    test_BEXT 0x12345678 0x00000FF0
    test_BEXT 0x12345678 0x0000FF00
    test_BEXT 0x12345678 0x000FF000
    test_BEXT 0x12345678 0x00FF0000
    test_BEXT 0x12345678 0x0FF00000
    test_BEXT 0x12345678 0xFF000000

    test_BEXT 0x12345678 0x00000FFF
    test_BEXT 0x12345678 0x0000FFF0
    test_BEXT 0x12345678 0x000FFF00
    test_BEXT 0x12345678 0x00FFF000
    test_BEXT 0x12345678 0x0FFF0000
    test_BEXT 0x12345678 0xFFF00000

    test_BEXT 0x12345678 0x0000FFFF
    test_BEXT 0x12345678 0x000FFFF0
    test_BEXT 0x12345678 0x00FFFF00
    test_BEXT 0x12345678 0x0FFFF000
    test_BEXT 0x12345678 0xFFFF0000

    test_BEXT 0x12345678 0x000FFFFF
    test_BEXT 0x12345678 0x00FFFFF0
    test_BEXT 0x12345678 0x0FFFFF00
    test_BEXT 0x12345678 0xFFFFF000

    test_BEXT 0x12345678 0x00FFFFFF
    test_BEXT 0x12345678 0x0FFFFFF0
    test_BEXT 0x12345678 0xFFFFFF00

    test_BEXT 0x12345678 0x0FFFFFFF
    test_BEXT 0x12345678 0xFFFFFFF0

    test_BEXT 0x12345678 0xFFFFFFFF

    test_BEXT 0x12345678 0x000FF000
    test_BEXT 0x12345678 0x00F00F00
    test_BEXT 0x12345678 0x0F0000F0
    test_BEXT 0x12345678 0xF000000F

    test_BEXT 0x55555555 0x55555555
    test_BEXT 0xAAAAAAAA 0x55555555
    test_BEXT 0x55555555 0xAAAAAAAA
    test_BEXT 0xAAAAAAAA 0xAAAAAAAA

    EXIT_TEST

str1:
    .string "Testing BEXT"

sep:
    .string " "

gives:
    .string " => "

op:
    .string " (OP) "
