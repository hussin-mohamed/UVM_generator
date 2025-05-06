package /*design_name*/_sequence_item;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    class /*design_name*/_seq_item extends uvm_sequence_item;
        `uvm_object_utils(/*design_name*/_seq_item)
        function new(string name = "/*design_name*/_seq_item");
            super.new(name);
        endfunction
        // define variables and constraints
        
    endclass //seq_item extends superClass
endpackage