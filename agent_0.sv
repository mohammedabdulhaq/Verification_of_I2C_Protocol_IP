class agent_0 extends uvm_agent;
`uvm_component_utils(agent_0)
driver_0 drv_h_0;
sequencer_0 sqr_h_0;
monitor_0 mon_h_0;

function new(string name = "agent_0", uvm_component parent = null);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv_h_0 = driver_0::type_id::create("drv_h_0", this);
	sqr_h_0 = sequencer_0::type_id::create("sqr_h_0", this);
	mon_h_0 = monitor_0::type_id::create("mon_h_0", this); 
endfunction
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	drv_h_0.seq_item_port.connect(sqr_h_0.seq_item_export); 
endfunction

endclass