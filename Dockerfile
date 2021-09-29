FROM alpine/k8s:1.21.2

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]