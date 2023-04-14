#!/bin/bash

# This script checks out a commit id, writes statistics to a log file, runs a specified command for a number of times,
# and writes the duration of each command run to a log file, and then checks out main
# $1: commit ID
# $2: date string
# $3: log file to write time statistics to
# $4: log file to write regression stdout to 
# $5: name of command to time
# $6: number of times to run the command
# $7: name of the top-level git branch

if [ ! $# -eq 7 ]
then
    echo Invalid number of params in $0
    exit 1
fi

commit=$1
date=$2
timelog=$3
outlog=$4
command=$5
n=$6
top_branch=$7

header="$date\ncommit id:$commit\ncommand: $command"
echo -e $header >> $timelog
echo -e $header >> $outlog
>>$timelog
>>$outlog
git checkout $commit
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