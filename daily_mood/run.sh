#!/usr/bin/with-contenv bashio

# Récupération des variables d’environnement
SUPABASE_URL=$(bashio::config 'VITE_SUPABASE_URL')
SUPABASE_ANON_KEY=$(bashio::config 'VITE_SUPABASE_ANON_KEY')

export VITE_SUPABASE_URL="${SUPABASE_URL}"
export VITE_SUPABASE_ANON_KEY="${SUPABASE_ANON_KEY}"

bashio::log.info "[INFO] Load env variables"

cd /app

bashio::log.info "[INFO] Clone source"
git clone https://github.com/Benio-B/daily-mood.git

cd daily-mood

bashio::log.info "[INFO] Install dependencies"
npm i

bashio::log.info "[INFO] Build source"
npm run build

bashio::log.info "[INFO] Copy build to Caddy"
mkdir -p /usr/share/caddy
cp -r dist/* /usr/share/caddy/
cd /app && rm -rf /app/daily-mood/dist


bashio::log.info "[INFO] Run Caddy on port 5173"
exec caddy run --config /Caddyfile --adapter caddyfile
