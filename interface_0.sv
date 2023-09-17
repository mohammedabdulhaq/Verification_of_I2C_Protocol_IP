interface intf_0(input logic clk,rst);
	logic newd;
	logic wr;
	logic [7:0] wdata;
	logic [6:0] addr;
	logic [7:0] rdata;
	logic done;
	logic sclk_ref;
	logic [7:0] mem [128];
endinterface