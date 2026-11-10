# docker_mpd
FROM alpine:edge
ARG APP="transmission-daemon"
ARG VER="4.1.4-r0"
ARG USR="https://github.com/J-Siu"
LABEL version=${VER}
LABEL maintainers="[John Sing Dao Siu](${USR})"
LABEL name=${APP}
LABEL usage="${USR}/docker_${APP}/blob/master/README.md"
LABEL description="Docker - ${APP} with UID/GID handling"

COPY docker-compose.yml env start.sh /
RUN apk --no-cache add \
${APP}=${VER} \
ca-certificates \
ca-certificates-bundle \
tzdata \
&& mkdir -p /transmission \
&& chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
