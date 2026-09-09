# IP Addressing

## Overview

...

## Proxmox Host

...

## Network Interfaces

...

## Virtual Machines

| Host | IP Address | Subnet | Subnet Mask | Default Gateway |
|---|---|---|---|---|
| Ubuntu VM | `10.0.0.8` | `10.0.0.0/24` | `255.255.255.0` | `10.0.0.1` |
| Debian VM | `10.0.0.13` | `10.0.0.0/24` | `255.255.255.0` | `10.0.0.1` |

## Network Addressing

The current network uses the private IPv4 address space:

```text
Network:       10.0.0.0/24
Subnet Mask:   255.255.255.0
Gateway:       10.0.0.1

Proxmox Host:  10.0.0.232
Ubuntu VM:     10.0.0.8
Debian VM:     10.0.0.13
