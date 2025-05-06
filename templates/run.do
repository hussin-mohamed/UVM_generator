vlib work
vlog -f src_files.list +cover -covercells
vsim -voptargs=+acc work.top -classdebug -uvmcontrol=all -cover
add wave -position insertpoint sim:/top//*design name*/_test_vif/*
coverage save /*design name*/_tb.ucdb -onexit
run -all
#vcover report /*design name*/_tb.ucdb -details -all -output coverage_rpt_/*design name*/.txt