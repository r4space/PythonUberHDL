// File: S0L0_TBV.v
// Generated by MyHDL 0.10
// Date: Mon Aug 20 11:53:20 2018


`timescale 1ns/10ps

module S0L0_TBV (

);
// myHDL -> Verilog Testbench for `S0L0`


reg clk = 0;
reg [1:0] sw = 0;
reg [3:0] led = 0;
wire [9:0] swTVals;

assign swTVals = 10'd336;


always @(clk, sw, led) begin: S0L0_TBV_PRINT_DATA
    $write("%h", sw);
    $write(" ");
    $write("%h", clk);
    $write(" ");
    $write("%h", led);
    $write("\n");
end


always @(posedge clk) begin: S0L0_TBV_S0L00_0_LOGIC
    if ((sw[0] == 0)) begin
        led[0] <= 1'b1;
    end
    else begin
        led[0] <= 1'b0;
    end
end


initial begin: S0L0_TBV_CLK_SIGNAL
    while (1'b1) begin
        clk <= (!clk);
        # 1;
    end
end


initial begin: S0L0_TBV_STIMULES
    integer i;
    for (i=0; i<10; i=i+1) begin
        sw[0] <= swTVals[i];
        @(posedge clk);
    end
    $finish;
end

endmodule