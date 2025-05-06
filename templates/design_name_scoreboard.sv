package /*design name*/_scoreborad_pck;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import /*design name*/_sequence_item::*;
class  /*design name*/_scoreborad extends uvm_scoreboard;
`uvm_component_utils(/*design name*/_scoreborad)

uvm_analysis_export #(/*design name*/_seq_item) sb_export;
uvm_tlm_analysis_fifo #(/*design name*/_seq_item) sb_fifo;
/*design name*/_seq_item item;
static int correct_count =0;
static int wrong_count =0;
// define refrences variables
    function new(string name = "/*design name*/_scoreborad" , uvm_component parent = null);
        super.new(name,parent);
    endfunction
    
      function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        sb_export=new("sb_export",this);
        sb_fifo=new("sb_fifo",this);
    endfunction 

    function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        sb_export.connect(sb_fifo.analysis_export);
    endfunction 
     task  run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
        sb_fifo.get(item);
        // check results
        end
    endtask //
endclass 

    
endpackage