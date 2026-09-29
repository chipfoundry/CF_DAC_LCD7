#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_dac_lcd7_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_DAC_LCD7.v" \
  "$ROOT/verify/beh_model/CF_DAC_LCD7_core.v" \
  "$ROOT/verify/beh_model/tb_CF_DAC_LCD7.v"
vvp "$OUT"
