#!/bin/bash

# $1: ARCH: rv architecture to simulate
# $2: Test to run
# $3: N: we will run this every n commits
# $4: REP: we will run the command for REP number of times


# if arch and test are not specified, default to regression
if [ $# -eq 2 ]
then
    N=$1
    REP=$2
    REGRESSION=1
elif [ 4 $# -eq 4 ]
then
    ARCH=$1
    TEST=$2
    N=$3
    REP=$4
    REGRESSION=0
else 
    echo Invalid number of params in $0
    exit
fi

# generate git log file
log="regression_git.log"
git log --follow regression-wally > $log

# declare current branch
curr_branch=$(git rev-parse --abbrev-ref HEAD)

# if log directory doesn't exist, make the log directory
DIR="regression_time_log"
[ ! -d $DIR ] && mkdir $DIR

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

        if [ $REGRESSION -eq 1 ]
        then
        # we are testing regression
            ./checkout_and_time.sh "$commitid" "$commit_date" "$timelog" "$outlog" "$REP" "$curr_branch"
        else
        # we are testing a sim
            ./checkout_and_time.sh "$commitid" "$commit_date" "$timelog" "$outlog" "$REP" "$curr_branch" "$ARCH" "$TEST"

        # run helper script
        

    fi
    ((index++))
done