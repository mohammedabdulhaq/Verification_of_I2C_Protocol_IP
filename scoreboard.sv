class my_scoreboard extends uvm_scoreboard;

`uvm_component_utils(my_scoreboard)
uvm_tlm_analysis_fifo #( sequence_item_0) fifo_h;
sequence_item_0 my_item_0;
virtual intf_0 vif_0;

function new(string name="my_scoreboard", uvm_component parent);
	super.new(name, parent);
	my_item_0 = new("my_item_0");
	fifo_h=new("fifo_h",this);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  if(!uvm_config_db#(virtual intf_0) :: get(this, "", "vif_0", vif_0))
	`uvm_fatal(get_type_name(), "Not set at top level");
endfunction

task run_phase (uvm_phase phase);
	forever begin
		fork
			fifo_h.get(my_item_0);
		join
// 		compare_basic();
    compare_logic();
	end
endtask

virtual function void compare_basic();
	// Checking the Basic functionality 
	if(my_item_0.wr == 1'b1)
    begin
      `uvm_info("Scoreboard",$sformatf("WRITE Transfer happened ------> wdata :%0d waddr : %0d ", my_item_0.wdata, my_item_0.addr),UVM_NONE)
    end
  else 
    begin
      `uvm_info("Scoreboard",$sformatf("WRITE Transfer happened ------> wdata :%0d waddr : %0d ", my_item_0.rdata, my_item_0.addr),UVM_NONE)
    end
endfunction

virtual function void compare_logic();
  if(my_item_0.wr==1'b1)
    begin
      if(vif_0.mem[my_item_0.addr]==my_item_0.wdata)
        begin
          `uvm_info("Scoreboard",$sformatf("~~~~~~~~~PASS~~~~~~~~"),UVM_NONE)
        end
      else
        `uvm_info("Scoreboard",$sformatf("!!!!!!!!!!!!!FAIL!!!!!!!!"),UVM_NONE)
    end
  else
    begin
      if(vif_0.mem[my_item_0.addr]==my_item_0.rdata)
        begin
          `uvm_info("Scoreboard",$sformatf("~~~~~~~~~PASS~~~~~~~~"),UVM_NONE)
        end
      else
        `uvm_info("Scoreboard",$sformatf("!!!!!!!!!!!!!FAIL!!!!!!!!"),UVM_NONE)
    end
endfunction
endclass