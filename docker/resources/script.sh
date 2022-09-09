#!/bin/bash
set -x

#fetch args and declare them as vars
ACTION="${1:-build}"

if [[ $ACTION == "build" ]]; then
    echo "building hsg-project"
    sudo chmod -R a+rw /home/docker/hsg-project \
    && cd /home/docker/hsg-project \
    && ant setup | tee setup.log \
    && rm repos/hsg-shell/.npmrc \
    && sed -i -e 's/\^3.3.6/3.3.6/g' repos/hsg-shell/bower.json \
    && ant | tee ant.log
elif [[ $ACTION == "build-one" ]]; then
    echo "building one-xar"
fi
