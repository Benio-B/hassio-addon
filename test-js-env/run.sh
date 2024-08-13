#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting first"

MY_VAR=$(bashio::config 'myVar', 'default my var');