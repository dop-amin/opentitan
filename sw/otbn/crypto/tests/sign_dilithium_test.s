/* Copyright lowRISC contributors. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/**
 * Test for verify_dilithium
*/

.section .text.start

/* Entry point. */
.globl main
main:
  /* Init all-zero register. */
  bn.xor  w31, w31, w31
  
  /* MOD <= dmem[modulus] = DILITHIUM_Q */
  li      x5, 2
  la      x6, modulus
  bn.lid  x5, 0(x6)
  bn.wsrw 0x0, w2

  /* Load stack address */
  la x2, stack_end
  /* Load parameters */
  la x10, signature
  la x11, message
  la x12, messagelen
  lw x12, 0(x12) /* msglen */
  la x13, sk

  jal x1, sign_dilithium

  ecall

.data
.balign 32
.global stack
stack:
    .zero 52800
stack_end:
sk:
  .word 0x11e10e1c
  .word 0x3f00081b
  .word 0x8b5ee628
  .word 0x37b0de3b
  .word 0x1d228fcf
  .word 0x95f5dafc
  .word 0xd538db0e
  .word 0xef5bd806
  .word 0x95164d39
  .word 0x40ff9d05
  .word 0x5d6c25ae
  .word 0xb6bfda5e
  .word 0xf3405f9f
  .word 0x508f587a
  .word 0x08a42c53
  .word 0xb18a16a8
  .word 0x11add087
  .word 0x93102152
  .word 0x2cbf9414
  .word 0x9736aeae
  .word 0x58bc1197
  .word 0x8cf0325b
  .word 0x376f4978
  .word 0x534d609d
  .word 0x1a71a6c0
  .word 0x31116c96
  .word 0x21a8d92a
  .word 0x426508d8
  .word 0xb4a400a6
  .word 0x7240192c
  .word 0x81624202
  .word 0x430a2106
  .word 0x70312385
  .word 0x8b100893
  .word 0x24028c18
  .word 0x84b2c192
  .word 0x8b21c412
  .word 0xc8812104
  .word 0x05480261
  .word 0xc001929c
  .word 0x32198834
  .word 0x4620586c
  .word 0xa2681889
  .word 0x34828dc2
  .word 0x42091c6a
  .word 0xe38ca200
  .word 0x111c49a6
  .word 0x1248c22c
  .word 0x912190e0
  .word 0xc0625098
  .word 0x51246284
  .word 0x642c06ca
  .word 0xb31b0e24
  .word 0x85962431
  .word 0xdb06464b
  .word 0x82c36826
  .word 0x46104468
  .word 0x1421b6c9
  .word 0x45148104
  .word 0x08422450
  .word 0x0b712244
  .word 0xa09a4592
  .word 0x70911a81
  .word 0x0310249c
  .word 0xc5047095
  .word 0x9226c804
  .word 0xc00092d2
  .word 0xa2c060b2
  .word 0x0a190968
  .word 0x180e30a2
  .word 0x00e06989
  .word 0x6248d88d
  .word 0x207114da
  .word 0x07190518
  .word 0x40120444
  .word 0x1140129b
  .word 0x42d11080
  .word 0x50289981
  .word 0x0291108b
  .word 0x20a06424
  .word 0x2146126d
  .word 0x1b8c831c
  .word 0x06016947
  .word 0x2406cc90
  .word 0x20698481
  .word 0x12242c98
  .word 0x50b12105
  .word 0x98023641
  .word 0xa6d16e44
  .word 0x6a051131
  .word 0xca40a8d3
  .word 0xb0624ca8
  .word 0x4a130300
  .word 0x14463453
  .word 0xc5044019
  .word 0x6906e34c
  .word 0x6189b05a
  .word 0x10cb8e16
  .word 0x8e168b80
  .word 0x0b6490d9
  .word 0x83246094
  .word 0x04b31a85
  .word 0x51222654
  .word 0x421c25b8
  .word 0x48810b4a
  .word 0x5a44c442
  .word 0x80232010
  .word 0x25b70984
  .word 0x1448c64c
  .word 0x38194d85
  .word 0x5116600e
  .word 0x0a6a32d8
  .word 0xc1088991
  .word 0x4d96e070
  .word 0x018c4618
  .word 0xc4918d32
  .word 0x61004a05
  .word 0xa2680823
  .word 0xa8104210
  .word 0x21061361
  .word 0x628e248a
  .word 0xb2c98906
  .word 0x84270845
  .word 0x980d2051
  .word 0x42dc6604
  .word 0x85244405
  .word 0x22282624
  .word 0x16206121
  .word 0x2ca60b09
  .word 0xe044110a
  .word 0x48588192
  .word 0x1022420d
  .word 0x8b0906a0
  .word 0x28816e24
  .word 0x8024c08c
  .word 0x848d3090
  .word 0xa64c4036
  .word 0x24045084
  .word 0xa28db694
  .word 0xb3186d92
  .word 0x8500a044
  .word 0x1405b8e3
  .word 0xc2a40405
  .word 0x81228490
  .word 0x0b2d26c3
  .word 0x90cc6620
  .word 0x28389831
  .word 0xc16c1610
  .word 0x10c04534
  .word 0x88c62422
  .word 0xd8324603
  .word 0x201c9040
  .word 0x28150468
  .word 0x4481189a
  .word 0x209c8d98
  .word 0x2c309c6e
  .word 0x6120b8c1
  .word 0x03082142
  .word 0x8cc2a010
  .word 0x53851258
  .word 0x30034c20
  .word 0x8da44c81
  .word 0x518dc044
  .word 0xa71c4c40
  .word 0x6508442c
  .word 0xda4038a0
  .word 0x06818020
  .word 0x0d268c85
  .word 0x9c8ca8e2
  .word 0x42591144
  .word 0x0426c428
  .word 0xa1261444
  .word 0xc0086442
  .word 0x86011185
  .word 0x9931489b
  .word 0x46800cb2
  .word 0x8ca85944
  .word 0x98084200
  .word 0xb50a9082
  .word 0x48246245
  .word 0x44059612
  .word 0xc8004612
  .word 0x61a01388
  .word 0x0a4d28e1
  .word 0x964b91b9
  .word 0x44b89920
  .word 0x984e3100
  .word 0xb6008512
  .word 0x0da08301
  .word 0x180e1514
  .word 0x01191081
  .word 0x68064a22
  .word 0xe18d491a
  .word 0xc61184a2
  .word 0x25262131
  .word 0x036da091
  .word 0xb6a12405
  .word 0x72449408
  .word 0x5b123443
  .word 0xb64120b4
  .word 0x8d88d050
  .word 0x1c4d070b
  .word 0x204c6494
  .word 0x08888b8e
  .word 0x440930e0
  .word 0x86490520
  .word 0x4e13034d
  .word 0x0984c919
  .word 0x431a6137
  .word 0x90804a68
  .word 0x1c310402
  .word 0x40184217
  .word 0x8e30c880
  .word 0xc341a2e1
  .word 0x28a30434
  .word 0x71245122
  .word 0xf4fed688
  .word 0x18ca1267
  .word 0x29ab7228
  .word 0xff8a6719
  .word 0x43e7949d
  .word 0x9ea363e0
  .word 0xf7ca350c
  .word 0xda2e7f2a
  .word 0x5858e628
  .word 0x845d0d52
  .word 0x7c74de67
  .word 0x3b6540f3
  .word 0xf568c252
  .word 0xadf51354
  .word 0x01497ddc
  .word 0xdd3ec31e
  .word 0xa8237453
  .word 0x93868842
  .word 0x78a0ae37
  .word 0x6942121a
  .word 0x72511407
  .word 0x8fbbb32d
  .word 0x55b1e52c
  .word 0xafd2832f
  .word 0x1356f207
  .word 0x4e9f8a91
  .word 0x6057126f
  .word 0x89e58838
  .word 0xf9a58c30
  .word 0x3d14075f
  .word 0x17aeba23
  .word 0xb6360b52
  .word 0xaf4fe9e0
  .word 0x21eb4568
  .word 0x83c3ae31
  .word 0x64c83be6
  .word 0xacf1e54e
  .word 0x922fa8cb
  .word 0xfc7ae511
  .word 0x119c50bf
  .word 0x6674a331
  .word 0x57b391bc
  .word 0x14bcbbdc
  .word 0xc419c3cc
  .word 0x5fc76acc
  .word 0x652cc8cd
  .word 0x7077d096
  .word 0xd37a27c8
  .word 0xa092b170
  .word 0x815fe0b4
  .word 0x5d260e2e
  .word 0x29aa1229
  .word 0xf7c93ff0
  .word 0xc969fa2d
  .word 0x3f1a29b1
  .word 0x2b6483c5
  .word 0x91695f23
  .word 0x837854a9
  .word 0x030af647
  .word 0xce8ec428
  .word 0x2da01be5
  .word 0xbd3a32ff
  .word 0xcb671691
  .word 0x619b5414
  .word 0x255d1c8f
  .word 0x359eac0c
  .word 0x196071e0
  .word 0x0becfb92
  .word 0x21746fae
  .word 0x47408130
  .word 0x2a2fd144
  .word 0xb2bd040e
  .word 0x4c92e065
  .word 0x1f0da4ad
  .word 0xca8af3a1
  .word 0xd4bf0646
  .word 0xb8125757
  .word 0x6f450a26
  .word 0xe7efeedd
  .word 0xcd9b25ca
  .word 0x939b7ba9
  .word 0x88d25f9a
  .word 0xfb499b9c
  .word 0x53354e7d
  .word 0x331ba6de
  .word 0x6b0ebd39
  .word 0xb23bbf16
  .word 0xf93b1027
  .word 0xdc722e20
  .word 0xf7282e50
  .word 0xa45915ce
  .word 0x25371f63
  .word 0x4e4e3220
  .word 0x5f5407ba
  .word 0x944dbf78
  .word 0xbfb8e5b0
  .word 0x76f1b851
  .word 0xfe5c3d53
  .word 0x282f23a5
  .word 0x5f60473a
  .word 0x17db5da6
  .word 0x51c291c8
  .word 0x984e1c01
  .word 0x00ebb6ee
  .word 0x31ba65cb
  .word 0xc825f0c8
  .word 0x2de09f7a
  .word 0xd8c510bc
  .word 0xba5e063a
  .word 0x192a7b5d
  .word 0x2ccba1d5
  .word 0x66e10a16
  .word 0xaff267e8
  .word 0xd6497d8c
  .word 0x613ab83f
  .word 0x0afc5749
  .word 0x745c5a3b
  .word 0x2b9a0e99
  .word 0x7e0c1202
  .word 0x157ee36d
  .word 0xf572b45f
  .word 0xe4450a0f
  .word 0xd7f9f57c
  .word 0x8229c8a4
  .word 0xae86dcc9
  .word 0xd13f7c87
  .word 0xe4435988
  .word 0x3c00fb39
  .word 0xf7429a7a
  .word 0xf0f64f1b
  .word 0x0c148ba2
  .word 0x716ebabd
  .word 0x1bc33ab1
  .word 0xab9ede23
  .word 0x5ae13778
  .word 0xeb33f869
  .word 0x1da7567b
  .word 0xf1cac28b
  .word 0x341ca3f2
  .word 0x6ef4d55b
  .word 0xc6a713e0
  .word 0x37233789
  .word 0x80aa1d19
  .word 0xc4c60a0c
  .word 0x88f69f6c
  .word 0x4713a0b1
  .word 0x74c457f2
  .word 0xc1973daa
  .word 0x008c3ad6
  .word 0x687ba3e0
  .word 0x7cf57316
  .word 0xcc8f9c1c
  .word 0x4c176fd4
  .word 0x849da274
  .word 0x7e1fb7ce
  .word 0xd28c2f6b
  .word 0x43ed89b0
  .word 0xae6dc9f7
  .word 0x4123a281
  .word 0x6fb1208c
  .word 0xa9d1f31d
  .word 0xf628ae78
  .word 0x55ec35df
  .word 0x0ed2049d
  .word 0x4a224bc7
  .word 0x89a231ea
  .word 0x69b015b0
  .word 0xf7bbcbe9
  .word 0x4ce96dcf
  .word 0xe4962afb
  .word 0xc96234ae
  .word 0xdacd0360
  .word 0x1a56db87
  .word 0x0b3ccef2
  .word 0x1304d9a1
  .word 0xcf3ccefd
  .word 0x2cc09043
  .word 0x54f6b91c
  .word 0xc30e82f4
  .word 0x7d451530
  .word 0xbf9f624a
  .word 0xab9c4139
  .word 0x88d64276
  .word 0xce3f105e
  .word 0xcc06420d
  .word 0x6f2cc1e7
  .word 0x3aa34fc4
  .word 0x334c86d0
  .word 0xe8cba771
  .word 0x71b3e320
  .word 0x8fa356b6
  .word 0x8ff17f2e
  .word 0x8a0ca5e4
  .word 0x785df8b3
  .word 0x3578b53f
  .word 0x0b49d8ce
  .word 0x990dee84
  .word 0xc4640daf
  .word 0x36b6ce83
  .word 0x8a4ff56f
  .word 0xb10da4c8
  .word 0xa473a5af
  .word 0x746c32fb
  .word 0xce6e23f0
  .word 0x2071daf3
  .word 0x05ce5c66
  .word 0x504b65dd
  .word 0x833a7271
  .word 0x77cde748
  .word 0x19385193
  .word 0x4eb61cb6
  .word 0xb2e82813
  .word 0xbd64762e
  .word 0x71b5416b
  .word 0x88ea190d
  .word 0x0845d409
  .word 0xdf07e950
  .word 0x5fb7d0c4
  .word 0xe9ec8c58
  .word 0x93e0e962
  .word 0x2440e17c
  .word 0x89d2a446
  .word 0x61e6461a
  .word 0x4f9db27f
  .word 0x062671cd
  .word 0xca9e81f7
  .word 0xd5e0f760
  .word 0xfb7f9eb1
  .word 0x163cc757
  .word 0x00b9eeff
  .word 0xb90c4138
  .word 0x9d5ebbfc
  .word 0xb63eeb51
  .word 0xf69f7e29
  .word 0xfe8870ab
  .word 0x7b239b2d
  .word 0xf8f74cc2
  .word 0xa5180129
  .word 0x0b0ae0e0
  .word 0x37b63f90
  .word 0x7681845c
  .word 0x888c0acd
  .word 0x1959cc75
  .word 0xa811da9c
  .word 0x5cf6787a
  .word 0x0b3304c4
  .word 0xfd717508
  .word 0x71e23306
  .word 0x5aabfd29
  .word 0x3e791f8a
  .word 0x002b4152
  .word 0x745cfd83
  .word 0x0cf63cdb
  .word 0x7cce4325
  .word 0x0e80b291
  .word 0x8d3f2040
  .word 0xde5ffe99
  .word 0x7e8e105b
  .word 0xb9eb80dc
  .word 0x6e9834bb
  .word 0xf5a8c5c5
  .word 0x5257e780
  .word 0xf2f07f90
  .word 0xc266c894
  .word 0x2e361fcf
  .word 0x81680b84
  .word 0x922143bd
  .word 0x631c7801
  .word 0x959a03b0
  .word 0x0f4afbbc
  .word 0xdf69e5ec
  .word 0xe93c5200
  .word 0x22b084c0
  .word 0x2422b0b3
  .word 0x9741282e
  .word 0xa0f0ac96
  .word 0x48f995c9
  .word 0x30fdffdb
  .word 0x05d17ed7
  .word 0x3c94c9a3
  .word 0x5b306b40
  .word 0x246a1ac8
  .word 0x4815298a
  .word 0x437fa6f2
  .word 0x576a968d
  .word 0x7b4b3fd5
  .word 0xe55453e1
  .word 0xf716be81
  .word 0x64d164ad
  .word 0xdf8757e8
  .word 0x10c84958
  .word 0x068dc2af
  .word 0x1b442f48
  .word 0xb23dde5f
  .word 0x25dd36ed
  .word 0xd46466aa
  .word 0x32fa3fd4
  .word 0x8956a2ed
  .word 0xd5a5f4c9
  .word 0x2366fc14
  .word 0x5201541c
  .word 0x44522209
  .word 0xc71def38
  .word 0x973c698d
  .word 0xd2bbde18
  .word 0x74263143
  .word 0x89f199c8
  .word 0xc889e310
  .word 0x8205e5eb
  .word 0xcd42cc4b
  .word 0x19ce9a4a
  .word 0x02226837
  .word 0x3b1f0119
  .word 0x2754331f
  .word 0xbde8f9bf
  .word 0x71085ced
  .word 0xb7c2091a
  .word 0xc564b91c
  .word 0xbf93836a
  .word 0x9b6eb5d2
  .word 0x3e512f6b
  .word 0xdc872568
  .word 0x96d18e1b
  .word 0x87266306
  .word 0x80622510
  .word 0x63007036
  .word 0x5d346d17
  .word 0x82e184e3
  .word 0xa317c4d6
  .word 0x9510b12a
  .word 0x4dbb59ef
  .word 0xf89c1b17
  .word 0x42ac171d
  .word 0x93ed4d66
  .word 0x2c72cb3c
  .word 0xfc7f8569
  .word 0xf2e7c853
  .word 0xb20c4b47
  .word 0xc8ddf2df
  .word 0xc801c6a5
  .word 0x8119704a
  .word 0xf7cc9b19
  .word 0xeca61241
  .word 0xeb4f2c06
  .word 0x8a021a60
  .word 0xad3210f0
  .word 0xd415bdb6
  .word 0x0a55b9c2
  .word 0x62ad50a8
  .word 0x66a3c3cc
  .word 0xb112525d
  .word 0xc5d50f2e
  .word 0x5e1e6a32
  .word 0x550df1b1
  .word 0x5e60947d
  .word 0x6e353f8e
  .word 0xd87fff08
  .word 0x423ced84
  .word 0x94354605
  .word 0x392fafc9
  .word 0x4627b1e4
  .word 0x544b2395
  .word 0x3fd9ceee
  .word 0x1adf0e46
  .word 0x4bcbc213
  .word 0xf622d317
  .word 0x6fe19ff7
  .word 0xc4c15703
  .word 0xe7639873
  .word 0x861f7996
  .word 0x73bffa47
  .word 0x0d0eb00a
  .word 0x6d7009a5
  .word 0x40175794
  .word 0xaf7b1ff6
  .word 0x74276d36
  .word 0xc6b8b5c9
  .word 0x98bed61d
  .word 0x8b02a619
  .word 0xe4b24b26
  .word 0x564ba5ae
  .word 0x5babecd4
  .word 0xc0e08c52
  .word 0x73dbccc0
  .word 0xcb523302
  .word 0xab5b4400
  .word 0xb467746f
  .word 0x61434d64
  .word 0xc6fa64c4
  .word 0xd337b1b5
  .word 0x1b029123
  .word 0x5fcb5f47
  .word 0xd84f7731
  .word 0x65dfabec
  .word 0x57255f47
  .word 0x9c55654c
  .word 0x1cf431b3
  .word 0x748b490f
  .word 0x341c94dd
  .word 0xe6d8504c
  .word 0x7178954f
  .word 0x1f56324a
  .word 0x78afceaa
  .word 0xa46d8e14
  .word 0x698266b5
  .word 0x174b7125
  .word 0xd5fd8a10
  .word 0x3c5a3846
  .word 0xcad554d4
  .word 0x916069a1
  .word 0x7ca48262
  .word 0x23ce1543
  .word 0x25e3d96b
  .word 0xbd4e605c
  .word 0xdb7297c3
  .word 0x36b2e05c

