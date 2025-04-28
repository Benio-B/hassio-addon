# Build from Home Assistant base
ARG BUILD_FROM
FROM $BUILD_FROM

# Install needed tools
RUN apk add --no-cache nodejs npm pnpm git

# Set working directory
WORKDIR /app

# Clone Homepage source
RUN git clone --depth 1 https://github.com/gethomepage/homepage.git . \
    && pnpm install --frozen-lockfile \
    && pnpm build

# Copy our S6 services and startup scripts
COPY rootfs/ /

# Make sure the S6 service files are executable
RUN chmod +x /etc/services.d/homepage/run

RUN chmod +x /etc/services.d/homepage/finish

# Set environment variables
ENV LANG C.UTF-8
ENV BUILD_STANDALONE true

# Empty CMD because S6 overlay will start services
CMD []


ARG BUILD_DESCRIPTION
LABEL \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}"
