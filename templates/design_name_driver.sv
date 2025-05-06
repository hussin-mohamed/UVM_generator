package /*design name*/_drive;
    import uvm_pkg::*;
    import /*design name*/_configuration::*;
    import /*design name*/_sequence_item::*;
    `include "uvm_macros.svh"
    class /*design name*/_driver extends uvm_driver#(/*design name*/_seq_item);
    `uvm_component_utils(/*design name*/_driver)
    /*design name*/_seq_item item;
    virtual /*design name*/_inter /*design name*/_test_vif;
        function new(string name="/*design name*/_driver",uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()
        function void build_phase (uvm_phase phase);
        super.build_phase(phase);
    endfunction 
        task run_phase (uvm_phase phase);
            super.run_phase(phase);
            forever begin
                item = seq_item::type_id::create("item");
                seq_item_port.get_next_item(item);
                // drive the interface
                @(negedge /*design name*/_test_vif.clk);
                seq_item_port.item_done();
            end
        endtask //run_phase
    endclass //className extends superClass
endpackage