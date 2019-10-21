#!/bin/bash

BRANCH="warrior"
REPOS="\
    git://git.yoctoproject.org/poky.git \
    git://git.openembedded.org/meta-openembedded \
    git://git.yoctoproject.org/meta-raspberrypi \
    git://git.yoctoproject.org/meta-virtualization \
"

if [ ! -d "layers" ]; then
    mkdir -v layers

    cd layers
    for repo in $REPOS
    do
        echo "git clone -b $BRANCH $repo"
    done
else
    cd layers
    for repo_dir in $(ls)
    do
        echo "cd $repo_dir && git pull --rebase"
    done
fi

echo -e "
Ok. Time to build:
    - source layers/poky/oe-init-build-env build
    - bitbake core-image-base
"
