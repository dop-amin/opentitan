/* Copyright lowRISC contributors. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/**
 * Test for vadd
*/

.section .text.start

/* Entry point. */
.globl main
main:
  /* Init all-zero register. */
  bn.xor  w31, w31, w31

  /* MOD <= dmem[modulus] = DILITHIUM_Q */
  li      x2, 2
  la      x3, modulus
  bn.lid  x2, 0(x3)
  bn.wsrw 0x0, w2

  /* dmem[y] <= vadd(dmem[x], dmem[y]) = dmem[x] + dmem[y] */
  la      x10, x
  la      x11, y
  jal     x1, submv

  /* Set up output */
  li     x0, 0
  la     x2, x
  /* Load result into w0.
       w0 <= dmem[x] */
  
  bn.lid x0, 0(x2)

  ecall

.data

/* First input */
x:
  .word 0x003240ee
  .word 0x002db175
  .word 0x003277b9
  .word 0x0026905b
  .word 0x0039feba
  .word 0x003a52d7
  .word 0x0034e13f
  .word 0x00251899

/* Second input */
y:
  .word 0x002102ef
  .word 0x002f6925
  .word 0x00207181
  .word 0x002ec575
  .word 0x002fb0b3
  .word 0x0028d973
  .word 0x0039e896
  .word 0x002111d5

/* Modulus for reduction */
modulus:
  .word 0x007fe001
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000