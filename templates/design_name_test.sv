package /*design name*/_test_pkg;
import /*design name*/_env_pac::*;
import uvm_pkg::*;
// import sequences
import /*design name*/_configuration::*;
`include "uvm_macros.svh"
class /*design name*/_test extends uvm_test;
    `uvm_component_utils(/*design name*/_test)
    /*design name*/_confg conf_ /*design_name*/;
    /*design name*/_env env_ /*design_name*/;
    // define sequences
    function new(string name = "/*design name*/_test",uvm_component parent = null);
        super.new(name,parent);
    endfunction 

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        env_ /*design_name*/ = /*design name*/_env::type_id::create("env",this);
        cfgg_ /*design_name*/= /*design name*/_confg::type_id::create("cfgg",this);
        reset_seqq = reset_seq::type_id::create("reset_seq",this);
        main_seq1 = main_seq_con1::type_id::create("main_seq1",this);
        main_seq2 = main_seq_con2::type_id::create("main_seq2",this);
        if(!uvm_config_db#(virtual /*design name*/_inter)::get(this,"","/*design name*/_test_vif",conf_ /*design_name*/./*design name*/_test_vif))
        `uvm_fatal("build_phase","a333333333");
        conf_ /*design_name*/.is_active = UVM_ACTIVE;// to make it passive we can use UVM_PASSIVE
        uvm_config_db#(/*design name*/_confg)::set(null,"*","CFG",conf_ /*design_name*/_);
    endfunction 

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        // run sequences
        
        
        `uvm_info("run_phase", $sformatf("correct_count=%0d , wrong_count = %0d",env.sb.correct_count,env.sb.wrong_count),UVM_MEDIUM)

        phase.drop_objection(this);
    endtask
    

endclass 

endpackage