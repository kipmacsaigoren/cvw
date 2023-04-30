#make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn FREQ=10000 CONFIG=rv32i
#make synth DESIGN=wallypipelinedcore TECH=tsmc28psyn FREQ=10000 CONFIG=rv64i
#make synth DESIGN=alu TECH=tsmc28psyn FREQ=10000 CONFIG=rv32i MAXOPT=1
#make synth DESIGN=alu TECH=tsmc28psyn FREQ=10000 CONFIG=rv64i MAXOPT=1
#make synth DESIGN=alu TECH=tsmc28psyn FREQ=100 CONFIG=rv32i MAXOPT=1
#make synth DESIGN=alu TECH=tsmc28psyn FREQ=100 CONFIG=rv64i MAXOPT=1
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

######
FREQ=10001

#alu32 none
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m

#alu32 zba
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#alu32 zbb
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#alu32 zbc
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 0/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#alu32 zbs
sed -i '149s/.*/`define ZBA_SUPPORTED 0/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 0/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 0/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#alu32 zb*
sed -i '149s/.*/`define ZBA_SUPPORTED 1/' $rv32i
sed -i '150s/.*/`define ZBB_SUPPORTED 1/' $rv32i
sed -i '151s/.*/`define ZBC_SUPPORTED 1/' $rv32i
sed -i '152s/.*/`define ZBS_SUPPORTED 1/' $rv32i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv32i FREQ=$FREQ 

sleep 1m
#alu64 none
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

sleep 1m
#alu64 zba
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

sleep 1m
#alu64 zbb
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

sleep 1m
#alu64 zbc
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 0/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

sleep 1m
#alu64 zbs
sed -i '151s/.*/`define ZBA_SUPPORTED 0/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 0/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 0/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 

sleep 1m
#alu64 zb*
sed -i '151s/.*/`define ZBA_SUPPORTED 1/' $rv64i
sed -i '152s/.*/`define ZBB_SUPPORTED 1/' $rv64i
sed -i '153s/.*/`define ZBC_SUPPORTED 1/' $rv64i
sed -i '154s/.*/`define ZBS_SUPPORTED 1/' $rv64i
make synth DESIGN=alu TECH=tsmc28psyn CONFIG=rv64i FREQ=$FREQ 
