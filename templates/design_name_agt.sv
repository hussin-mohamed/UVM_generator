package /*design name*/_agtt;
    import uvm_pkg::*;
    import /*design name*/_drive::*;
    import /*design name*/_seqr_pac::*;
    import /*design name*/_monitor::*;
    import /*design name*/_configuration::*;
    import /*design name*/_sequence_item::*;
    `include "uvm_macros.svh"
    class /*design name*/_agt extends uvm_agent;
        `uvm_component_utils(/*design name*/_agt)
        /*design name*/_driver driver;
        /*design name*/_monitor monitor;
        /*design name*/_confg cfg;
        /*design name*/_sqr_class sqr;
        uvm_analysis_port #(/*design name*/_seq_item) agt_ap;
        function new(string name="/*design name*/_agt", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()
        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            
            monitor = /*design name*/_monitor::type_id::create("mon",this);
        if(!uvm_config_db #(/*design name*/_confg) :: get(this,"","CFG",cfg))
        `uvm_fatal("build_phase","no");
        if(cfg.is_active==UVM_ACTIVE)
        begin
            driver = /*design name*/_driver::type_id::create("driver",this);
            sqr = /*design name*/_sqr_class::type_id::create("sqr",this);
        end
        agt_ap = new("agt_ap",this);
        endfunction
        function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        
        monitor./*design name*/_test_vif=cfg./*design name*/_test_vif;
        if(cfg.is_active==UVM_ACTIVE)
        begin
            driver./*design name*/_test_vif=cfg./*design name*/_test_vif;
            driver.seq_item_port.connect(sqr.seq_item_export);
        end
        monitor.mon_ap.connect(agt_ap);
    endfunction 
    endclass //className extends superClass
endpackage