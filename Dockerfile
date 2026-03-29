# syntax=docker/dockerfile:1
FROM caddy:2.11.2-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250 \
  --with github.com/mholt/caddy-webdav@fa2f366b0d75e54c2e381c0aefc3a8df8bf5794b

FROM caddy:2.11.2 AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
