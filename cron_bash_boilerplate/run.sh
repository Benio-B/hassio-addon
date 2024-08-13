#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Add-on is starting"

IS_LEAP=$(bashio::config 'isLeap');
NAME=$(bashio::config 'name');
YEAR=$(bashio::config 'year');

CONFIG_PATH=/config #mounted point between HA and Add-on

bashio::log.info "Before creation folder "

echo "toto" >> /config/toto.txt

echo "==============ls -l $CONFIG_PATH";
ls -l $CONFIG_PATH

if [ ! -d "$CONFIG_PATH" ]; then
    mkdir -p "$CONFIG_PATH"
    bashio::log.info "Create path $CONFIG_PATH"
fi

bashio::log.info "After creation"
if [ -d "/app/config" ]; then
    rm -rf /app/config
    bashio::log.info "Delete existing /app/config"
fi

ln -s "$CONFIG_PATH" /app/config
bashio::log.info "Create link to /app/config"

if [ -d "/data/config" ]; then
    rm -rf /data/config
    bashio::log.info "Delete existing /data/config"
fi

ln -s "$CONFIG_PATH" /data/config
bashio::log.info "Create link to /data/config"

echo "==============ls -l /app/config";
ls -l /app/config

echo "==============ls -l $CONFIG_PATH";
ls -l $CONFIG_PATH

/test_cron.sh;

crontab -l | { cat; echo "*/1 * * * * /test_cron.sh"; } | crontab -;

crond -f;
