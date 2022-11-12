FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/ueffel/caddy-brotli

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy