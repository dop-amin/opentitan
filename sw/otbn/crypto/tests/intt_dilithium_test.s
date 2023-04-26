/* Copyright lowRISC contributors. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/**
 * Test for intt_dilithium
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

  /* dmem[data] <= INTT(dmem[input]) */
  la  x30, input
  la  x31, twiddles
  jal  x1, intt_dilithium

  ecall

.data
.balign 32
/* First input */
input:
    .word 0x005d48ec
    .word 0x0021a486
    .word 0x007fd956
    .word 0x00513803
    .word 0x0020d597
    .word 0x000b753a
    .word 0x0051e05a
    .word 0x000eba0b
    .word 0x0070ab95
    .word 0x006a124d
    .word 0x003aa1cf
    .word 0x00509b8c
    .word 0x005d6ef6
    .word 0x00581b11
    .word 0x00416724
    .word 0x002928ca
    .word 0x0067fd57
    .word 0x00612635
    .word 0x001f0f39
    .word 0x0069694c
    .word 0x004f6e0f
    .word 0x00494bfe
    .word 0x0053dab9
    .word 0x0046eb19
    .word 0x001966c5
    .word 0x0026bb1d
    .word 0x000e0ae2
    .word 0x004f5513
    .word 0x0041e2be
    .word 0x00212792
    .word 0x000d3cd0
    .word 0x007ec2f2
    .word 0x005fa78b
    .word 0x00485194
    .word 0x0074f732
    .word 0x002e3b91
    .word 0x001c4ea8
    .word 0x0073e91f
    .word 0x002c1d03
    .word 0x0003733e
    .word 0x001f21a0
    .word 0x000f6d7c
    .word 0x0077587a
    .word 0x003eab0c
    .word 0x0008059b
    .word 0x0017bd4c
    .word 0x007bc5c1
    .word 0x001f8091
    .word 0x007a067b
    .word 0x0013d4ae
    .word 0x006e2d11
    .word 0x00265723
    .word 0x002213e5
    .word 0x004ee844
    .word 0x0004af11
    .word 0x000773d5
    .word 0x0063c820
    .word 0x0073929d
    .word 0x0023cadd
    .word 0x004dd2a3
    .word 0x005ce3e1
    .word 0x00214b4b
    .word 0x003cecc9
    .word 0x00704e4c
    .word 0x007c621f
    .word 0x003f51e8
    .word 0x005847e5
    .word 0x005fe291
    .word 0x006afdba
    .word 0x002bbb42
    .word 0x006007fe
    .word 0x003a24b5
    .word 0x003370d5
    .word 0x002382e5
    .word 0x005ad74f
    .word 0x007f60d5
    .word 0x006dcb02
    .word 0x0053a1ec
    .word 0x0005d6de
    .word 0x0000da27
    .word 0x00596dd6
    .word 0x007371e0
    .word 0x000bb138
    .word 0x0064e269
    .word 0x00621ec6
    .word 0x007fb198
    .word 0x0035b40c
    .word 0x00688879
    .word 0x004c1445
    .word 0x001535a1
    .word 0x0079aad2
    .word 0x005ff0ca
    .word 0x0063f79d
    .word 0x00449161
    .word 0x000018d1
    .word 0x007b2af4
    .word 0x007264b1
    .word 0x003594f9
    .word 0x001b8372
    .word 0x005edffc
    .word 0x001a7e2f
    .word 0x00445a3f
    .word 0x003d61c7
    .word 0x002f6231
    .word 0x00658b45
    .word 0x001d9560
    .word 0x001f9db8
    .word 0x00237f25
    .word 0x0061b8c8
    .word 0x0050a704
    .word 0x00052369
    .word 0x00399e7f
    .word 0x007950b6
    .word 0x00053f15
    .word 0x000c980c
    .word 0x007b7d0f
    .word 0x002451b1
    .word 0x003d8d33
    .word 0x00632a03
    .word 0x005e8ac4
    .word 0x0012ac7f
    .word 0x00686a84
    .word 0x00210f63
    .word 0x002fb7dd
    .word 0x00787387
    .word 0x0038fec8
    .word 0x00506c1a
    .word 0x007007d4
    .word 0x0064055d
    .word 0x004be313
    .word 0x00517c33
    .word 0x0041493e
    .word 0x004b56a9
    .word 0x00224b4e
    .word 0x005de278
    .word 0x007acb3a
    .word 0x002c6d1b
    .word 0x00407c70
    .word 0x00012caa
    .word 0x003a6c07
    .word 0x0006ad43
    .word 0x000da6e6
    .word 0x0038a26a
    .word 0x0039c794
    .word 0x00670aa4
    .word 0x0051be16
    .word 0x00169deb
    .word 0x007dee58
    .word 0x00731ed6
    .word 0x00268e06
    .word 0x0054eb97
    .word 0x004d54a4
    .word 0x004f1ab6
    .word 0x005da4b3
    .word 0x00189581
    .word 0x0057aa0f
    .word 0x003df4bb
    .word 0x00057dbf
    .word 0x001981fe
    .word 0x00014e3d
    .word 0x0050f1f0
    .word 0x0052eb8c
    .word 0x0032fe6f
    .word 0x0055391c
    .word 0x005767a2
    .word 0x0005cc0b
    .word 0x007fc8b2
    .word 0x00361987
    .word 0x00055595
    .word 0x006f261a
    .word 0x002eb8e3
    .word 0x00061ed4
    .word 0x0024f7dd
    .word 0x006a749e
    .word 0x004a0230
    .word 0x00593b36
    .word 0x0058d9bb
    .word 0x0047480a
    .word 0x00288503
    .word 0x0015a3af
    .word 0x00329308
    .word 0x004a242c
    .word 0x005a80aa
    .word 0x00180e0f
    .word 0x00683d44
    .word 0x003fbced
    .word 0x0039b459
    .word 0x001a66ab
    .word 0x0002d6f3
    .word 0x007d8b9d
    .word 0x00290e47
    .word 0x006699a0
    .word 0x0041415a
    .word 0x00514709
    .word 0x000c9ca3
    .word 0x0025287e
    .word 0x00780b0e
    .word 0x006a2ba9
    .word 0x007baad1
    .word 0x00346a9a
    .word 0x002d5ede
    .word 0x007ea727
    .word 0x000ae53d
    .word 0x001912cf
    .word 0x0036b4c7
    .word 0x001b31d4
    .word 0x005332eb
    .word 0x00118338
    .word 0x0002da94
    .word 0x00030772
    .word 0x0064ee68
    .word 0x0037ef2b
    .word 0x00054aca
    .word 0x0036f311
    .word 0x00416fe8
    .word 0x0010b58a
    .word 0x000cfc47
    .word 0x00055418
    .word 0x005e3fb4
    .word 0x007a8656
    .word 0x003eb1e1
    .word 0x00090563
    .word 0x005965c3
    .word 0x001a8f47
    .word 0x0022ca59
    .word 0x00468c90
    .word 0x00175e1e
    .word 0x000fd95a
    .word 0x003ffdff
    .word 0x000c9ea7
    .word 0x00517eb8
    .word 0x004d75a8
    .word 0x002b7935
    .word 0x0006c396
    .word 0x0011731c
    .word 0x0026ca35
    .word 0x000d66e2
    .word 0x00691ae6
    .word 0x00399ac0
    .word 0x0069925b
    .word 0x007fa251
    .word 0x0051cc4d
    .word 0x00648959
    .word 0x00170675
    .word 0x0011fc7f
    .word 0x00577336
    .word 0x0068c888
    .word 0x00658613
    .word 0x0079b4b4
    .word 0x006cfeb6
    .word 0x007f9072
    .word 0x004e234b
    .word 0x002aa3d6
    .word 0x00353929
    .word 0x0020c26a
    .word 0x005478ce

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

