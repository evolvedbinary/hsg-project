#!/bin/bash
set -x

#fetch args and declare them as vars
ACTION=$1
# using hsg-shell url as default repo if no fork was provided
REPO="${2:-https://github.com/HistoryAtState/hsg-project.git}"
BRANCH="${3:-master}"


git clone $REPO
cd hsg-project
git checkout $BRANCH

if [ $ACTION -eq "build"] then
    echo "building hsg-project from $REPO and branch $Branch"
elif [ $ACTION -eq "build-one"] then
    XAR=$4
    echo "building one-xar $XAR from $REPO and branch $Branch"
fi