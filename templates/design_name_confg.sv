package /*design name*/_configuration;
import uvm_pkg::*;
`include "uvm_macros.svh"
class /*design name*/_confg extends uvm_object;
    `uvm_object_utils(/*design name*/_confg)
        virtual /*design name*/_inter /*design name*/_test_vif;
        uvm_active_passive_enum is_active;
        function new(string name = "/*design name*/_confg" );
        super.new(name);
        endfunction
endclass //className extends superClass
endpackage