/* Second input */
twiddles:
    /* Layer 8 - 1 */
    .word 0x000b292a
    .word 0x00399523
    .word 0x0005fe03
    .word 0x002176bf
    .word 0x00171aa8
    .word 0x000872f6
    .word 0x000bc189
    .word 0x0051c998
    .word 0x006fc8f3
    .word 0x003ca555
    .word 0x00533a1b
    .word 0x005be39c
    .word 0x007dbc2d
    .word 0x00781f10
    .word 0x00778da1
    .word 0x0014e995
    .word 0x000bee33
    .word 0x0049fe24
    .word 0x001a324e
    .word 0x005035cf
    .word 0x004b87dd
    .word 0x0010d5f0
    .word 0x007c98a1
    .word 0x00002e67
    .word 0x0062e1ed
    .word 0x00049f9d
    .word 0x002dff14
    .word 0x0021577c
    .word 0x0072c011
    .word 0x00507ceb
    .word 0x004c8d2b
    .word 0x0042ebd2
    .word 0x00336939
    .word 0x006594a4
    .word 0x003d61de
    .word 0x0051f32d
    .word 0x001bfe1e
    .word 0x00154207
    .word 0x0029dc73
    .word 0x001f088f
    .word 0x006e1eb3
    .word 0x0018a6aa
    .word 0x00746ff8
    .word 0x00577847
    .word 0x000b0f44
    .word 0x0059dc44
    .word 0x0077d194
    .word 0x00243b02
    .word 0x0060edfb
    .word 0x0058acce
    .word 0x0040930c
    .word 0x000529f4
    .word 0x0012202d
    .word 0x006172c3
    .word 0x0011ffdd
    .word 0x005fc03b
    .word 0x006676db
    .word 0x004322ca
    .word 0x0027de75
    .word 0x002e4a8e
    .word 0x00781fea
    .word 0x00168979
    .word 0x0076ee00
    .word 0x0018c53a
    /* Layer 7 - 1 */
    .word 0x00654186
    .word 0x001d54cd
    .word 0x0023ec27
    .word 0x000500a8
    .word 0x0007019b
    .word 0x005c957b
    .word 0x002a66a4
    .word 0x002a5acb
    .word 0x00222136
    .word 0x003a4483
    .word 0x007071ea
    .word 0x007a8d75
    .word 0x0009f7db
    .word 0x0034e991
    .word 0x0056ee7b
    .word 0x006b2d61
    .word 0x004c6357
    .word 0x0012b7a5
    .word 0x00766595
    .word 0x005a5136
    .word 0x00240acf
    .word 0x003fd383
    .word 0x00226787
    .word 0x006497da
    .word 0x00533b09
    .word 0x004457e1
    .word 0x00518cb5
    .word 0x00141b2e
    .word 0x0013d630
    .word 0x004abda3
    .word 0x00247c31
    .word 0x00275b35
    /* Layer 6 - 1 */
    .word 0x00638491
    .word 0x004cd1d6
    .word 0x00639693
    .word 0x00535c27
    .word 0x0044d194
    .word 0x007760c9
    .word 0x004f29df
    .word 0x002c35a2
    .word 0x003c45e5
    .word 0x001a32fc
    .word 0x001d89b7
    .word 0x00468d0b
    .word 0x00368ac2
    .word 0x000c7980
    .word 0x0065078e
    .word 0x004bc3e4
    /* Layer 5 - 1 */
    .word 0x005d072c
    .word 0x0054e96a
    .word 0x0036b44a
    .word 0x0009ce44
    .word 0x00699613
    .word 0x005a6e22
    .word 0x0065b78a
    .word 0x003140e4
    /* Layer 8 - 2 */
    .word 0x00213f95
    .word 0x0034fac5
    .word 0x0021d9e3
    .word 0x00598787
    .word 0x00003081
    .word 0x003a920f
    .word 0x003087a8
    .word 0x001a5a70
    .word 0x000c7e49
    .word 0x004239fd
    .word 0x0013fe35
    .word 0x00015cd5
    .word 0x006cbcd3
    .word 0x006cf49a
    .word 0x000418a8
    .word 0x005e69d7
    .word 0x001caf46
    .word 0x001d53ca
    .word 0x0076848b
    .word 0x007db5f6
    .word 0x00578bdd
    .word 0x005cd6de
    .word 0x00371c66
    .word 0x001b0c2c
    .word 0x0060c299
    .word 0x0006fff4
    .word 0x0014ac8c
    .word 0x00522036
    .word 0x004f1ce5
    .word 0x0046b24f
    .word 0x005b71c8
    .word 0x003f4458
    .word 0x00257751
    .word 0x00398274
    .word 0x00395d69
    .word 0x00257281
    .word 0x0038b752
    .word 0x003c817a
    .word 0x00559189
    .word 0x00163712
    .word 0x0003d24e
    .word 0x005701fb
    .word 0x003c60d0
    .word 0x0070792c
    .word 0x00321fb3
    .word 0x00762802
    .word 0x0000e70c
    .word 0x002894c5
    .word 0x00762bcd
    .word 0x00340a88
    .word 0x0067826b
    .word 0x007352f4
    .word 0x00230a4d
    .word 0x007e8b59
    .word 0x001b2a03
    .word 0x001d883c
    .word 0x00362f1e
    .word 0x0019b6a1
    .word 0x001e3469
    .word 0x00006ca4
    .word 0x003c6009
    .word 0x006dd5de
    .word 0x005747c9
    .word 0x007fd928
    /* Layer 7 - 2 */
    .word 0x004e27a8
    .word 0x007c4872
    .word 0x0030c940
    .word 0x00353a7f
    .word 0x0032e0ef
    .word 0x007d4929
    .word 0x002d3358
    .word 0x007882a8
    .word 0x003197ea
    .word 0x00656188
    .word 0x00618b1b
    .word 0x003f9319
    .word 0x005a4d15
    .word 0x0008a163
    .word 0x006e5847
    .word 0x00688eff
    .word 0x00406d79
    .word 0x002d8765
    .word 0x003a392d
    .word 0x0060edab
    .word 0x00042e8c
    .word 0x00312d17
    .word 0x00451912
    .word 0x006c6148
    .word 0x0010ee0c
    .word 0x0054fa66
    .word 0x00624f5f
    .word 0x0059974d
    .word 0x002fa120
    .word 0x00400ab5
    .word 0x002836d1
    .word 0x0050fc10
    /* Layer 6 - 2 */
    .word 0x005ef9ef
    .word 0x004e680d
    .word 0x003d532d
    .word 0x006042ec
    .word 0x003580cc
    .word 0x006f28d5
    .word 0x0071b414
    .word 0x0079dc5d
    .word 0x006e2d3e
    .word 0x0047580a
    .word 0x005fcf5f
    .word 0x002f77a2
    .word 0x0036b98e
    .word 0x00560ec2
    .word 0x004f4ee3
    .word 0x0048e8d7
    /* Layer 5 - 2 */
    .word 0x00146280
    .word 0x00758d13
    .word 0x00069fcd
    .word 0x0035c75a
    .word 0x00198d77
    .word 0x00573c2f
    .word 0x003dff4d
    .word 0x00336d6d
    /* Layer 1--4 */
    .word 0x0012a239
    .word 0x00775e6f
    .word 0x000f56b7
    .word 0x00466d7e
    .word 0x005f601d
    .word 0x0056f251
    .word 0x0049d22c
    .word 0x00092e53
    .word 0x0030d996
    .word 0x002fffce
    .word 0x002c008e
    .word 0x0030d9d6
    .word 0x00467a98
    .word 0x00466a9a
    /* including ninv */
    .word 0x0000b662
    /* ninv */
    .word 0x007f6021
