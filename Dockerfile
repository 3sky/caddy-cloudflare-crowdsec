ARG VERSION=2.8.4
ARG BUILD_DATE=today

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
	--with github.com/caddy-crowdsec-bouncer \
	--with github.com/caddy-dns/cloudflare

FROM caddy:${VERSION}}

LABEL vendor="3sky.dev" \
	maintainer="Kuba Wolynko <kuba@3sky.dev>" \
	name="Caddy build for home with CloudFlare and CrowdSec" \
	build-date=${BUILD_DATE}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy