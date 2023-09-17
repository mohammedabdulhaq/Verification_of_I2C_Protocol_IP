class env extends uvm_env;
`uvm_component_utils(env)
agent_0 agt_h_0;
my_scoreboard scb_h;

function new(string name = "env", uvm_component parent = null);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	agt_h_0= agent_0::type_id::create("agt_h_0",this);

	scb_h=my_scoreboard::type_id::create("scb_h",this);
endfunction
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	agt_h_0.mon_h_0.ap_0.connect(scb_h.fifo_h.analysis_export);
endfunction

endclass