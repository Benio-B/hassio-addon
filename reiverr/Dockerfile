ARG BUILD_FROM
ARG BUILD_VERSION
FROM ${BUILD_FROM} as pre-production

ENV S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

#RUN mkdir -p /data
WORKDIR /app

COPY . .

COPY package.json .
COPY package-lock.json .

RUN npm i

RUN npm run build

ARG BUILD_FROM
ARG BUILD_VERSION
FROM ${BUILD_FROM} as production

ENV S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

#RUN mkdir -p /data
WORKDIR /app

ENV NODE_ENV=production

COPY --from=pre-production /app/build /app/build

COPY package.json .
COPY package-lock.json .

RUN npm ci --omit dev

# Pour le moment ça ça ne sert à rien, le db.ts est directement modifié.
# Il faudrait creuser pour comprendre pourquoi un ln ne fonctionne pas
RUN mkdir -p /data/config
RUN rm -rf /app/config
RUN ln -s /data/config /app/config

CMD [ "npm", "run", "deploy" ]

### LABELS
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Benio-B (https://github.com/Benio-B)" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Add-ons" \
    org.opencontainers.image.authors="Benio-B (https://github.com/Benio-B)" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/Benio-B" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}