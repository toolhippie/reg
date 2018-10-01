FROM webhippie/alpine:latest

LABEL maintainer="Thomas Boerger <thomas@webhippie.de>" \
  org.label-schema.name="Reg" \
  org.label-schema.vendor="Thomas Boerger" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/bin/reg"]

RUN apk update && \
  apk upgrade && \
  rm -rf /var/cache/apk/*

RUN wget -q -O /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v0.15.8/reg-linux-amd64 && \
  chmod +x /usr/bin/reg
