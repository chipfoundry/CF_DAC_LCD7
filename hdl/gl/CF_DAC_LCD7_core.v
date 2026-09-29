// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
