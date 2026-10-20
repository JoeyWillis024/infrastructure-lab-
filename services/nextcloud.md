# Nextcloud

## Purpose

Nextcloud provides self-hosted file storage and collaboration services. It runs in Docker on the Debian Docker VM, `debdock` (`10.0.0.12`).

## Deployment

Nextcloud has been added to `debdock`. The Compose directory, web interface address and port, image, database, and persistent storage details have not yet been recorded here. Add those details from the running deployment so this page can serve as a recovery reference.

## Operations

Once the Compose directory is recorded, manage the stack from that directory with:

```bash
sudo docker compose ps
sudo docker compose logs --tail=50
sudo docker compose up -d
```

Keep the web interface accessible only through trusted network paths or an explicitly configured secure remote-access solution. Back up both the Compose configuration and all persistent Nextcloud data, including its database, before relying on the service for important files.
