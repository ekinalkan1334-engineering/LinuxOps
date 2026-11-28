# LinuxOps: Linux Server Deployment, Networking & Monitoring

An individual engineering project that simulates the day-to-day responsibilities of a Junior Cloud Engineer: building, securing, deploying, monitoring, and troubleshooting a Linux server from scratch.

> **Project status:** Sprint 1 and Sprint 2 hands-on work and documentation have been completed. Sprint 1 covered Linux fundamentals, user and permission management, and system information scripting. Sprint 2 covered networking fundamentals, SSH key-based authentication, UFW firewall configuration, Nginx installation, and HTTP connectivity tests. Evidence screenshots and sprint reports are maintained in the repository. Sprint 3 and Sprint 4 are planned and have not started. No unverified work is presented as completed.

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
| Web server | Nginx |
| Firewall | UFW |
| Automation | Bash |
| Version control | Git and GitHub |

LinuxOps covers the lifecycle of a small Linux-hosted service. The project includes Linux server installation, user and permission management, networking fundamentals, SSH access, firewall configuration, web server installation, Bash scripting, and system monitoring.

The project is developed incrementally. Each sprint includes practical work, verification, evidence, and technical documentation.

Sprint 1 established the Linux environment and administration fundamentals. Sprint 2 extended the environment with network configuration, secure SSH access, firewall rules, and Nginx HTTP connectivity tests.

Future sprints will introduce a FastAPI application, systemd service management, Nginx reverse proxy configuration, monitoring, and incident response exercises.

## Project Objectives

- Understand Linux fundamentals and filesystem management.
- Manage users, groups, and file permissions.
- Understand process and service management.
- Develop Bash scripts for system information and automation.
- Learn IP addressing, DNS, TCP/UDP, and port management.
- Configure SSH remote access and key-based authentication.
- Understand NAT and Bridged networking in VirtualBox.
- Configure the UFW firewall.
- Install and test Nginx.
- Deploy a FastAPI application using a Python virtual environment.
- Manage application services using systemd.
- Configure Nginx as a reverse proxy.
- Monitor server resources and analyze logs.
- Practice incident response and troubleshooting.
- Produce professional technical documentation.

## Architecture

### Current Environment

The current environment consists of a Windows host running an Ubuntu Server virtual machine through VirtualBox using NAT networking.

```text
Windows Host
    |
    | VirtualBox NAT
    |
    |-- Host port 2222 -> Guest port 22 (SSH)
    |
    |-- Host port 8080 -> Guest port 80 (HTTP)
    |
    v
Ubuntu Server 24.04.5 LTS
    |
    |-- OpenSSH Server
    |-- SSH key-based authentication
    |-- UFW Firewall
    |-- Nginx Web Server
    |-- deploy user
    |-- Linux administration tools
    |-- Bash system information script
```

The Nginx default welcome page is accessible through the configured HTTP port forwarding. SSH access has been tested using public-key authentication.

### Planned Application Architecture

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

The application architecture above represents the planned Sprint 3 design. FastAPI deployment, systemd service configuration, and Nginx reverse proxy configuration have not yet been implemented.

## Tech Stack

| Layer | Technology | Status |
|---|---|---|
| Operating system | Ubuntu Server 24.04.5 LTS | Implemented |
| Virtualization | Oracle VirtualBox | Implemented |
| Remote access | OpenSSH | Implemented |
| SSH authentication | Ed25519 public-key authentication | Tested |
| Networking | VirtualBox NAT, IP, TCP, DNS | Practiced |
| Firewall | UFW | Configured and tested |
| Web server | Nginx | Installed and tested |
| Shell | Bash | Implemented |
| Automation | Bash scripting | Implemented |
| System monitoring | top, ps, df, free | Practiced |
| Networking tools | ip, ss, curl | Practiced |
| Application | Python, FastAPI | Planned |
| Service management | systemd | Planned for application deployment |
| Version control | Git, GitHub | Implemented |
| Documentation | Markdown | Implemented |

## Project Structure

The repository separates scripts, documentation, templates, and evidence.

