# Networking

## Overview

This directory documents the networking architecture, configuration, and future development of my homelab.

The current environment uses an Xfinity modem/router (`10.0.0.1`) as the gateway for the `10.0.0.0/24` home LAN. It provides connectivity to the Proxmox virtualization host and its VMs through `vmbr0`.

Remote administration of the lab is currently provided through Tailscale.

## Current Network

The current network consists of:

* Xfinity 1 Gbps Internet connection
* Xfinity modem/router
* Lenovo ThinkCentre M720q Proxmox host
* Proxmox virtual networking
* Debian `tailscale` VM (`10.0.0.13`)
* Debian Docker VM `debdock` (`10.0.0.12`)
* Ubuntu Desktop VM `willy` (`10.0.0.8`)
* Tailscale for remote access

## Current Topology

See [`../architecture/network-diagram.png`](../architecture/network-diagram.png) for the current network architecture. Remote Tailscale clients can reach the home LAN through the dedicated `tailscale` VM.

## Current Networking Technologies

* Ethernet
* TCP/IP
* Proxmox virtual networking
* Tailscale
* DNS
* DHCP

## Planned Networking Improvements

As the lab develops, I plan to implement and document:

* VLAN segmentation
* Dedicated management network
* Server network
* Guest network
* IoT network
* Firewall rules
* Network monitoring
* DNS infrastructure
* DHCP configuration
* Network troubleshooting procedures

## Documentation

Detailed networking configuration and experiments will be documented in this directory as they are implemented.
