# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//rules:ujson.bzl", "ujson_rust")

package(default_visibility = ["//visibility:public"])

rust_binary(
    name = "sw_strap_value",
    srcs = [
        "src/main.rs",
    ],
    deps = [
        "//sw/host/opentitanlib",
        "@crate_index//:anyhow",
        "@crate_index//:humantime",
        "@crate_index//:log",
        "@crate_index//:structopt",
    ],
)
