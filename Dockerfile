FROM webhippie/alpine:latest
ENTRYPOINT [""]

# renovate: datasource=github-releases depName=genuinetools/reg
ENV REG_VERSION=0.16.1

ARG TARGETARCH=amd64

RUN apk update && \
  apk upgrade && \
  case "${TARGETARCH}" in \
		'amd64') \
			wget -qO /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-amd64; \
			;; \
		'arm64') \
			wget -qO /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-arm64; \
			;; \
		'arm') \
			wget -qO /usr/bin/reg https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-arm; \
			;; \
		*) echo >&2 "error: unsupported architecture '${TARGETARCH}'"; exit 1 ;; \
	esac && \
  chmod +x /usr/bin/reg && \
  rm -rf /var/cache/apk/*
