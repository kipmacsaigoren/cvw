#!/bin/bash

#clear file
>zbctimelog.txt

for i in {1..20}
do
    { time vsim -c -do "do wally-batch.do rv64gc arch64zbc"; } 2>> zbctimelog.txt
done