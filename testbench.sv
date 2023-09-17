// Author : Mohammed Abdul Haq


`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface_0.sv"
`include "package.sv"

module top;
bit clk,rst;

always
begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
	rst=1;
	#10;
	rst=0;
end

intf_0 vif_0(clk,rst);

i2c_top DUT_0(.clk(vif_0.clk),
	.rst(vif_0.rst),
	.newd(vif_0.newd),
	.wr(vif_0.wr),
	.wdata(vif_0.wdata),
	.addr(vif_0.addr),
	.rdata(vif_0.rdata),
	.done(vif_0.done));

	
initial begin
        	uvm_config_db#(virtual intf_0)::set(uvm_root::get(), "*", "vif_0", vif_0);
        end
initial begin
        	$dumpfile("dump.vcd");
        	$dumpvars();
        end

initial begin
	run_test("test");
end
assign vif_0.sclk_ref=DUT_0.e1.sclk_ref;
assign vif_0.mem=DUT_0.m1.mem;
endmodule