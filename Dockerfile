FROM caddy:builder AS builder

RUN xcaddy build \
      --with github.com/caddy-dns/cloudflare \
      --with github.com/mholt/caddy-webdav

################################################################################

FROM caddy:2.7.5

LABEL "org.opencontainers.image.source"="https://github.com/andrius/caddy-cloudflare"
LABEL "org.opencontainers.image.description"="Caddy with cloudflare DNS module"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
