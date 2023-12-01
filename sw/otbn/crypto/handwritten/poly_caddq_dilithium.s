.text

/**
 * Constant Time Dilithium conditional add q
 *
 * Returns: caddq(input1)
 *
 * This implements caddq for Dilithium, where n=256,q=8380417.
 *
 * Flags: Clobbers FG0, has no meaning beyond the scope of this subroutine.
 *
 * 
 * @param[in]  x10: dptr_input1, dmem pointer to first word of input1 polynomial
 * @param[in]  w31: all-zero
 *
 * clobbered registers: x5-x7, x10, w2-w6
 */
.globl poly_caddq_dilithium
poly_caddq_dilithium:
    /* Set up constants for input/state */
    li x5, 3
    li x6, 6

    /* Load q */
    la     x7, modulus
    bn.lid x6, 0(x7)

    /* Set up WDR constants for input/state */
    li x7, 2    

    LOOPI 32, 5
        bn.lid x7, 0(x10)
        
        /* (a >> 31) */
        bn.shv.8S w3, w2 a >> 31
        /* (a >> 31) & Q */
        bn.and w3, w3, w6
        /* a += (a >> 31) & Q */
        bn.addv.8S w2, w2, w3

        bn.sid x7, 0(x10++)

    ret