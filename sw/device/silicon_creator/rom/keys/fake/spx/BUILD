# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "fake",
    srcs = [
        "sigverify_spx_keys_fake.c",
        "//sw/device/silicon_creator/rom:sigverify_keys.h",
        "//sw/device/silicon_creator/rom:sigverify_keys_spx.h",
    ],
    hdrs = [
        "dev_key_0_spx.h",
        "prod_key_0_spx.h",
        "test_key_0_spx.h",
    ],
    deps = [
        "//sw/device/lib/base:macros",
        "//sw/device/silicon_creator/lib/sigverify",
    ],
)

cc_test(
    name = "fake_unittest",
    srcs = ["sigverify_spx_keys_fake_unittest.cc"],
    deps = [
        ":fake",
        "//hw/top_earlgrey/sw/autogen:top_earlgrey",
        "//sw/device/silicon_creator/rom:sigverify_keys",
        "//sw/device/silicon_creator/rom/keys/fake",
        "//sw/device/silicon_creator/testing:rom_test",
        "@googletest//:gtest_main",
    ],
)

# TODO: `filegroup`s for key files.
