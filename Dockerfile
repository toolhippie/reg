FROM ghcr.io/webhippie/alpine:3.17
ENTRYPOINT [""]

# renovate: datasource=github-releases depName=genuinetools/reg
ENV REG_VERSION=0.16.1

ARG TARGETARCH

RUN apk update && \
  apk upgrade && \
  case "${TARGETARCH}" in \
		'amd64') \
			curl -sSLo /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-amd64; \
			;; \
		'arm64') \
			curl -sSLo /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-arm64; \
			;; \
		'arm') \
			curl -sSLo /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-arm; \
			;; \
		*) echo >&2 "error: unsupported architecture '${TARGETARCH}'"; exit 1 ;; \
	esac && \
  chmod +x /usr/bin/reg && \
  rm -rf /var/cache/apk/*
