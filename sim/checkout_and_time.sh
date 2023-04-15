#!/bin/bash

# This script checks out a commit id, writes statistics to a log file, runs a specified command for a number of times,
# and writes the duration of each command run to a log file, and then checks out main
# $1: commit ID
# $2: date string
# $3: log file to write time statistics to
# $4: log file to write regression stdout to 
# $5: number of times to run the command
# $6: name of the top-level git branch
# OPTIONAL
# $7: rv architecture (rv32i, rv64gc, etc)
# $8: name of the test to run
if [ $# -eq 6 ]
then
    # we are testing a regression
    commit=$1
    date=$2
    timelog=$3
    outlog=$4
    n=$5
    top_branch=$6
    regression=1
elif [ $# -eq 8 ]
then
    # we are testing a vsim
    commit=$1
    date=$2
    timelog=$3
    outlog=$4
    n=$5
    top_branch=$6
    arch=$7
    test=$8
    regression=0
else
    # invalid number of args
    echo Invalid number of params in $0
    exit 1

fi


git checkout $commit

# check if running regression or vsim command
if [ $regression -eq 1 ]
then
    # check if cvw/pipelined directory exists
    if [ -d $WALLY/pipelined ]
    then 
        command="./$WALLY/pipelined/regression-wally"
    elif [ -d $WALLY/regression ]
    then 
        command="./$WALLY/regression/regression-wally"
    else
        command="./regression-wally"
    # we are on most recent path

    fi
else 
    # check if do file still has pipelined in it
    if [ -d $WALLY/pipelined ]
    then 
        # old pipelined path
        command="cd $WALLY/pipelined/regression; vsim -c -do \"do wally-pipelined-batch.do $arch $test\"; cd $WALLY/sim"
    elif [ -d $WALLY/regression ]
    then
        # another old regression path
        command="cd $WALLY/regression; vsim -c -do \"do wally-pipelined-batch.do $arch $test\"; cd $WALLY/sim"
    elif [ -f $WALLY/wally-pipelined-batch.do ]
    then
        # current path but batch file is not most recent
        command="vsim -c -do \"do wally-pipelined-batch.do $arch $test\""
    else
        # current working path
        command="vsim -c -do \"do wally-batch.do $arch $test\""
    fi

fi
header="$date\ncommit id:$commit\ncommand: $command"
echo -e $header >> $timelog
echo -e $header >> $outlog
>>$timelog
>>$outlog
avg=0
for ((i=1;i<=$n;i++)) do
    echo "*****************************************************************" | tee -a $outlog $timelog
    echo "iteration $i" | tee -a $outlog $timelog
    rt=$((time (eval $command)) 2>tmp 1>>$outlog; cat tmp | grep real | sed "s@^[^0-9]*@@"; rm tmp)
    m=$(echo $rt|sed "s@m.*@@")
    s=$(echo $rt|sed "s@^[^m]*m@@" | sed "s@s@@")
    echo $rt >> $timelog
    avg=$(echo "$m*60+$s+$avg" | bc -l)
    killall vsimk
    echo "*****************************************************************" | tee -a $outlog $timelog
    echo "" | tee -a $outlog $timelog
done
avgs=$(echo "$avg/$n" | bc -l)
avgm=$(echo "$avgs/60"| bc -l)
echo "AVERAGE RUNNING TIME: $avgs seconds, or equivalently $avgm minutes" >> $timelog

git checkout $top_branch
exit