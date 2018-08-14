// File: ROMParmLoadSync_TBV.v
// Generated by MyHDL 0.10
// Date: Tue Jun 26 23:46:29 2018


`timescale 1ns/10ps

module ROMParmLoadSync_TBV (

);
// Python Only Testbench  for `ROMParmLoadSync`


reg [3:0] addr = 0;
reg [3:0] dout = 0;
reg clk = 0;
reg rst = 0;



always @(posedge clk) begin: ROMPARMLOADSYNC_TBV_ROMPARMLOADSYNC0_0_READACTION
    if (rst) begin
        dout <= 0;
    end
    else begin
        case (addr)
            0: dout <= 3;
            1: dout <= 2;
            2: dout <= 1;
            default: dout <= 0;
        endcase
    end
end


initial begin: ROMPARMLOADSYNC_TBV_CLK_SIGNAL
    while (1'b1) begin
        clk <= (!clk);
        # 1;
    end
end


initial begin: ROMPARMLOADSYNC_TBV_STIMULES
    integer i;
    for (i=0; i<(3 + 1); i=i+1) begin
        @(posedge clk);
        addr <= i;
    end
    for (i=0; i<4; i=i+1) begin
        @(posedge clk);
        rst <= 1;
        addr <= i;
    end
    $finish;
end


always @(posedge clk) begin: ROMPARMLOADSYNC_TBV_PRINT_DATA
    $write("%h", addr);
    $write(" ");
    $write("%h", dout);
    $write(" ");
    $write("%h", rst);
    $write("\n");
end

endmodule