ARG BUILD_FROM

# --- Stage 1: build avec Node officiel (version garantie) ---
FROM node:22-alpine AS builder

RUN npm install -g pnpm \
    && apk add --no-cache git

WORKDIR /app

RUN git clone --depth 1 https://github.com/gethomepage/homepage.git . \
    && pnpm install --frozen-lockfile \
    && pnpm build

# --- Stage 2: image finale Home Assistant ---
FROM $BUILD_FROM

RUN apk add --no-cache nodejs npm

WORKDIR /app
COPY --from=builder /app /app

COPY rootfs/ /

RUN chmod +x /etc/services.d/homepage/run \
    && chmod +x /etc/services.d/homepage/finish

ENV LANG=C.UTF-8
ENV BUILD_STANDALONE=true

CMD []

ARG BUILD_VERSION
ARG BUILD_DESCRIPTION
LABEL \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}"