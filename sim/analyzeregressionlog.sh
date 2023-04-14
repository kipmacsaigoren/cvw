#!/bin/bash

# $1: CMD: command to run and time
# $2: N: we will run this every n commits
# $3: REP: we will run the command for REP number of times

if [ ! $# -eq 3 ]
then
    echo Invalid number of params in $0
    exit 1
fi

# name function parameters
CMD=$1
N=$2
REP=$3

# if log directory doesn't exist, make the log directory
DIR="regression_time_log"
[ ! -d $DIR ] && mkdir $DIR

# checkout the commit, run thing, checkout main.
log="regression_git.log"

# holds the line number of distinct commit dates
arr=$(grep -n "Date" $log | sed "s@:.*@@")

# iterate for every N commit
index=0
for i in $arr
do
    # declare full commit date string
    commit_date=$(sed -n ${i}p $log)

    # declare output log file name
    outlog=$DIR/$(echo $commit_date | cut -d " " -f 3-6 | sed "s@\s@_@g")_TIMES.log

    # declare time log file name
    timelog=$DIR/$(echo $commit_date | cut -d " " -f 3-6 | sed "s@\s@_@g")_OUT.log
    
    # run the checkout and time code for commit
    if !((index%$N)); then
        # extract commit id
        commitid=$(sed -n $((i-2))p $log | awk '{print $2}')

        # run helper script
        ./checkout_and_time.sh "$commitid" "$commit_date" "$timelog" "$outlog" "$CMD" "$REP"
        

    fi
    ((index++))
done