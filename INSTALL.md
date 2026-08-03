# Installation

1. Copy or clone the project onto a fresh supported Linux server.
2. Run:

```bash
sudo ./laziestmatrix install
```

The installer detects the OS, installs missing packages, creates `.env`, renders all configs, builds custom images, starts PostgreSQL and Redis, initializes Synapse, starts the full stack, optionally enables HTTPS, optionally creates an administrator, and prints a summary.

## Domain/IP mode

The installer asks whether you have a DNS domain pointing to the server. Choose domain mode to enable automated Let's Encrypt HTTPS. Choose no-domain mode for IP-only HTTP deployment; SSL is skipped automatically because Let's Encrypt cannot issue certificates for bare IP addresses.

## Non-interactive defaults

The installer proposes detected defaults for domain, public IP, timezone, email, CPU threads, and RAM. Press Enter to accept a default.

## Operations

```bash
sudo ./laziestmatrix doctor
sudo ./laziestmatrix status
sudo ./laziestmatrix backup
sudo ./laziestmatrix users
sudo ./laziestmatrix rotate-passwords
sudo ./laziestmatrix update
sudo ./laziestmatrix restore backups/YYYY-MM-DD_HH-MM.tar.zst
```
