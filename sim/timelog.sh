#!/bin/bash

#clear file
>timelog.txt

for i in {1..20}
do
    { time vsim > /dev/null -c -do "do wally-batch.do rv64gc arch64d"; } 2>> timelog.txt
done