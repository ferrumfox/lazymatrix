# LAZIESTMATRIX

LAZIESTMATRIX is a one-command Matrix server distribution for Linux. It installs Docker, Docker Compose, Synapse, Element Web, PostgreSQL, Redis, Coturn, Nginx, Certbot, generates every configuration file from `.env`, and manages the whole lifecycle through one executable.

```bash
sudo ./laziestmatrix install
```

## Features

- Automatic Linux/package-manager detection for `apt`, `dnf`, `yum`, `pacman`, and `zypper`.
- Automatic dependency installation.
- Generated secrets and passwords; no hardcoded credentials.
- Generated Synapse, Nginx, Coturn, and Element configuration from templates.
- Voice, video, screen sharing, STUN, and TURN via Coturn.
- Optional automated Let's Encrypt certificates.
- Admin user creation from the installer.
- Backup, restore, update, doctor, status, logs, package, and uninstall commands.

## Commands

```text
install    Full first-time installation
deploy     Render configs and start services
update     Pull, rebuild, restart, and prune images
upgrade    Alias of update
backup     Create one .tar.zst archive under backups/
restore    Restore a backup archive
doctor     Run health diagnostics
status     Show system and service status
logs       Follow Compose logs
restart    Restart services
stop       Stop services
start      Start services
users      Create a Matrix administrator
cert       Obtain/refresh Let's Encrypt certificate and re-render Nginx/Coturn
package    Create a clean source release archive
version    Print version
uninstall  Stop and remove Compose volumes
```

## Requirements

Supported target distributions include Ubuntu 22.04+, Ubuntu 24.04+, Ubuntu 26.04+, Debian 12+, and Debian 13+. The installer also contains package-manager support for DNF/YUM, Pacman, and Zypper based systems.

Open ports: `80/tcp`, `443/tcp`, `8448/tcp`, `3478/tcp`, `3478/udp`, and `5349/tcp`.

## Configuration model

Users should edit only `.env` if manual changes are ever needed. Runtime files are generated into:

- `synapse/homeserver.yaml`
- `nginx/conf.d/matrix.conf`
- `coturn/turnserver.conf`
- `element/config.json`
