`timescale 1ns / 1ps

module tb_CF_DAC_LCD7;
    reg vpwr;
    reg enable_hv;
    reg pwrdn;
    reg [6:0] d;
    wire v0;
    wire v1;
    wire vpwr_lv_int;
    integer errors;

    CF_DAC_LCD7 dut (
        .vpwr(vpwr),
        .enable_hv(enable_hv),
        .pwrdn(pwrdn),
        .d(d),
        .v0(v0),
        .v1(v1),
        .vpwr_lv_int(vpwr_lv_int)
    );

    initial begin
        errors = 0;
        vpwr = 1'b1;
        enable_hv = 1'b1;
        pwrdn = 1'b1;
        d = 7'b0000001;
        #1;
        if (v0 !== 1'b0 || v1 !== 1'b0 || vpwr_lv_int !== 1'bz) begin
            $display("FAIL powered down v0=%b v1=%b sw=%b", v0, v1, vpwr_lv_int);
            errors = errors + 1;
        end
        pwrdn = 1'b0;
        enable_hv = 1'b0;
        #1;
        if (v0 !== 1'b0 || vpwr_lv_int !== 1'b1) begin
            $display("FAIL disabled v0=%b sw=%b", v0, vpwr_lv_int);
            errors = errors + 1;
        end
        enable_hv = 1'b1;
        d = 7'b0000001;
        #1;
        if (v0 !== 1'b1 || v1 !== 1'b0 || vpwr_lv_int !== 1'b1) begin
            $display("FAIL code0 v0=%b v1=%b sw=%b", v0, v1, vpwr_lv_int);
            errors = errors + 1;
        end
        d = 7'b0000010;
        #1;
        if (v0 !== 1'b0 || v1 !== 1'b1) begin
            $display("FAIL code1 v0=%b v1=%b", v0, v1);
            errors = errors + 1;
        end
        if (errors == 0) $display("PASS");
        else begin
            $display("FAIL %0d", errors);
            $fatal(1);
        end
        $finish;
    end
endmodule
