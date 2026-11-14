# Jellyfin

## Deployment

Jellyfin runs in Proxmox LXC 110, named `jellyfin`. It is an unprivileged Debian container with 4 CPU cores, 2048 MiB RAM, a 16 GB `local-lvm` root disk, and a `vmbr0` DHCP network interface. The container is configured to start on boot and has nesting enabled.

The container receives `/dev/dri/renderD128` (GID 992) for hardware video acceleration. Its media mount is read-only:

| Proxmox host path | Container path | Access |
|---|---|---|
| `/mnt/backup/media` | `/media` | Read-only |

The host reports `/dev/sda1` (476.9 GB disk) mounted at `/mnt/backup`. The filesystem UUID, filesystem type, Jellyfin address/port, application configuration path, and library subdirectories have not been recorded.

See the [Proxmox guest inventory](../proxmox/vm-inventory.md) and [storage inventory](../proxmox/storage.md) for host and disk details. The supplied configuration describes the LXC, but does not include Jellyfin's application settings or library definitions.

## Jellyfin on the go

When travelling to a network where the home server is unreachable, copy the media you need to a trusted laptop or other computer while it is connected to the Tailscale tailnet. Run a local Jellyfin container on that computer and let devices on the remote local network stream from it. This keeps the transfer on the authenticated, encrypted tailnet and avoids exposing the home Jellyfin server or opening router ports.

### Workflow

1. Install and sign in to Tailscale on the travel computer. Confirm it can reach the home LAN through the documented Tailscale subnet route. The home Jellyfin LXC's DHCP address is not recorded in this repo; find it in Proxmox or the router's DHCP leases.
2. Copy only the media needed for the trip over the tailnet using an authenticated file-transfer method such as `scp`/SFTP (SSH must be enabled on the source), or a file share already restricted to the tailnet. For example, from Linux/macOS, `scp -r user@<jellyfin-lxc-lan-ip>:/media/Movies ./media/Movies`. Use the actual address, path, and account available on the source. `/media` is the read-only media path inside the Jellyfin LXC; `/mnt/backup/media` is the path on the Proxmox host and is not necessarily reachable from the LXC.
3. Keep the downloaded files under `./media` beside the selected Compose file on Linux, or set `JELLYFIN_MEDIA_PATH` in a `.env` file on Windows to the downloaded media directory.
4. Start the matching stack below. On Linux use Podman Compose; on Windows use Docker Desktop with Compose. Open `http://<travel-computer-lan-ip>:8096` on devices connected to the same remote LAN and complete Jellyfin's first-run setup. Add the container's `/media` path as a library.
5. Create a dedicated Jellyfin account for this local server, use a strong password, and stop the stack when it is no longer needed. On an untrusted network, restrict access with the host firewall to the devices/subnet that should stream. The example publishes HTTP on the local LAN; it is not intended for public internet exposure.

The containers bind media read-only so Jellyfin cannot change the downloaded originals. Jellyfin's config and cache persist in local folders. These are independent local Jellyfin instances; users, libraries, watch state, and settings do not sync automatically with the home server.

### Linux with Podman Compose

Files: [`compose-podman.yaml`](./jellyfin-on-the-go/compose-podman.yaml). From that directory, place media in `media/`, then run:

```sh
podman compose -f compose-podman.yaml up -d
podman compose -f compose-podman.yaml logs -f
podman compose -f compose-podman.yaml down
```

On Fedora/SELinux, the `:Z` volume labels in the file let the container access its private config/cache and read-only media mounts. On other Linux distributions they are generally ignored by Podman-compatible engines.

### Windows with Docker Compose

Files: [`compose-docker.yaml`](./jellyfin-on-the-go/compose-docker.yaml) and [`.env.example`](./jellyfin-on-the-go/.env.example). Copy `.env.example` to `.env`, set `JELLYFIN_MEDIA_PATH` to the absolute path containing the downloaded media (for example `D:/Jellyfin/media`), and run in PowerShell from the directory containing the Compose file:

```powershell
docker compose -f compose-docker.yaml up -d
docker compose -f compose-docker.yaml logs -f
docker compose -f compose-docker.yaml down
```

Docker Desktop must be allowed to access the chosen media folder. Keep the `.env` file local; it is not needed for secrets, but its machine-specific path should not be committed.
