class test extends uvm_test;
`uvm_component_utils(test)
sequence_0 seq_h_0;
env env_h;

function new(string name , uvm_component parent);
	super.new(name, parent);
endfunction
  
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env_h = env::type_id::create("env_h",this);
  seq_h_0= sequence_0::type_id::create("seq_h_0",this);
endfunction
  
  
task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	

  repeat(100) begin
		
		#5;	seq_h_0.start(env_h.agt_h_0.sqr_h_0);

		
	end
	phase.drop_objection(this); 
endtask


endclass