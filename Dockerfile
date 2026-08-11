FROM caddy:2.11.4-builder AS builder

RUN xcaddy build \
      --with github.com/caddy-dns/cloudflare \
      --with github.com/mholt/caddy-webdav \
      --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@naive

################################################################################

FROM caddy:2.11.4

LABEL "org.opencontainers.image.source"="https://github.com/andrius/caddy-cloudflare"
LABEL "org.opencontainers.image.description"="Caddy with cloudflare DNS, WebDAV, and forward proxy modules"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
