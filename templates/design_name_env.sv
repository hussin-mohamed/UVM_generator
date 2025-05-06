package /*design name*/_env_pac;
import uvm_pkg::*;
import /*design name*/_agtt::*;
import /*design name*/_coverage_pkg::*;
import /*design name*/_scoreborad_pck::*;
`include "uvm_macros.svh"

class /*design name*/_env extends uvm_env;
    `uvm_component_utils(/*design name*/_env)
    /*design name*/_agt agt;
    /*design name*/_scoreborad sb;
    /*design name*/_cover cov;
    function new(string name = "/*design name*/_env" , uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        agt = /*design name*/_agt::type_id::create("agt",this);
        sb = /*design name*/_scoreborad::type_id::create("sb",this);
        cov = /*design name*/_cover::type_id::create("cov",this);
    endfunction 
    function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        agt.agt_ap.connect(sb.sb_export);
        agt.agt_ap.connect(cov.cov_export);
    endfunction 
endclass 
    
endpackage