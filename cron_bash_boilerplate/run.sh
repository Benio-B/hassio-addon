#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting first"

IS_LEAP=$(bashio::config 'isLeap');
NAME=$(bashio::config 'name');
YEAR=$(bashio::config 'year');

mkdir -p /data/config
ln -s /data/config /app/config

/test_cron.sh;

crontab -l | { cat; echo "*/1 * * * * /test_cron.sh"; } | crontab -;

crond -f;