.balign 32
signature:
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000
  .word 0x00000000

.balign 32
message:
  .word 0x8d4d1cd8
  .word 0xfbcb4f73
  .word 0x3f3ddeea
  .word 0xaa9f038a
  .word 0x57992c2a
  .word 0x55ad35e8
  .word 0xbf752eb2
  .word 0x6a55bb57
  .word 0x000000c8
/* account for longer messages in the tests */
.zero 3300
messagelen:
  .word 0x00000021
.balign 32
/* Modulus for reduction */
.global modulus
modulus:
  .word 0x007fe001
  .word 0x007fe001
  .word 0x007fe001
  .word 0x007fe001
  .word 0x007fe001
  .word 0x007fe001
  .word 0x007fe001
  .word 0x007fe001
.global twiddles_fwd
twiddles_fwd:
  /* Layers 1-4 */
  .word 0x00495e02
  .word 0x00397567
  .word 0x00396569
  .word 0x004f062b
  .word 0x0053df73
  .word 0x004fe033
  .word 0x004f066b
  .word 0x0076b1ae
  .word 0x00360dd5
  .word 0x0028edb0
  .word 0x00207fe4
  .word 0x00397283
  .word 0x0070894a
  .word 0x00088192
  .word 0x006d3dc8
  /* Padding */
  .word 0x00000000
  /* Layer 5 - 1*/
  .word 0x004c7294
  .word 0x0041e0b4
  .word 0x0028a3d2
  .word 0x0066528a
  .word 0x004a18a7
  .word 0x00794034
  .word 0x000a52ee
  .word 0x006b7d81
  /* Layer 6 - 1 */
  .word 0x0036f72a
  .word 0x0030911e
  .word 0x0029d13f
  .word 0x00492673
  .word 0x0050685f
  .word 0x002010a2
  .word 0x003887f7
  .word 0x0011b2c3
  .word 0x000603a4
  .word 0x000e2bed
  .word 0x0010b72c
  .word 0x004a5f35
  .word 0x001f9d15
  .word 0x00428cd4
  .word 0x003177f4
  .word 0x0020e612
  /* Layer 7 - 1 */
  .word 0x002ee3f1
  .word 0x0057a930
  .word 0x003fd54c
  .word 0x00503ee1
  .word 0x002648b4
  .word 0x001d90a2
  .word 0x002ae59b
  .word 0x006ef1f5
  .word 0x00137eb9
  .word 0x003ac6ef
  .word 0x004eb2ea
  .word 0x007bb175
  .word 0x001ef256
  .word 0x0045a6d4
  .word 0x0052589c
  .word 0x003f7288
  .word 0x00175102
  .word 0x001187ba
  .word 0x00773e9e
  .word 0x002592ec
  .word 0x00404ce8
  .word 0x001e54e6
  .word 0x001a7e79
  .word 0x004e4817
  .word 0x00075d59
  .word 0x0052aca9
  .word 0x000296d8
  .word 0x004cff12
  .word 0x004aa582
  .word 0x004f16c1
  .word 0x0003978f
  .word 0x0031b859
  /* Layer 8 - 1 */
  .word 0x000006d9
  .word 0x00289838
  .word 0x00120a23
  .word 0x00437ff8
  .word 0x007f735d
  .word 0x0061ab98
  .word 0x00662960
  .word 0x0049b0e3
  .word 0x006257c5
  .word 0x0064b5fe
  .word 0x000154a8
  .word 0x005cd5b4
  .word 0x000c8d0d
  .word 0x00185d96
  .word 0x004bd579
  .word 0x0009b434
  .word 0x00574b3c
  .word 0x007ef8f5
  .word 0x0009b7ff
  .word 0x004dc04e
  .word 0x000f66d5
  .word 0x00437f31
  .word 0x0028de06
  .word 0x007c0db3
  .word 0x0069a8ef
  .word 0x002a4e78
  .word 0x00435e87
  .word 0x004728af
  .word 0x005a6d80
  .word 0x00468298
  .word 0x00465d8d
  .word 0x005a68b0
  .word 0x00409ba9
  .word 0x00246e39
  .word 0x00392db2
  .word 0x0030c31c
  .word 0x002dbfcb
  .word 0x006b3375
  .word 0x0078e00d
  .word 0x001f1d68
  .word 0x0064d3d5
  .word 0x0048c39b
  .word 0x00230923
  .word 0x00285424
  .word 0x00022a0b
  .word 0x00095b76
  .word 0x00628c37
  .word 0x006330bb
  .word 0x0021762a
  .word 0x007bc759
  .word 0x0012eb67
  .word 0x0013232e
  .word 0x007e832c
  .word 0x006be1cc
  .word 0x003da604
  .word 0x007361b8
  .word 0x00658591
  .word 0x004f5859
  .word 0x00454df2
  .word 0x007faf80
  .word 0x0026587a
  .word 0x005e061e
  .word 0x004ae53c
  .word 0x005ea06c
  /* Layer 5 - 2*/
  .word 0x004e9f1d
  .word 0x001a2877
  .word 0x002571df
  .word 0x001649ee
  .word 0x007611bd
  .word 0x00492bb7
  .word 0x002af697
  .word 0x0022d8d5
  /* Layer 6 - 2 */
  .word 0x00341c1d
  .word 0x001ad873
  .word 0x00736681
  .word 0x0049553f
  .word 0x003952f6
  .word 0x0062564a
  .word 0x0065ad05
  .word 0x00439a1c
  .word 0x0053aa5f
  .word 0x0030b622
  .word 0x00087f38
  .word 0x003b0e6d
  .word 0x002c83da
  .word 0x001c496e
  .word 0x00330e2b
  .word 0x001c5b70
  /* Layer 7 - 2 */
  .word 0x005884cc
  .word 0x005b63d0
  .word 0x0035225e
  .word 0x006c09d1
  .word 0x006bc4d3
  .word 0x002e534c
  .word 0x003b8820
  .word 0x002ca4f8
  .word 0x001b4827
  .word 0x005d787a
  .word 0x00400c7e
  .word 0x005bd532
  .word 0x00258ecb
  .word 0x00097a6c
  .word 0x006d285c
  .word 0x00337caa
  .word 0x0014b2a0
  .word 0x0028f186
  .word 0x004af670
  .word 0x0075e826
  .word 0x0005528c
  .word 0x000f6e17
  .word 0x00459b7e
  .word 0x005dbecb
  .word 0x00558536
  .word 0x0055795d
  .word 0x00234a86
  .word 0x0078de66
  .word 0x007adf59
  .word 0x005bf3da
  .word 0x00628b34
  .word 0x001a9e7b
  /* Layer 8 - 2 */
  .word 0x00671ac7
  .word 0x0008f201
  .word 0x00695688
  .word 0x0007c017
  .word 0x00519573
  .word 0x0058018c
  .word 0x003cbd37
  .word 0x00196926
  .word 0x00201fc6
  .word 0x006de024
  .word 0x001e6d3e
  .word 0x006dbfd4
  .word 0x007ab60d
  .word 0x003f4cf5
  .word 0x00273333
  .word 0x001ef206
  .word 0x005ba4ff
  .word 0x00080e6d
  .word 0x002603bd
  .word 0x0074d0bd
  .word 0x002867ba
  .word 0x000b7009
  .word 0x00673957
  .word 0x0011c14e
  .word 0x0060d772
  .word 0x0056038e
  .word 0x006a9dfa
  .word 0x0063e1e3
  .word 0x002decd4
  .word 0x00427e23
  .word 0x001a4b5d
  .word 0x004c76c8
  .word 0x003cf42f
  .word 0x003352d6
  .word 0x002f6316
  .word 0x000d1ff0
  .word 0x005e8885
  .word 0x0051e0ed
  .word 0x007b4064
  .word 0x001cfe14
  .word 0x007fb19a
  .word 0x00034760
  .word 0x006f0a11
  .word 0x00345824
  .word 0x002faa32
  .word 0x0065adb3
  .word 0x0035e1dd
  .word 0x0073f1ce
  .word 0x006af66c
  .word 0x00085260
  .word 0x0007c0f1
  .word 0x000223d4
  .word 0x0023fc65
  .word 0x002ca5e6
  .word 0x00433aac
  .word 0x0010170e
  .word 0x002e1669
  .word 0x00741e78
  .word 0x00776d0b
  .word 0x0068c559
  .word 0x005e6942
  .word 0x0079e1fe
  .word 0x00464ade
  .word 0x0074b6d7

.global twiddles_inv
twiddles_inv:
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

.global reduce32_const
reduce32_const:
    .word 0x1
    .word 0x1
    .word 0x1
    .word 0x1
    .word 0x1
    .word 0x1
    .word 0x1
    .word 0x1

.global power2round_D
power2round_D:
    .word 0xd
    .word 0xd
    .word 0xd
    .word 0xd
    .word 0xd
    .word 0xd
    .word 0xd
    .word 0xd
.global power2round_D_preprocessed
power2round_D_preprocessed:
    .word 0xfff
    .word 0xfff
    .word 0xfff
    .word 0xfff
    .word 0xfff
    .word 0xfff
    .word 0xfff
    .word 0xfff
.global eta
eta:
    .word 0x2
    .word 0x2
    .word 0x2
    .word 0x2
    .word 0x2
    .word 0x2
    .word 0x2
    .word 0x2
.global polyt0_pack_const
polyt0_pack_const:
    .word 0x1000
    .word 0x1000
    .word 0x1000
    .word 0x1000
    .word 0x1000
    .word 0x1000
    .word 0x1000
    .word 0x1000
.global decompose_const
decompose_const:
    .word 0x00002c0b
    .word 0x00002c0b
    .word 0x00002c0b
    .word 0x00002c0b
    .word 0x00002c0b
    .word 0x00002c0b
    .word 0x00002c0b
    .word 0x00002c0b
