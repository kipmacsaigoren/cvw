#!/bin/bash

rv64gc=$WALLY/config/rv64gc/wally-config.vh
rv64i=$WALLY/config/rv64i/wally-config.vh
rv32gc=$WALLY/config/rv32gc/wally-config.vh
rv32i=$WALLY/config/rv32i/wally-config.vh
FREQ=10000

#alu32 none
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 


((FREQ++))
#alu32 zba
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbs,zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbs,zba
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbs,zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zba,zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zba,zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbb,zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbb,zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbc,zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zba,zbb,zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zba,zbb,zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zbc,zbs,zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zba,zbc,zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu32 zb*
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

((FREQ++))
#alu64 none
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zbb
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba,zbb
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba,zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba,zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zbb,zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zbb,zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zbc,zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba,zbb,zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba,zbb,zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

((FREQ++))
#alu64 zba,zbc,zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

