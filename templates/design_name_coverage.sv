package /*design name*/_coverage_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import /*design name*/_sequence_item::*;
class /*design name*/_cover extends uvm_component;
`uvm_component_utils(/*design name*/_cover)
uvm_analysis_export #(/*design name*/_seq_item) cov_export;
uvm_tlm_analysis_fifo #(/*design name*/_seq_item) cov_fifo;
/*design name*/_seq_item item;
parameter maxpos=3, maxneg=-4, zero=0 ;
covergroup g1 ;
        // coverage functions
        endgroup

   function new(string name = "/*design name*/_cover" , uvm_component parent = null);
        super.new(name,parent);
        g1=new();
    endfunction
    
      function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        cov_export=new("sb_export",this);
        cov_fifo=new("sb_fifo",this);
    endfunction 

    function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        cov_export.connect(cov_fifo.analysis_export);
    endfunction 
     task  run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
        cov_fifo.get(item);
        g1.sample();
        end
    endtask
endclass 
    
endpackage