# IP Addressing

## Overview

This document describes the current IP addressing and network interface configuration of the Proxmox virtualization host.

The homelab currently operates on a private IPv4 network provided by the Xfinity gateway.

## Proxmox Host

| Configuration | Value |
|---|---|
| Host | Lenovo ThinkCentre M720q |
| Hypervisor | Proxmox VE |
| IP Address | `10.0.0.232` |
| Subnet | `10.0.0.0/24` |
| Subnet Mask | `255.255.255.0` |
| Default Gateway | `10.0.0.1` |
| Primary Bridge | `vmbr0` |
| Physical Interface | `nic0` |

## Network Interfaces

### `nic0`

Primary physical network interface.

- Status: Active
- Connected to: `vmbr0`
- Purpose: Physical network connectivity for the Proxmox host and virtual machines

### `vmbr0`

Primary Proxmox Linux bridge.

- Status: Active
- IP Address: `10.0.0.232/24`
- Gateway: `10.0.0.1`
- Bridge Port: `nic0`
- Purpose: Provides network connectivity between the physical network and virtual machines

### `nic1`

Secondary physical network interface.

- Status: Inactive
- Currently unused

### `wlp2s0`

Wireless network interface.

- Status: Inactive
- Currently unused

## Network Addressing

The current network uses the private IPv4 address space:

```text
Network:       10.0.0.0/24
Subnet Mask:   255.255.255.0
Gateway:       10.0.0.1
Proxmox Host:  10.0.0.232
