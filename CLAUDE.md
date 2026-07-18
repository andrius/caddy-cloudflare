# CLAUDE.md

## Overview

Own image (github.com/andrius/caddy-cloudflare): a custom Caddy build with the Cloudflare DNS and WebDAV plugins, used to run Andrius's internal services.

## Stack

Single `Dockerfile`, two-stage: `caddy:builder` + `xcaddy` add `caddy-dns/cloudflare` and `mholt/caddy-webdav`, then a `caddy:latest` runtime. GitHub Actions under `.github/` build and publish the image.

Last commit: 2023-09-11.
