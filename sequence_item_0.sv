class sequence_item_0 extends uvm_sequence_item;
bit newd;
rand bit wr;
rand bit [7:0] wdata;
rand bit [6:0] addr;
bit [7:0] rdata;
bit done;

function new(string name="sequence_item_0");
        	super.new(name);
endfunction
`uvm_object_utils_begin(sequence_item_0)
	`uvm_field_int(newd,UVM_ALL_ON)
	`uvm_field_int(wr,UVM_ALL_ON)
	`uvm_field_int(wdata,UVM_ALL_ON)
	`uvm_field_int(addr,UVM_ALL_ON)
	`uvm_field_int(rdata,UVM_ALL_ON)
	`uvm_field_int(done,UVM_ALL_ON)
`uvm_object_utils_end
// constraint w_data{wdata<10;}
// constraint addr_c { addr > 0; addr < 5; }
constraint rd_wr_c {wr dist {1 :/ 50 ,  0 :/ 50};}
endclass