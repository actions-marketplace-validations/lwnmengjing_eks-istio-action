FROM alpine/k8s:1.18.2

COPY entrypoint.sh /entrypoint.sh
RUN chomd +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]