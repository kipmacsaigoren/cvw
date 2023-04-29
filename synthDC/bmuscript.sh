#!/bin/bash

rv64gc=$WALLY/config/rv64gc/wally-config.vh
rv64i=$WALLY/config/rv64i/wally-config.vh
rv32gc=$WALLY/config/rv32gc/wally-config.vh
rv32i=$WALLY/config/rv32i/wally-config.vh
FREQ=10000

#rv64i none
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ

#rv64i zb(a,b,s)
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ

#rv64gc none
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64gc
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64gc
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64gc
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64gc FREQ=$FREQ

#rv64gc zb*
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64gc
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64gc
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64gc
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64gc FREQ=$FREQ

#rv32gc zb*
sed -i '148s/.*/`define ZBA_SUPPORTED 1/' $rv32gc
sed -i '149s/.*/`define ZBB_SUPPORTED 1/' $rv32gc
sed -i '150s/.*/`define ZBC_SUPPORTED 1/' $rv32gc
sed -i '151s/.*/`define ZBS_SUPPORTED 1/' $rv32gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32gc FREQ=$FREQ

#rv32gc none
sed -i '148s/.*/`define ZBA_SUPPORTED 0/' $rv32gc
sed -i '149s/.*/`define ZBB_SUPPORTED 0/' $rv32gc
sed -i '150s/.*/`define ZBC_SUPPORTED 0/' $rv32gc
sed -i '151s/.*/`define ZBS_SUPPORTED 0/' $rv32gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32gc FREQ=$FREQ

sleep 1m

#rv32i none
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m

#rv32i zb(a,b,s)
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m

#alu32 none
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m

#alu32 zba
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zb*
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 none
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zba
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zbb
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zb*
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
FREQ=100

#rv64i none
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ

sleep 1m
#rv64i zb(a,b,s)
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ

sleep 1m
#rv64gc none
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64gc
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64gc
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64gc
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64gc FREQ=$FREQ

sleep 1m
#rv64gc zb*
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64gc
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64gc
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64gc
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv64gc FREQ=$FREQ

sleep 1m
#rv32gc zb*
sed -i '148s/.*/`define ZBA_SUPPORTED 1/' $rv32gc
sed -i '149s/.*/`define ZBB_SUPPORTED 1/' $rv32gc
sed -i '150s/.*/`define ZBC_SUPPORTED 1/' $rv32gc
sed -i '151s/.*/`define ZBS_SUPPORTED 1/' $rv32gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32gc FREQ=$FREQ

sleep 1m
#rv32gc none
sed -i '148s/.*/`define ZBA_SUPPORTED 0/' $rv32gc
sed -i '149s/.*/`define ZBB_SUPPORTED 0/' $rv32gc
sed -i '150s/.*/`define ZBC_SUPPORTED 0/' $rv32gc
sed -i '151s/.*/`define ZBS_SUPPORTED 0/' $rv32gc
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32gc FREQ=$FREQ

sleep 1m
#rv32i none
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#rv32i zb(a,b,s)
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#alu32 none
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zba
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu32 zb*
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 none
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zba
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zbb
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

sleep 1m
#alu64 zb*
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ MAXOPT=1

