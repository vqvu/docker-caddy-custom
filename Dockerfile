# syntax=docker/dockerfile:1
FROM caddy:2.11.1-builder AS builder
RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare@f589a18c0f5d2ce871cc907c0567b2f8ef20c4c0 \
  --with github.com/mholt/caddy-webdav@7a5c90d8bf90ca97fc5ac11ff764533de5e05bd7

FROM caddy:2.11.1 AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
