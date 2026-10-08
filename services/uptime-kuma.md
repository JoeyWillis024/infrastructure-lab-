# Uptime Kuma

## Purpose

Uptime Kuma monitors whether homelab hosts and web services respond. It runs in Docker on the Debian Docker VM, `debdock`.

## Deployment

- **Compose directory:** `/srv/stacks/uptime-kuma`
- **Compose file:** `compose.yml`
- **Web interface:** `http://<debdock-IP>:3001`
- **Image:** `louislam/uptime-kuma:2`
- **Database:** SQLite, stored in the local Docker volume `uptime-kuma-data` mounted at `/app/data`

Compose configuration:

```yaml
services:
  uptime-kuma:
    image: louislam/uptime-kuma:2
    container_name: uptime-kuma
    restart: unless-stopped
    ports:
      - "3001:3001"
    volumes:
      - uptime-kuma-data:/app/data

volumes:
  uptime-kuma-data:
```

Manage the stack from its directory:

```bash
sudo docker compose up -d
sudo docker compose ps
sudo docker compose logs --tail=50
```

Keep port 3001 accessible only on the trusted home network or tailnet. Do not forward it from the internet-facing router.

## Monitors

The following monitors were added and reported green:

| Monitor | Type | Target |
|---|---|---|
| Proxmox host | Ping | `10.0.0.232` |
| Proxmox web interface | HTTP(s) | `https://10.0.0.232:8006` |
| Pi-hole | Added in Kuma | Target address not recorded here |
| Navidrome | Added in Kuma | Target address not recorded here |

The Proxmox web interface uses HTTPS on port 8006. If Kuma reports a certificate validation error, enable **Ignore TLS/SSL error** in that monitor's advanced options; Proxmox commonly uses a locally issued certificate.

Ping checks host reachability. HTTP(s) checks whether a web endpoint responds. These checks do not report CPU, memory, storage, VM state, or detailed application health.

## Limitation

Uptime Kuma runs in a VM on the Proxmox host it monitors. If that host goes down, Kuma may go offline too and cannot send an alert during the outage. Monitoring Proxmox through a full host outage requires a monitor running outside that host.

## Data and backups

The `uptime-kuma-data` volume contains Kuma's SQLite database, monitors, and settings. Back up this volume and the Compose file so the configuration can be restored.
