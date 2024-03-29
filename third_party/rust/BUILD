# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
load("@rules_rust//crate_universe:defs.bzl", "crate", "crates_vendor")

crates_vendor(
    name = "crate_index",
    annotations = {
        "libudev-sys": [crate.annotation(
            patch_args = ["-p1"],
            patches = ["@//third_party/rust/patches:libudev-sys-0.1.4.patch"],
        )],
        "mdbook": [crate.annotation(
            gen_binaries = True,
            patch_args = ["-p1"],
            patches = ["@//third_party/rust/patches:mdbook-landing-page-links.patch"],
        )],
        "cryptoki": [crate.annotation(
            patch_args = ["-p2"],
            patches = ["@//third_party/rust/patches:cryptoki-vendor-defined-mechanism-type.patch"],
        )],
        "cryptoki-sys": [crate.annotation(
            additive_build_file_content = """
                filegroup(
                    name = "binding_srcs",
                    srcs = [
                        "src/lib.rs",
                        "src/bindings/x86_64-unknown-linux-gnu.rs",
                    ],
                )
            """,
        )],
        "pqcrypto-internals": [crate.annotation(
            additive_build_file_content = """
                filegroup(name="include", srcs=glob(["include/*", "include/**"]))
            """,
        )],
        "pqcrypto-sphincsplus": [crate.annotation(
            build_script_data = [
                "@crate_index__pqcrypto-internals-0.2.4//:include",
            ],
            build_script_env = {
                "DEP_PQCRYPTO_INTERNALS_INCLUDEPATH": "../crate_index__pqcrypto-internals-0.2.4/include",
            },
        )],
    },
    cargo_lockfile = "//third_party/rust:Cargo.lock",
    manifests = ["//third_party/rust:Cargo.toml"],
    mode = "remote",
    tags = ["manual"],
    vendor_path = "crates",
)