```text
LinuxOps/
├── README.md
├── .gitattributes
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
│   │   ├── sprint-01-troubleshooting-log.md
│   │   └── sprint-02-networking-security.md
│   └── templates/
│       ├── command-reference.md
│       ├── incident-report.md
│       ├── installation-guide.md
│       ├── sprint-report.md
│       ├── test-report.md
│       └── troubleshooting-log.md
└── evidence/
    ├── sprint-01/
    │   ├── 02-network.png
    │   ├── 03-network-routing.png
    │   ├── 04-system-information-script.png
    │   ├── 05-ssh-connection.png
    │   ├── 06-user-permissions.png
    │   └── 07-linux-commands.png
    └── sprint-02/
        ├── 01-ssh-key-authentication.png
        ├── 02-ufw-firewall-rules.png
        ├── 03-nginx-service-status.png
        ├── 04-nginx-listening-port.png
        ├── 05-nginx-local-http-test.png
        ├── 06-windows-to-nginx-http.png
        └── 07-ufw-blocked-port-8081.png
```

Additional directories such as `app/`, `config/`, and `tests/` will be introduced when required by the corresponding sprint.

## Sprint Roadmap

| Sprint | Focus | Key Deliverables | Status |
|---|---|---|---|
| 1 | Linux Fundamentals | Ubuntu setup, installation guide, command reference, user and permission management, system information script, evidence | Completed |
| 2 | Networking and Security | Network concepts, SSH key authentication, UFW configuration, Nginx installation, HTTP and port tests, sprint report, evidence | Completed |
| 3 | Deployment and Service Management | FastAPI application, systemd service, Nginx reverse proxy, deployment guide, endpoint tests | Not started |
| 4 | Monitoring and Incident Response | Monitoring script, three incident reports, final architecture, demonstration evidence, lessons learned | Not started |

Each sprint builds on the previous one.

### Sprint 1 — Linux Fundamentals

The first sprint established the Ubuntu Server environment and covered Linux administration fundamentals, user and group management, filesystem permissions, basic networking inspection, and Bash scripting.

Documentation:
- [Sprint 1 Report](docs/sprints/sprint-01-linux-fundamentals.md)
- [Sprint 1 Troubleshooting Log](docs/sprints/sprint-01-troubleshooting-log.md)

### Sprint 2 — Networking and Security

The second sprint focused on networking and basic server security.

Completed activities:

- Studied IP addressing, DNS, TCP/UDP, localhost, NAT, and Bridged networking.
- Configured SSH public-key authentication.
- Verified SSH access without password authentication.
- Configured UFW default incoming and outgoing policies.
- Allowed SSH (22/tcp) and HTTP (80/tcp).
- Installed and enabled Nginx.
- Verified Nginx service status and listening ports.
- Tested HTTP access locally and from the Windows host.
- Performed a controlled blocked-port test on TCP port 8081.
- Verified UFW block events in kernel logs.

Documentation:
- [Sprint 2 Report](docs/sprints/sprint-02-networking-security.md)

Evidence:
- [Sprint 2 Evidence Directory](evidence/sprint-02/)

### Sprint 3 — Deployment and Service Management

Planned activities:

- Create a Python virtual environment.
- Develop a FastAPI application.
- Configure a dedicated non-root application service account.
- Create a systemd service unit.
- Configure Nginx as a reverse proxy to the locally bound FastAPI application.
- Implement `GET /health` and `GET /info` endpoints.
- Verify service startup and persistence after reboot.
- Document deployment and verification procedures.

### Sprint 4 — Monitoring and Incident Response

Planned activities:

- Extend Bash monitoring scripts.
- Monitor system resources and service health.
- Inspect system and application logs.
- Perform controlled incident scenarios.
- Document recovery procedures and lessons learned.
- Produce final architecture documentation.

Required incident scenarios:

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

### Virtual Machine Configuration

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

The installation guide covers virtual machine creation, Ubuntu Server installation, initial configuration, and SSH setup.

## Configuration

Current configuration and administration activities include:

- Ubuntu Server initial setup.
- Dedicated `deploy` user creation.
- User and group verification.
- Directory ownership and permission management.
- OpenSSH service activation.
- VirtualBox NAT networking.
- SSH access through port forwarding.
- SSH Ed25519 public-key authentication.
- UFW firewall activation and rule configuration.
- Nginx installation and service activation.

### Firewall Configuration

The UFW firewall is active with the following default policies:

| Policy | Configuration |
|---|---|
| Default incoming | Deny |
| Default outgoing | Allow |
| SSH | Allow TCP 22 |
| HTTP | Allow TCP 80 |

