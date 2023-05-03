// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file was autogenerated by `//sw/host/hsmtool/scripts/pkcs11_consts.py`.
// Do not edit.'

use cryptoki_sys::*;
use num_enum::{FromPrimitive, IntoPrimitive};
use std::convert::TryFrom;

use crate::util::attribute::{AttrData, AttributeError};

#[derive(
    Clone,
    Copy,
    Debug,
    PartialEq,
    Eq,
    Hash,
    IntoPrimitive,
    FromPrimitive,
    serde::Serialize,
    serde::Deserialize,
)]
#[repr(u64)]
pub enum KeyType {
    #[serde(rename = "CKK_RSA")]
    Rsa = CKK_RSA,
    #[serde(rename = "CKK_DSA")]
    Dsa = CKK_DSA,
    #[serde(rename = "CKK_DH")]
    Dh = CKK_DH,
    #[serde(rename = "CKK_EC")]
    Ec = CKK_EC,
    #[serde(rename = "CKK_X9_42_DH")]
    X942Dh = CKK_X9_42_DH,
    #[serde(rename = "CKK_KEA")]
    Kea = CKK_KEA,
    #[serde(rename = "CKK_GENERIC_SECRET")]
    GenericSecret = CKK_GENERIC_SECRET,
    #[serde(rename = "CKK_RC2")]
    Rc2 = CKK_RC2,
    #[serde(rename = "CKK_RC4")]
    Rc4 = CKK_RC4,
    #[serde(rename = "CKK_DES")]
    Des = CKK_DES,
    #[serde(rename = "CKK_DES2")]
    Des2 = CKK_DES2,
    #[serde(rename = "CKK_DES3")]
    Des3 = CKK_DES3,
    #[serde(rename = "CKK_CAST")]
    Cast = CKK_CAST,
    #[serde(rename = "CKK_CAST3")]
    Cast3 = CKK_CAST3,
    #[serde(rename = "CKK_CAST128")]
    Cast128 = CKK_CAST128,
    #[serde(rename = "CKK_RC5")]
    Rc5 = CKK_RC5,
    #[serde(rename = "CKK_IDEA")]
    Idea = CKK_IDEA,
    #[serde(rename = "CKK_SKIPJACK")]
    Skipjack = CKK_SKIPJACK,
    #[serde(rename = "CKK_BATON")]
    Baton = CKK_BATON,
    #[serde(rename = "CKK_JUNIPER")]
    Juniper = CKK_JUNIPER,
    #[serde(rename = "CKK_CDMF")]
    Cdmf = CKK_CDMF,
    #[serde(rename = "CKK_AES")]
    Aes = CKK_AES,
    #[serde(rename = "CKK_BLOWFISH")]
    Blowfish = CKK_BLOWFISH,
    #[serde(rename = "CKK_TWOFISH")]
    Twofish = CKK_TWOFISH,
    #[serde(rename = "CKK_SECURID")]
    Securid = CKK_SECURID,
    #[serde(rename = "CKK_HOTP")]
    Hotp = CKK_HOTP,
    #[serde(rename = "CKK_ACTI")]
    Acti = CKK_ACTI,
    #[serde(rename = "CKK_CAMELLIA")]
    Camellia = CKK_CAMELLIA,
    #[serde(rename = "CKK_ARIA")]
    Aria = CKK_ARIA,
    #[serde(rename = "CKK_MD5_HMAC")]
    Md5Hmac = CKK_MD5_HMAC,
    #[serde(rename = "CKK_SHA_1_HMAC")]
    Sha1Hmac = CKK_SHA_1_HMAC,
    #[serde(rename = "CKK_RIPEMD128_HMAC")]
    Ripemd128Hmac = CKK_RIPEMD128_HMAC,
    #[serde(rename = "CKK_RIPEMD160_HMAC")]
    Ripemd160Hmac = CKK_RIPEMD160_HMAC,
    #[serde(rename = "CKK_SHA256_HMAC")]
    Sha256Hmac = CKK_SHA256_HMAC,
    #[serde(rename = "CKK_SHA384_HMAC")]
    Sha384Hmac = CKK_SHA384_HMAC,
    #[serde(rename = "CKK_SHA512_HMAC")]
    Sha512Hmac = CKK_SHA512_HMAC,
    #[serde(rename = "CKK_SHA224_HMAC")]
    Sha224Hmac = CKK_SHA224_HMAC,
    #[serde(rename = "CKK_SEED")]
    Seed = CKK_SEED,
    #[serde(rename = "CKK_GOSTR3410")]
    Gostr3410 = CKK_GOSTR3410,
    #[serde(rename = "CKK_GOSTR3411")]
    Gostr3411 = CKK_GOSTR3411,
    #[serde(rename = "CKK_GOST28147")]
    Gost28147 = CKK_GOST28147,
    #[serde(rename = "CKK_EC_EDWARDS")]
    EcEdwards = CKK_EC_EDWARDS,
    #[serde(rename = "CKK_EC_MONTGOMERY")]
    EcMontgomery = CKK_EC_MONTGOMERY,
    #[serde(rename = "CKK_VENDOR_DEFINED")]
    VendorDefined = CKK_VENDOR_DEFINED,
    #[num_enum(catch_all)]
    UnknownKeyType(u64) = u64::MAX,
}

impl From<cryptoki::object::KeyType> for KeyType {
    fn from(val: cryptoki::object::KeyType) -> Self {
        let val = CK_KEY_TYPE::from(val);
        Self::from(val)
    }
}

impl TryFrom<KeyType> for cryptoki::object::KeyType {
    type Error = cryptoki::error::Error;
    fn try_from(val: KeyType) -> Result<Self, Self::Error> {
        let val = CK_KEY_TYPE::from(val);
        cryptoki::object::KeyType::try_from(val)
    }
}

impl TryFrom<&AttrData> for KeyType {
    type Error = AttributeError;
    fn try_from(val: &AttrData) -> Result<Self, Self::Error> {
        match val {
            AttrData::KeyType(x) => Ok(*x),
            _ => Err(AttributeError::EncodingError),
        }
    }
}

impl From<KeyType> for AttrData {
    fn from(val: KeyType) -> Self {
        AttrData::KeyType(val)
    }
}