.global gamma1_vec_const
gamma1_vec_const:
    .word 0x00020000
    .word 0x00020000
    .word 0x00020000
    .word 0x00020000
    .word 0x00020000
    .word 0x00020000
    .word 0x00020000
    .word 0x00020000
.global gamma2_vec_const
gamma2_vec_const:
    .word 0x00017400
    .word 0x00017400
    .word 0x00017400
    .word 0x00017400
    .word 0x00017400
    .word 0x00017400
    .word 0x00017400
    .word 0x00017400
.global qm1half_const
qm1half_const:
    .word 0x003ff000
    .word 0x003ff000
    .word 0x003ff000
    .word 0x003ff000
    .word 0x003ff000
    .word 0x003ff000
    .word 0x003ff000
    .word 0x003ff000
.global decompose_127_const
decompose_127_const:
    .word 0x0000007f
    .word 0x0000007f
    .word 0x0000007f
    .word 0x0000007f
    .word 0x0000007f
    .word 0x0000007f
    .word 0x0000007f
    .word 0x0000007f
.global decompose_43_const
decompose_43_const:
    .word 0x0000002b
    .word 0x0000002b
    .word 0x0000002b
    .word 0x0000002b
    .word 0x0000002b
    .word 0x0000002b
    .word 0x0000002b
    .word 0x0000002b
.global polyeta_unpack_mask
polyeta_unpack_mask:
    .word 0x07
    .word 0x07
    .word 0x07
    .word 0x07
    .word 0x07
    .word 0x07
    .word 0x07
    .word 0x07
.global polyt1_unpack_dilithium_mask
polyt1_unpack_dilithium_mask:
    .word 0x3ff
    .word 0x3ff
    .word 0x3ff
    .word 0x3ff
    .word 0x3ff
    .word 0x3ff
    .word 0x3ff
    .word 0x3ff