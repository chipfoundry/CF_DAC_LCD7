// Structural PG wrapper. Analog leaf is CF_DAC_LCD7_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_DAC_LCD7 (
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
    vpwr,
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
    input vpwr;
    input vpwr_ao;
    CF_DAC_LCD7_core u_core (
        .v0(v0),
        .v1(v1),
        .v2(v2),
        .v3(v3),
        .v4(v4),
        .vpwr_lv_int(vpwr_lv_int),
        .d(d),
        .enable_hv(enable_hv),
        .lcd_bias_select(lcd_bias_select),
        .pwrdn(pwrdn),
        .continuous_drive(continuous_drive),
        .holdb(holdb),
        .vgnd(vgnd),
        .vpwr_hv(vpwr_hv),
        .vpwr_lv(vpwr),
        .vpb_hv(vpwr_hv),
        .vpb_lv(vpwr),
        .vnb(vgnd),
        .vpwr_ao(vpwr_ao)
    );
endmodule
