# syntax=docker/dockerfile:1
FROM caddy:2.8.4-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/mholt/caddy-webdav@42168ba04c9dc2cd228ab8c453dbab27654e52e6

FROM caddy:2.8.4 AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
