#!/bin/bash
set -x

#fetch args and declare them as vars
ACTION="${1:-build}"

if [[ $ACTION == "build" ]]; then
    echo "building hsg-project"
    sudo chmod -R a+rw /home/docker/hsg-project \
    && cd /home/docker/hsg-project \
    && ant setup 2>&1 | tee setup.log \
    && rm repos/hsg-shell/.npmrc \
    && sed -i -e 's/\^3.3.6/3.3.6/g' repos/hsg-shell/bower.json \
    && curl --output exist.tar.bz2 --location https://github.com/eXist-db/exist/releases/download/eXist-6.0.1/exist-distribution-6.0.1-unix.tar.bz2 \
    && bzip2 -d exist.tar.bz2 \
    && tar xvf exist.tar \
    ./exist-distribution-6.0.1/bin/startup.sh &
    ant 2>&1 | tee ant.log
    ./exist-distribution-6.0.1/bin/shutdown.sh

elif [[ $ACTION == "build-one" ]]; then
    echo "building one-xar"
fi
