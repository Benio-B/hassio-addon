#!/bin/bash

if [ -d /config/pairdrop ] && [ ! -d /config/addons_config/pairdrop ]; then
    echo "Moving to new location /config/addons_config/pairdrop"
    mkdir -p /config/addons_config/pairdrop
    chown -R "$PUID:$PGID" /config/addons_config/pairdrop
    mv /config/pairdrop/* /config/addons_config/pairdrop/
    rm -r /config/pairdrop
fi

if [ ! -d /config/addons_config/pairdrop ]; then
    echo "Creating /config/addons_config/pairdrop"
    mkdir -p /config/addons_config/pairdrop
    chown -R "$PUID:$PGID" /config/addons_config/pairdrop
fi