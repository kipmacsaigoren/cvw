#!/bin/bash

#clear file
>regression_opt3.log

for i in {1..20}
do
    { time ./regression-wallyoptfull; } 2>> regression_opt3.log
    sleep 2
    killall vsimk
    sleep 2
done

killall vsimk
<<comment
>regression_std1.log
for i in {1..20}
do
    { time ./regression-wally; } 2>> regression_std1.log
    sleep 2 
    killall vsimk
    sleep 2
done

killall vsimk
comment