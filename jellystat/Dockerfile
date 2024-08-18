ARG BUILD_VERSION
ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BASHIO_VERSION=0.16.2
ARG S6_OVERLAY_VERSION=3.2.0.0

ENV \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_SERVICES_GRACETIME=0

RUN apt-get update && apt-get install -y curl xz-utils jq \
    && S6_ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then S6_ARCH="x86_64"; \
    elif [ "${BUILD_ARCH}" = "armv7" ]; then S6_ARCH="arm"; \
    elif [ "${BUILD_ARCH}" = "aarch64" ]; then S6_ARCH="aarch64"; fi \
    && rm -rf /var/lib/apt/lists/* \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz" | tar xpJ -C / \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_ARCH}.tar.xz" | tar xpJ -C / \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-noarch.tar.xz" | tar Jxp -C /  \
    && curl -Ls "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-arch.tar.xz" | tar Jxp -C / \
    && mkdir -p /etc/services.d \
    && mkdir -p /tmp/bashio \
    && curl -Ls "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" | tar xz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio

COPY rootfs /
RUN chmod a+x /etc/services.d/*/run

ENTRYPOINT ["/init"]

ARG BUILD_DESCRIPTION
LABEL \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}"