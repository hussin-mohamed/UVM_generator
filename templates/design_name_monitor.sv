package /*design name*/_monitor;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import /*design name*/_sequence_item::*;
    class /*design name*/_monitor extends uvm_monitor;
        `uvm_component_utils(/*design name*/_monitor)
        seq_item item;
        virtual /*design name*/_inter /*design name*/_test_vif;
        uvm_analysis_port #(/*design name*/_seq_item) mon_ap;
        function new(string name = "/*design name*/_monitor",uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()
        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            mon_ap=new("mon_ap",this);
        endfunction 
        task  run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            item = /*design name*/_seq_item::type_id::create("item");
            @(negedge /*design name*/_test_vif.clk);
            //assign item variables 
            mon_ap.write(item);
        end
    endtask //
    endclass //className extends superClass
endpackage