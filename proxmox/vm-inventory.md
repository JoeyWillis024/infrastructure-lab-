# Virtual Machine Inventory

This document tracks virtual machines and containers deployed within the Proxmox environment.

## Current Virtual Machines

| VM ID | Name | Operating System | CPU | RAM | Disk | Network | Purpose | Status |
|---|---|---|---:|---:|---:|---|---|---|
| 100 | `willy` | Ubuntu Desktop | 4 cores | 7.47 GiB | 32 GB | VirtIO / vmbr0 | Sandbox / Testing | Active |
| 101 | `tailscale` | Debian | 1 core | 2 GiB | 8 GB | VirtIO / vmbr0 | Tailscale / Remote Access | Active |
| Not recorded | `debdock` | Debian | 2 cores | 12 GB | Not recorded | VirtIO / vmbr0 · `10.0.0.107` | Docker host for Uptime Kuma, Pi-hole, Navidrome, and Nextcloud | Active |

Uptime Kuma, Pi-hole, Navidrome, and Nextcloud run in Docker on the Debian VM `debdock`, separate from the dedicated Tailscale VM. Its LAN address is `10.0.0.107`, with 2 CPU cores and 12 GB of memory. Its VM ID and disk allocation have not yet been recorded.

## Current LXC Containers

| CT ID | Name | Operating System | CPU | RAM | Root disk | Network | Purpose | Status |
|---|---|---|---:|---:|---:|---|---|---|
| 110 | `jellyfin` | Debian | 4 cores | 2048 MiB | 16 GB | `vmbr0` / DHCP | Jellyfin media server | Configured |

### LXC 110 — jellyfin

Jellyfin runs directly in an unprivileged Debian LXC container, not in a VM. The container starts automatically with the Proxmox host and has nesting enabled.

- **CPU:** 4 cores
- **Memory:** 2048 MiB
- **Swap:** 512 MiB
- **Root disk:** `local-lvm`, 16 GB
- **Network:** `vmbr0`, DHCP
- **Hardware acceleration device:** `/dev/dri/renderD128` (GID 992)
- **Media bind mount:** Proxmox host path `/mnt/backup/media` is mounted at `/media` inside the container, read-only

The Proxmox host currently mounts a 476.9 GB disk partition (`/dev/sda1`) at `/mnt/backup`. See [storage inventory](./storage.md) for the recorded disk and the remaining identification details. Jellyfin library subdirectories and its network address have not been recorded.

## VM 100 — willy

### Purpose

Ubuntu Desktop virtual machine used as a general-purpose sandbox and testing environment.

### Configuration

- **Operating System:** Ubuntu Desktop
- **CPU:** 4 cores
- **Memory:** 7.47 GiB
- **Storage:** 32 GB
- **BIOS:** SeaBIOS
- **Network Model:** VirtIO
- **Network Bridge:** `vmbr0`
- **VLAN:** None
- **Proxmox Firewall:** Enabled

### Intended Use

This VM is used for:

- Testing software
- Experimenting with Linux
- Testing network configurations
- Learning new technologies
- General-purpose sandboxing

The VM provides an isolated environment where configurations and software can be tested without affecting the Proxmox host.

## VM 101 — tailscale

### Purpose

Dedicated Debian server used to provide Tailscale-based remote access to the homelab.

### Configuration

- **Operating System:** Debian
- **Environment:** Headless server
- **CPU:** 1 core
- **Memory:** 2 GiB
- **Storage:** 8 GB
- **BIOS:** SeaBIOS
- **Network Model:** VirtIO
- **Network Bridge:** `vmbr0`
- **VLAN:** None
- **Proxmox Firewall:** Enabled

### Intended Use

The VM is dedicated to Tailscale and provides remote access capabilities for administering the homelab.

## Network Configuration

VMs 100 and 101 and `debdock` connect to the Proxmox Linux bridge `vmbr0`. `debdock` is on the `10.0.0.0/24` LAN at `10.0.0.107`.
