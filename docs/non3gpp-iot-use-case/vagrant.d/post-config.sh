#!/usr/bin/env bash

function log {
    echo -e "[INFO] $1"
}

function logerr {
    echo -e "[ERRO] $1"
}
SYNCED_FOLDER='/vagrant'
WORKSPACE='sbrt-compose'

log "Start post-config script"

log "Install gtp5g kernel module"
cd /tmp \
    && git clone https://github.com/PrinzOwO/gtp5g.git \
    && cd gtp5g \
    && make clean \
    && make \
    && make install

log "gtp5g kernel module is located here:"
find /lib/modules/$(uname -r) -type f -name gtp5g*

cd $SYNCED_FOLDER/$WORKSPACE




log "End post-config script"
