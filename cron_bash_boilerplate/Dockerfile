ARG BUILD_FROM
FROM $BUILD_FROM

WORKDIR /data

# Copy data for add-on
COPY run.sh /
COPY test_cron.sh /

RUN chmod a+x /run.sh
RUN chmod 755 /test_cron.sh

CMD [ "/run.sh" ];
