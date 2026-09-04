# Networking

## Overview

This directory documents the networking architecture, configuration, and future development of my homelab.

The current environment uses an Xfinity modem/router as the network gateway and provides connectivity to the Proxmox virtualization host.

Remote administration of the lab is currently provided through Tailscale.

## Current Network

The current network consists of:

* Xfinity 1 Gbps Internet connection
* Xfinity modem/router
* Lenovo ThinkCentre M720q Proxmox host
* Proxmox virtual networking
* Debian Server VM
* Ubuntu Desktop VM
* Tailscale for remote access

## Current Topology

See [`../architecture/network-diagram.png`](../architecture/network-diagram.png) for the current network architecture.

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
