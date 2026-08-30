ARG BUILD_VERSION
FROM ghcr.io/sysadminsmedia/homebox:${BUILD_VERSION}

COPY run.sh /run.sh
RUN chmod 0755 /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["/data/config.yml"]
