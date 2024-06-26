// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

use anyhow::Result;
use serde_annotate::Annotate;
use std::any::Any;
use structopt::StructOpt;

use opentitanlib::app::command::CommandDispatch;
use opentitanlib::app::TransportWrapper;
use opentitanlib::transport::cw310;

/// Resets the SAM3X chip on the CW310 FPGA board.
#[derive(Debug, StructOpt)]
pub struct ResetSam3x {}

impl CommandDispatch for ResetSam3x {
    fn run(
        &self,
        _context: &dyn Any,
        transport: &TransportWrapper,
    ) -> Result<Option<Box<dyn Annotate>>> {
        log::info!("Resetting the SAM3X chip");
        transport.dispatch(&cw310::ResetSam3x {})
    }
}
