import /*design name*/_test_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
module top ();
    bit clk ;
    initial begin
        forever begin
            #10;
            clk=!clk;
        end
    end
    /*design name*/_inter /*design name*/_test_vif(clk);
    /*design name*/ dut (/*put your variables*/);
    bind /*design name*/ sva sva_inst(/*put your variables*/);
    initial begin
    uvm_config_db#(virtual /*design name*/_inter)::set(null,"*","/*design name*/_test_vif",/*design name*/_test_vif);
    run_test("/*design name*/_test");
    end

endmodule