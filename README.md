
# LinuxOps: Linux Server Deployment, Networking & Monitoring

An individual engineering project that simulates the day-to-day responsibilities of a Junior Cloud Engineer: building, securing, deploying, monitoring, and troubleshooting a Linux server from scratch.

> **Project status:** Sprint 1 hands-on work and documentation have been completed. The system information script has been tested successfully in Ubuntu, and six evidence screenshots have been collected. Final repository review and publication are pending. Sprints 2 to 4 have not started. Sections marked `TODO` will be completed as each sprint is carried out. No unverified work is presented as completed.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Project Objectives](#project-objectives)
3. [Architecture](#architecture)
4. [Tech Stack](#tech-stack)
5. [Project Structure](#project-structure)
6. [Sprint Roadmap](#sprint-roadmap)
7. [Prerequisites](#prerequisites)
8. [Installation](#installation)
9. [Configuration](#configuration)
10. [Deployment](#deployment)
11. [Verification and Testing](#verification-and-testing)
12. [Monitoring](#monitoring)
13. [Troubleshooting](#troubleshooting)
14. [Security Considerations](#security-considerations)
15. [Known Limitations](#known-limitations)
16. [Future Improvements](#future-improvements)

---

## Project Overview

| Item | Detail |
|---|---|
| Project name | LinuxOps |
| Track | Cloud Engineering |
| Duration | 4 weeks (4 sprints) |
| Operating system | Ubuntu Server 24.04.5 LTS |
| Virtualization | Oracle VirtualBox |
| Application | Python + FastAPI (planned) |
| Automation | Bash |
| Version control | Git and GitHub |

LinuxOps covers the lifecycle of a small Linux-hosted service. The project begins with Linux server installation, user and permission management, networking fundamentals, SSH access, Bash scripting, and system monitoring.

Later sprints will extend the environment with firewall configuration, an Nginx reverse proxy, a FastAPI application, systemd service management, and incident response exercises.

The project is developed and documented incrementally. Each sprint includes practical work, verification, evidence, and technical documentation.

## Project Objectives

- Understand Linux fundamentals and filesystem management.
- Manage users, groups, and file permissions.
- Understand process and service management.
- Develop Bash scripts for system information and automation.
- Learn IP addressing, DNS, TCP/UDP, and port management.
- Configure SSH remote access and key-based authentication.
- Understand NAT and Bridged networking in VirtualBox.
- Configure the UFW firewall.
- Install and configure Nginx as a reverse proxy.
- Deploy a FastAPI application using a Python virtual environment.
- Manage application services using systemd.
- Monitor server resources and analyze logs.
- Practice incident response and troubleshooting.
- Produce professional technical documentation.

## Architecture

> **TODO (Sprint 2 and Sprint 4):** Add the network architecture diagram and final system architecture diagram under `docs/architecture/`.

The current environment consists of a host computer running an Ubuntu Server virtual machine through VirtualBox.

Current environment:

```text
Host Computer (Windows 11)
     |
     | VirtualBox NAT
     |
     v
Ubuntu Server 24.04.5 LTS
     |
     |-- SSH Server (OpenSSH)
     |
     |-- deploy user
     |
     |-- Linux administration tools
     |
     |-- Bash system information script
```

Planned application architecture:

```text
Client
  |
  | HTTP
  v
Nginx (Reverse Proxy)
  |
  | Proxy to 127.0.0.1:8000
  v
FastAPI Application
  |
  | Managed by systemd
  v
Ubuntu Server
```

The application architecture above represents the planned design and has not yet been implemented.

## Tech Stack

| Layer | Technology |
|---|---|
| Operating system | Ubuntu Server 24.04.5 LTS |
| Virtualization | Oracle VirtualBox |
| Remote access | OpenSSH |
| Shell | Bash |
| Automation | Bash scripting |
| System monitoring | top, ps, df, free |
| Networking | ip, ss |
| Application | Python, FastAPI (planned) |
| Web server / reverse proxy | Nginx (planned) |
| Service management | systemd |
| Firewall | UFW (planned) |
| Version control | Git, GitHub |
| Documentation | Markdown |

## Project Structure

The repository is organized to separate scripts, documentation, templates, and evidence.

```text
LinuxOps/
├── README.md
├── .gitignore
├── scripts/
│   └── sysinfo.sh
├── docs/
│   ├── guides/
│   │   └── installation-guide.md
│   ├── reference/
│   │   └── command-reference.md
│   ├── sprints/
│   │   ├── sprint-01-linux-fundamentals.md
│   │   └── sprint-01-troubleshooting-log.md
│   └── templates/
│       ├── command-reference.md
│       ├── incident-report.md
│       ├── installation-guide.md
│       ├── sprint-report.md
│       ├── test-report.md
│       └── troubleshooting-log.md
└── evidence/
    └── sprint-01/
        ├── 02-network.png
        ├── 03-network-routing.png
        ├── 04-system-information-script.png
        ├── 05-ssh-connection.png
        ├── 06-user-permissions.png
        └── 07-linux-commands.png
```

Additional directories such as `app/`, `config/`, `tests/`, and `docs/architecture/` will be added when the corresponding sprint work begins.

## Sprint Roadmap

| Sprint | Focus | Key Deliverables | Status |
|---|---|---|---|
| 1 | Linux Fundamentals | Installation guide, command reference, system information script, screenshots, reflection | Hands-on work and documentation completed |
| 2 | Networking and Security | Network architecture diagram, SSH key authentication, firewall configuration, port tests, security checklist | Not started |
| 3 | Deployment and Service Management | FastAPI application, systemd service, Nginx reverse proxy, deployment guide, endpoint tests | Not started |
| 4 | Monitoring and Incident Response | Monitoring script, three incident reports, final architecture, demonstration evidence, lessons learned | Not started |

Each sprint builds on the previous one.

Sprint 1 establishes the Linux environment and administration fundamentals. Sprint 2 focuses on networking and security. Sprint 3 introduces application deployment and service management. Sprint 4 focuses on monitoring and controlled incident scenarios.

Required Sprint 4 incidents:

- A stopped service.
- A port conflict.
- A misconfigured reverse proxy or firewall.

## Prerequisites

Expected requirements:

- A host computer capable of running VirtualBox.
- Oracle VirtualBox.
- Ubuntu Server 24.04.5 LTS installation ISO.
- A GitHub account.
- Git installed on the host computer.
- Basic terminal access.

The current virtual machine configuration:

| Resource | Configuration |
|---|---|
| Operating system | Ubuntu Server 24.04.5 LTS |
| RAM | 2048 MB |
| CPUs | 2 |
| Virtual disk | 25 GB |
| Network | NAT |

## Installation

The Ubuntu Server installation process is documented in:

- [Installation Guide](docs/guides/installation-guide.md)
- [Sprint 1 Report](docs/sprints/sprint-01-linux-fundamentals.md)

The installation guide covers the creation of the virtual machine, Ubuntu Server installation, initial configuration, and SSH setup.

## Configuration

Current configuration and administration activities include:

- Ubuntu Server initial setup.
- Dedicated `deploy` user creation.
- User and group verification.
- Directory ownership and permission management.
- OpenSSH service activation.
- VirtualBox NAT networking.
- SSH access through port forwarding.

> **TODO (Sprint 2 and Sprint 3):** Document SSH key-based authentication, UFW, Nginx, and systemd configuration.

Security rules for this repository:

- Only example configuration files should be committed.
- Real credentials, passwords, private keys, and tokens must never be stored in Git.
- Machine-specific configuration should remain separate from public documentation.

## Deployment

> **TODO (Sprint 3):** Document the complete application deployment procedure.

Planned scope:

- Python virtual environment.
- Dedicated non-root application user.
- FastAPI application.
- systemd service configuration.
- Nginx reverse proxy.
- `GET /health` and `GET /info` endpoints.
- Automatic service startup after reboot.

## Verification and Testing

Sprint 1 verification includes:

- Ubuntu Server environment inspection.
- Hostname and operating system verification.
- User and group verification.
- File permission and ownership checks.
- Process and resource inspection.
- Network interface and routing inspection.
- SSH remote connection verification.
- Bash system information script execution.

Useful commands include:

```bash
hostnamectl
whoami
id
groups
pwd
ls -la
ps aux
top
df -h
free -h
ip a
ip route
ss -tln
systemctl status ssh
```

> **TODO (Sprint 3):** Add FastAPI endpoint tests, Nginx proxy verification, and reboot persistence tests.

## Monitoring

Sprint 1 introduces basic Linux system monitoring through standard command-line tools and a Bash script.

The `scripts/sysinfo.sh` script displays:

- Hostname.
- Operating system information.
- System uptime.
- Disk usage.
- Memory usage.
- Logged-in users.
- Top CPU-consuming processes.

The script was executed successfully in the Ubuntu Server environment.

To run it from the repository root:

```bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

> **TODO (Sprint 4):** Extend monitoring with service health checks, resource thresholds, log inspection, and incident monitoring.

Planned tools:

- `journalctl`
- `systemctl`
- `ss`
- `curl`
- Bash automation

## Troubleshooting

Troubleshooting activities are documented throughout the project.

Sprint 1 troubleshooting notes are stored in:

- [Sprint 1 Troubleshooting Log](docs/sprints/sprint-01-troubleshooting-log.md)

> **TODO (Sprint 4):** Add detailed incident reports covering service failures, port conflicts, and reverse proxy or firewall configuration problems.

## Security Considerations

The project follows these security principles:

- Least privilege for users and services.
- Dedicated non-root users for application execution.
- Appropriate file and directory permissions.
- Avoiding unnecessary exposed ports.
- SSH key-based authentication.
- No passwords, private keys, tokens, or secrets in the repository.
- Separation of example configuration and sensitive local configuration.

The implementation status of each security measure will be documented in the relevant sprint.

> **TODO (Sprint 2):** Complete and link the security checklist.

## Known Limitations

- The environment is based on a local VirtualBox virtual machine.
- The project does not demonstrate production readiness.
- No external load or performance testing has been conducted.
- Public cloud deployment is outside the current required scope.
- Features planned for future sprints have not yet been implemented.

Additional limitations discovered during the project will be documented here.

## Future Improvements

Possible extensions beyond the required project scope:

- Containerization with Docker.
- Orchestration with Kubernetes.
- Infrastructure as Code with Terraform.
- Deployment to AWS or Azure.
- Centralized metrics and dashboards.
- TLS certificates for the reverse proxy.
- Automated configuration management.

## Documentation and Contribution Conventions

Repository documentation is written in English. Personal learning notes may be written in Turkish.

Commit messages follow the Conventional Commits style.

Examples:

```text
docs(sprint-1): add installation guide
docs(sprint-1): update command reference
feat(scripts): add system information script
feat(app): add health endpoint
```

All project changes should reflect work that has actually been implemented and verified. Screenshots, command outputs, and test results should be linked to the relevant sprint documentation.