Both IPv4 and IPv6 rules were verified.

A controlled test on TCP port 8081 confirmed that incoming traffic to a non-allowed port was blocked by UFW.

### Nginx Configuration

Nginx is installed and enabled as a systemd service.

The default Nginx welcome page was successfully accessed:

- Locally from Ubuntu Server.
- From the Windows host through VirtualBox NAT port forwarding.

Nginx is currently serving its default page. Reverse proxy configuration is planned for Sprint 3.

### Repository Security Rules

- Only example configuration files should be committed.
- Real credentials, passwords, private keys, and tokens must never be stored in Git.
- Machine-specific configuration should remain separate from public documentation.
- Only necessary network ports should be exposed.

## Deployment

The complete application deployment procedure is planned for Sprint 3.

Planned scope:

- Python virtual environment.
- FastAPI application.
- Dedicated non-root application service account.
- systemd service configuration.
- Nginx reverse proxy.
- `GET /health` and `GET /info` endpoints.
- Automatic service startup after reboot.

No application deployment is currently claimed as completed.

## Verification and Testing

### Sprint 1 Verification

Sprint 1 verification included:

- Ubuntu Server environment inspection.
- Hostname and operating system verification.
- User and group verification.
- File permission and ownership checks.
- Process and resource inspection.
- Network interface and routing inspection.
- SSH remote connection verification.
- Bash system information script execution.

### Sprint 2 Verification

Sprint 2 verification included:

- SSH public-key authentication without password authentication.
- SSH connectivity after enabling UFW.
- UFW rule and default policy inspection.
- Nginx service status verification.
- Nginx listening port inspection using `ss`.
- Local HTTP response verification using `curl`.
- Windows-to-VM HTTP connectivity verification.
- Controlled blocked-port test on TCP 8081.
- UFW kernel log inspection using `journalctl`.

Useful commands used throughout the project include:

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
ss -tulpn
systemctl status ssh
systemctl status nginx
ufw status verbose
curl -I http://127.0.0.1
journalctl -k
```

Sprint 3 will introduce FastAPI endpoint tests, Nginx reverse proxy verification, and reboot persistence tests.

## Monitoring

Sprint 1 introduced basic Linux system monitoring through standard command-line tools and a Bash script.

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

Sprint 4 will extend monitoring with service health checks, resource thresholds, log inspection, and incident monitoring.

Planned tools:

- `journalctl`
- `systemctl`
- `ss`
- `curl`
- Bash automation

## Troubleshooting

Troubleshooting activities are documented throughout the project.

Available documentation:

- [Sprint 1 Troubleshooting Log](docs/sprints/sprint-01-troubleshooting-log.md)
- [Sprint 2 Networking and Security Report](docs/sprints/sprint-02-networking-security.md)

Sprint 2 included troubleshooting and verification of SSH access, VirtualBox NAT port forwarding, HTTP connectivity, and UFW blocked traffic.

Sprint 4 will introduce detailed incident reports covering service failures, port conflicts, and reverse proxy or firewall configuration problems.

## Security Considerations

The project follows these security principles:

- Least privilege for users and services.
- Appropriate file and directory permissions.
- SSH key-based authentication.
- Default-deny incoming firewall policy.
- Allow only required network ports.
- No passwords, private keys, tokens, or secrets in the repository.
- Separation of example configuration and sensitive local configuration.
- Verification of firewall behavior through controlled tests.

The application-specific service account and systemd security configuration will be addressed in Sprint 3.

## Known Limitations

- The environment is based on a local VirtualBox virtual machine.
- The project does not demonstrate production readiness.
- No external load or performance testing has been conducted.
- Public cloud deployment is outside the current required scope.
- Nginx currently serves its default welcome page; reverse proxy configuration is not yet implemented.
- FastAPI application deployment and systemd application service management are planned for Sprint 3.
- Monitoring extensions and incident response exercises are planned for Sprint 4.

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
docs(sprint-2): document networking and security
feat(scripts): add system information script
feat(app): add health endpoint
```

All project changes should reflect work that has actually been implemented and verified. Screenshots, command outputs, and test results should be linked to the relevant sprint documentation.

The project is maintained incrementally, with meaningful commits and GitHub updates throughout each sprint.