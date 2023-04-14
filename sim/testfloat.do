# testfloat.do 
#
# Modification by Oklahoma State University & Harvey Mudd College
# Use with Testbench 
# James Stine, 2008; David Harris 2021
# Go Cowboys!!!!!!
#
# Takes 1:10 to run RV64IC tests using gui

# run with vsim -do "do wally.do rv64ic riscvarchtest-64m"

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
# suppress spurious warnngs about 
# "Extra checking for conflicts with always_comb done at vopt time"
# because vsim will run vopt

# start and run simulation
# remove +acc flag for faster sim during regressions if there is no need to access internal signals
# $num = the added words after the call
vlog +incdir+../config/$1 +incdir+../config/shared ../testbench/testbench-fp.sv ../src/fpu/*.sv ../src/fpu/*/*.sv ../src/generic/*.sv  ../src/generic/flop/*.sv -suppress 2583,7063,8607,2697 

vsim -voptargs=+acc work.testbenchfp -G TEST=$2

# Determine if nowave argument is provided
#   this removes any output to a wlf or wave window to reduce
#   disk space.
if {($argc > 2) && ($3 eq "nowave")} {
    puts "No wave output is selected"
} else {
    puts "wave output is selected"
    view wave
    add log -recursive /*
    do wave-fpu.do    
}  

#-- Run the Simulation 
run -all
noview testbench-fp.sv
view wave

