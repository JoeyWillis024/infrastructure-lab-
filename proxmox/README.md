# Proxmox Virtualization Environment

## Overview

This project documents the deployment and administration of my Proxmox VE virtualization environment.

The Proxmox host is a Lenovo ThinkCentre M720q with 24 GB of RAM. It serves as the primary virtualization platform for my homelab.

The environment is used to develop practical experience with virtualization, Linux administration, networking, system administration, and infrastructure management.

## Hardware

| Component           | Specification            |
| ------------------- | ------------------------ |
| Host                | Lenovo ThinkCentre M720q |
| RAM                 | 24 GB                    |
| Hypervisor          | Proxmox VE               |
| Network             | Ethernet                 |
| Internet Connection | 1 Gbps Xfinity           |

Additional hardware specifications will be documented as the lab develops.

## Virtual Machines

The current environment contains:

### Debian Server

* **Operating System:** Debian
* **Type:** Headless server
* **Primary Purpose:** Tailscale / remote access
* **Status:** Active

### Ubuntu Desktop

* **Operating System:** Ubuntu Desktop
* **Type:** Desktop VM
* **Primary Purpose:** Sandbox and testing
* **Status:** Active

See [`vm-inventory.md`](./vm-inventory.md) for the current VM inventory.

## Virtual Networking

Proxmox provides the virtual networking layer connecting the virtual machines to the physical network.

The current environment uses the Proxmox virtual bridge `vmbr0`.

See the [`architecture`](../architecture/) directory for the current network architecture.

## Objectives

The Proxmox environment is being used to develop experience with:

* Virtual machine deployment
* Virtual networking
* Linux server administration
* Resource allocation
* System monitoring
* Backups and recovery
* Network services
* Infrastructure security
* Troubleshooting

## Future Improvements

Planned improvements include:

* Additional virtual machines
* Improved network segmentation
* VLAN implementation
* Automated VM deployment
* Infrastructure monitoring
* Centralized logging
* Backup and recovery procedures
* Infrastructure-as-Code
* Additional self-hosted services

## Lessons Learned

This section will be updated as new configurations, problems, and solutions are encountered while managing the environment.
