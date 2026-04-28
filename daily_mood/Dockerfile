ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache curl unzip bash npm git jq \
    && npm install -g pnpm

RUN apk add --no-cache caddy

WORKDIR /app

COPY run.sh /
COPY Caddyfile /

RUN chmod a+x /run.sh
RUN chmod a+x /Caddyfile

EXPOSE 2332

CMD ["/run.sh"]

ARG BUILD_DESCRIPTION
LABEL \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}"