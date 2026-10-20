# Virtual Machine Inventory

This document tracks the virtual machines currently deployed within the Proxmox environment.

## Current Virtual Machines

| VM ID | Name | Operating System | CPU | RAM | Disk | Network | Purpose | Status |
|---|---|---|---:|---:|---:|---|---|---|
| 100 | `willy` | Ubuntu Desktop | 4 cores | 7.47 GiB | 32 GB | VirtIO / vmbr0 | Sandbox / Testing | Active |
| 101 | `tailscale` | Debian | 1 core | 2 GiB | 8 GB | VirtIO / vmbr0 | Tailscale / Remote Access | Active |
| Not recorded | `debdock` | Debian | Not recorded | Not recorded | Not recorded | VirtIO / vmbr0 · `10.0.0.12` | Docker host for Uptime Kuma, Pi-hole, Navidrome, and Nextcloud | Active |

Uptime Kuma, Pi-hole, Navidrome, and Nextcloud run in Docker on the Debian VM `debdock`, separate from the dedicated Tailscale VM. Its LAN address is `10.0.0.12`; its VM ID and resource allocations have not yet been recorded.

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

VMs 100 and 101 and `debdock` connect to the Proxmox Linux bridge `vmbr0`. `debdock` is on the `10.0.0.0/24` LAN at `10.0.0.12`.
