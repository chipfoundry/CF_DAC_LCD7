`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_DAC_LCD7_core.
// Drop this file in place of hdl/gl/CF_DAC_LCD7_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * pwrdn low drives vpwr_lv_int from vpwr_lv. pwrdn high releases it.
//   * enable_hv high and pwrdn low copies d[4:0] onto v4..v0.
//   * enable_hv low or pwrdn high clears v4..v0.
// This is not a 7-bit DAC and it does not produce LCD bias ratios.
// d[6], lcd_bias_select, continuous_drive, and holdb are not modeled.
// vpwr_hv, vpwr_ao, vpb_hv, vpb_lv, vnb, and vgnd are supply inputs.

module CF_DAC_LCD7_core (
    v0,
    v1,
    v2,
    v3,
    v4,
    vpwr_lv_int,
    d,
    enable_hv,
    lcd_bias_select,
    pwrdn,
    continuous_drive,
    holdb,
    vgnd,
    vpwr_hv,
    vpwr_lv,
    vpb_hv,
    vpb_lv,
    vnb,
    vpwr_ao
);
    output v0;
    output v1;
    output v2;
    output v3;
    output v4;
    output vpwr_lv_int;
    input [6:0] d;
    input enable_hv;
    input [1:0] lcd_bias_select;
    input pwrdn;
    input continuous_drive;
    input holdb;
    input vgnd;
    input vpwr_hv;
    input vpwr_lv;
    input vpb_hv;
    input vpb_lv;
    input vnb;
    input vpwr_ao;

    wire run = (enable_hv === 1'b1) && (pwrdn === 1'b0);
    assign vpwr_lv_int = (pwrdn === 1'b0) ? vpwr_lv : 1'bz;
    assign v0 = run ? d[0] : 1'b0;
    assign v1 = run ? d[1] : 1'b0;
    assign v2 = run ? d[2] : 1'b0;
    assign v3 = run ? d[3] : 1'b0;
    assign v4 = run ? d[4] : 1'b0;
endmodule
