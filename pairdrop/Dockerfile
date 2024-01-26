ARG BUILD_VERSION
FROM "lscr.io/linuxserver/pairdrop:${BUILD_VERSION}"

ARG BUILD_ARCH
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REPOSITORY
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}"
