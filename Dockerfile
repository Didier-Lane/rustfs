# https://hub.docker.com/r/docker/dockerfile
# syntax=docker/dockerfile:1.21

# https://hub.docker.com/r/rustfs/rustfs
ARG RUSTFS_VERSION=1.0.0-alpha.90
ARG RUSTFS_DIGEST=sha256:69e544bb23ff303c499cad596cfebfc3b9325a60130296e8ce934400babe9e12

FROM rustfs/rustfs:${RUSTFS_VERSION}@${RUSTFS_DIGEST}

ARG TLS_CA

SHELL ["/bin/ash", "-Eeuo", "pipefail", "-c"]

USER root

RUN <<EOR
# trust TLS CA certificate
echo "${TLS_CA}" > /usr/local/share/ca-certificates/CA.crt
update-ca-certificates
EOR

USER rustfs

HEALTHCHECK \
    --interval=30s --timeout=5s --retries=3 \
    --start-period=10s --start-interval=10s \
    CMD /bin/sh -Eeuo pipefail -c \
        "curl -f https://127.0.0.1:9000/health \
        && curl -f https://127.0.0.1:9001/rustfs/console/health"
