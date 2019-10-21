#!/bin/bash
export YOCTO_PI="/data/users/cooper/pi"
# if you need proxy
# https://wiki.yoctoproject.org/wiki/Working_Behind_a_Network_Proxy
export GIT_PROXY_COMMAND="oe-git-proxy"

source layers/poky/oe-init-build-env build

cp -v ../conf/* conf/
