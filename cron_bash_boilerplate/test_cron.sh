#!/usr/bin/with-contenv bashio
set -e

IS_LEAP=$(bashio::config 'isLeap');
NAME=$(bashio::config 'name' 'default_name');
YEAR=$(bashio::config 'year');

echo "$NAME" >> /config/www/test.txt;

bashio::log.info "Starting $IS_LEAP $NAME $YEAR"

current_date_time=$(date)
echo "From test_cron $IS_LEAP $NAME $YEAR $current_date_time" >> /share/test.txt;
echo "From test_cront, and here: $IS_LEAP $NAME $YEAR $current_date_time" >> /config/www/test.txt;