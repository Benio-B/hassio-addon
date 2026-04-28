#!/usr/bin/with-contenv bashio

# Récupération des variables d’environnement
MASTER_KEY=$(bashio::config 'VITE_JSONBIN_MASTER_KEY')
ACCESS_KEY=$(bashio::config 'VITE_JSONBIN_ACCESS_KEY')
BIN_ID=$(bashio::config 'VITE_JSONBIN_ID')
USE_JSONBIN=$(bashio::config 'VITE_JSONBIN_USE')

export VITE_JSONBIN_MASTER_KEY="${MASTER_KEY}"
export VITE_JSONBIN_ACCESS_KEY="${ACCESS_KEY}"
export VITE_JSONBIN_ID="${BIN_ID}"
export VITE_JSONBIN_USE="${USE_JSONBIN}"

bashio::log.info "[INFO] Load env variables: Use JsonBin ${VITE_JSONBIN_USE} with id ${VITE_JSONBIN_ID}"

cd /app

bashio::log.info "[INFO] Clone source"
git clone https://github.com/Benio-B/toilette-royale.git

cd toilette-royale

bashio::log.info "[INFO] Install dependencies"
pnpm i

bashio::log.info "[INFO] Build source"
pnpm run build



#curl -sL $(curl -s https://api.github.com/repos/Benio-B/toilette-royale/releases/latest  |  jq -r '.assets[] | select(.name | contains ("zip")) | .browser_download_url') -o latest.zip \
#    && unzip latest.zip \
#    && rm -rf latest.zip

bashio::log.info "[INFO] Copy build to Caddy"
mkdir -p /usr/share/caddy
cp -r dist/* /usr/share/caddy/
cd /app && rm -rf /app/toilette-royale/dist


bashio::log.info "[INFO] Run Caddy on port 2332"
exec caddy run --config /Caddyfile --adapter caddyfile
