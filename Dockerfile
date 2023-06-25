# 20230625102100

FROM --platform=$TARGETPLATFORM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/caddyserver/transform-encoder

FROM --platform=$TARGETPLATFORM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy