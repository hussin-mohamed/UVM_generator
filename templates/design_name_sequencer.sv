package /*design_name*/_sequencer;
import uvm_pkg::*;
`include "uvm_macros.svh"
import sequence_item::*;
class /*design_name*/_sqr_class extends uvm_sequencer #(/*design_name*/_seq_item);
    `uvm_component_utils(/*design_name*/_sqr_class)

    function new(string name = "/*design_name*/_sqr_class" , uvm_component parent = null);
        super.new(name,parent);
    endfunction

endclass 
    
endpackage