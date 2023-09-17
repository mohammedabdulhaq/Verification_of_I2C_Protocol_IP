class monitor_0 extends uvm_monitor;
`uvm_component_utils(monitor_0)
virtual intf_0 vif_0;
sequence_item_0 seq_h_0;
uvm_analysis_port #(sequence_item_0) ap_0;

function new(string name = "monitor_0", uvm_component parent = null);
	super.new(name, parent);
	ap_0=new("ap_0",this);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual intf_0) :: get(this, "", "vif_0", vif_0))
	`uvm_fatal(get_type_name(), "Not set at top level");
endfunction
  
  
task run_phase (uvm_phase phase);
  forever 
    begin
      seq_h_0=sequence_item_0::type_id::create("seq_h_0",this);
      @(posedge vif_0.sclk_ref);
//       `uvm_info("Moitor",$sformatf("newd=%d", seq_h_0.newd),UVM_NONE)  
      if(vif_0.newd == 1'b1) 
        begin 
          if(vif_0.wr == 1'b0)
       		  begin
              seq_h_0.wr = vif_0.wr;
              seq_h_0.wdata = vif_0.wdata;
              seq_h_0.addr = vif_0.addr;
              @(posedge vif_0.sclk_ref);
                  
              wait(vif_0.done == 1'b1);
              seq_h_0.rdata = vif_0.rdata;
                  
               repeat(2) @(posedge vif_0.sclk_ref);
//               `uvm_info("Monitor",$sformatf(" DATA READ -> waddr : %0d rdata : %0d", seq_h_0.addr, seq_h_0.rdata),UVM_NONE)  
                // $display("[MON] : DATA READ -> waddr : %0d rdata : %0d", seq_h_0.addr, seq_h_0.rdata);
            end
          else
            begin
              seq_h_0.wr = vif_0.wr;
              seq_h_0.wdata = vif_0.wdata;
              seq_h_0.addr = vif_0.addr;
                
              @(posedge vif_0.sclk_ref);
                
              wait(vif_0.done == 1'b1);
                
              seq_h_0.rdata = vif_0.rdata; 
                
              repeat(2) @(posedge vif_0.sclk_ref); 
				  
              //    $display("[MON] : DATA WRITE -> wdata :%0d waddr : %0d",  seq_h_0.wdata, seq_h_0.addr);      
            end
          $display(" ~~~~~~Monitor~~~~~~req data wr=%b, wdata=%d, rdata=%d,   Addr=%d",vif_0.wr,vif_0.wdata,vif_0.rdata,vif_0.addr);
          ap_0.write(seq_h_0);
        end
		
	  end
endtask


endclass