class driver_0 extends uvm_driver #(sequence_item_0);
`uvm_component_utils(driver_0)
virtual intf_0 vif_0;
function new(string name = "driver_0", uvm_component parent = null);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual intf_0) :: get(this, "", "vif_0", vif_0))
	`uvm_fatal(get_type_name(), "Not set at top level");
endfunction
task run_phase (uvm_phase phase);
  forever begin
      
	
		seq_item_port.get_next_item(req);
    fork
		drive();
    join
//     $display(" ~~~~~~Driver~~~~~~req data wr=%b   ,  wdata=%d  , Addr=%d",req.wr,req.wdata,req.addr);
    
      seq_item_port.item_done();
	end
  
endtask
  
  
task drive();
      if(vif_0.rst) begin
        vif_0.newd <= 1'b0;
        vif_0.wr <= 1'b0;
        vif_0.wdata <= 0;
        vif_0.addr  <= 0;
      end
      else 
        begin
          @(posedge vif_0.sclk_ref);
          vif_0.newd  <= 1'b1;
          vif_0.wr    <= req.wr;
          vif_0.wdata <= req.wdata;
          vif_0.addr  <= req.addr; 
                    
          
          @(posedge vif_0.sclk_ref);
          vif_0.newd <= 1'b0;
          
          
          wait(vif_0.done == 1'b1);
          @(posedge vif_0.sclk_ref);
          wait(vif_0.done == 1'b0);
//           `uvm_info("DRIVER",$sformatf("wr:%0b wdata :%0d waddr : %0d rdata : %0d", vif_0.wr, vif_0.wdata, vif_0.addr, vif_0.rdata),UVM_NONE)

        //   $display("[DRV] : wr:%0b wdata :%0d waddr : %0d rdata : %0d", vif_0.wr, vif_0.wdata, vif_0.addr, vif_0.rdata); 
        end
endtask

endclass