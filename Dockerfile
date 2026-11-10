# docker_mpd
FROM alpine:edge
ARG PKG="transmission-daemon"
ARG VER="4.1.4-r0"
ARG USR="https://github.com/J-Siu"
LABEL version=${VER}
LABEL maintainers="[John Sing Dao Siu](${USR})"
LABEL name=${PKG}
LABEL usage="${USR}/docker_${PKG}/blob/master/README.md"
LABEL description="Docker - ${PKG} with UID/GID handling"

COPY docker-compose.yml env start.sh /
RUN apk --no-cache add \
${PKG}=${VER} \
ca-certificates \
ca-certificates-bundle \
tzdata \
&& mkdir -p /transmission \
&& chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
