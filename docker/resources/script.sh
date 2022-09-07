#!/bin/bash
set -x

#fetch args and declare them as vars
ACTION="${1:-build}"
# using hsg-shell url as default repo if no fork was provided
REPO="${2:-https://github.com/HistoryAtState/hsg-project.git}"
BRANCH="${3:-master}"


if [[ $ACTION == "build" ]]; then
    echo "building hsg-project from $REPO and branch $Branch"

    git clone $REPO
    cd hsg-project
    git checkout $BRANCH

    ant setup | tee setup.log \
    && rm repos/hsg-shell/.npmrc \
    && sed -i -e 's/\^3.3.6/3.3.6/g' repos/hsg-shell/bower.json \
    && ant build 2>&1 | tee build.log \
    && cp xars/*.xar /home/docker/xars
elif [[ $ACTION == "build-one" ]]; then
    echo "building one-xar from $REPO and branch $Branch"
fi
