#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting first"

IS_LEAP=$(bashio::config 'isLeap');
NAME=$(bashio::config 'name');
YEAR=$(bashio::config 'year');

crontab -l | { cat; echo "*/1 * * * * /test_cron.sh"; } | crontab -;

crond -f;
