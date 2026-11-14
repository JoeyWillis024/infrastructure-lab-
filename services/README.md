# Self-hosted Services

This index summarizes the services currently recorded in the homelab. Docker services run on the Debian VM `debdock` at `10.0.0.107`; Jellyfin runs separately in Proxmox LXC 110.

| Service | Runs on | LAN access / ports | Notes |
|---|---|---|---|
| [Jellyfin](./jellyfin.md) | Proxmox LXC 110 | Address and port not recorded | Read-only media at `/media`; includes an on-the-go guide with Linux Podman and Windows Docker Compose files |
| [Uptime Kuma](./uptime-kuma.md) | Docker on `debdock` | `http://10.0.0.107:3001` | Monitors Proxmox and services |
| [Pi-hole](./pihole.md) | Docker on `debdock` | DNS `:53`; web `http://10.0.0.107:8080` | DHCP role and deployment details not recorded |
| [Navidrome](./navidrome.md) | Docker on `debdock` | `http://10.0.0.107:4533` | Recovery script records the music mount and Compose path |
| [Nextcloud](./nextcloud.md) | Docker on `debdock` | `http://10.0.0.107:8082` | Apache app with MariaDB container |

The Docker host has 2 CPU cores and 12 GB RAM. Its Proxmox VM ID and disk allocation have not been recorded. Compose paths and persistent-data locations are only documented where noted on each service page.
