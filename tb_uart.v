`timescale 1 ns / 1 ps
module tb();
reg clk,rst;
//wire [7:0] LED;
reg RsRx_tb;
wire RsTx_tb;

//wire test_bit = tb.dut.u_CORTEXM0INTEGRATION.u_cortexm0.cm0_r00[2];

//assign tb.dut.u_CORTEXM0INTEGRATION.u_cortexm0.cm0_r00 = (test_bit==1'b0) ? 32'd0:tb.dut.u_CORTEXM0INTEGRATION.u_cortexm0.cm0_r00;

always@*
RsRx_tb = RsTx_tb;

AHBLITE_SYS dut(.CLK(clk),
             .RESET(rst),
//             .TCK_SWCLK(),
//             .TDI_NC(),
//             .TMS_SWDIO(),
//             .TDO_SWO(),
//             //.LED(LED)
             .RsRx(RsRx_tb),
             .RsTx(RsTx_tb)
             );

initial
    begin
        rst=0;
        clk=0;
       
        #7;
        rst=1;
    end

always #5 clk=~clk;

initial 
    begin
        $dumpfile ("AHBLITE_SYS.vcd");
        $dumpvars (0, tb);
        #1;
    end

endmodule
