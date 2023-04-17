#!/bin/bash

# generate git log file
log="regression_git.log"
git log --follow regression-wally > $log
