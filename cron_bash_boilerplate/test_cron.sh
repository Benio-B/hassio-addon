#!/usr/bin/with-contenv bashio
set -e

IS_LEAP=$(bashio::config 'isLeap');
NAME=$(bashio::config 'name' 'default_name');
YEAR=$(bashio::config 'year');

bashio::log.info "Increment: $PWD $IS_LEAP $NAME $YEAR"

echo "example 2" >> /app/config/example.txt;

echo "==============/data/config/example.txt";
cat /data/config/example.txt

echo "==============/app/config/example.txt";
cat /app/config/example.txt

echo "==============/config/example.txt";
cat /config/example.txt

current_date_time=$(date)
echo "From test_cron $IS_LEAP $NAME $YEAR $current_date_time" >> /share/test.txt;
