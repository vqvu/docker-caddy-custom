# syntax=docker/dockerfile:1
FROM caddy:2.10.2-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare@1fb64108d4debf196b19d7398e763cb78c8a0f41 \
  --with github.com/mholt/caddy-webdav@42168ba04c9dc2cd228ab8c453dbab27654e52e6

FROM caddy:2.10.2 AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
