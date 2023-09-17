class sequence_0 extends uvm_sequence#(sequence_item_0);
`uvm_object_utils(sequence_0)
sequence_item_0 my_item_0;

function new(string name="sequence_0");
        	super.new(name);
        endfunction

task body();
        	begin
        		my_item_0 =sequence_item_0::type_id::create("my_item_0");
        		start_item(my_item_0);
        		assert(my_item_0.randomize());
              
        		finish_item(my_item_0);
        	end
        endtask

endclass