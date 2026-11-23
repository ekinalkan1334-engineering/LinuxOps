
# Installation Guide: Ubuntu Server 24.04.5 LTS on VirtualBox

| Field | Value |
|---|---|
| Component | Ubuntu Server 24.04.5 LTS |
| Host operating system | Windows 11 |
| Virtualization | Oracle VirtualBox 7.2.22 |
| Virtual machine name | `linuxops-server` |
| Network mode | NAT |
| Installation date | November 21, 2026 |
| Guide status | Updated based on the actual installation and initial configuration |
| Project | LinuxOps - Cloud Engineering Track |

## 1. Purpose

This guide explains how to create a virtual machine in Oracle VirtualBox and install Ubuntu Server 24.04.5 LTS.

The objective is to build a Linux server environment for practicing system administration, user management, networking, remote access, Bash scripting, and monitoring.

The guide also documents the initial configuration and verification activities performed after installation.

## 2. Prerequisites

| Requirement | Details |
|---|---|
| Host computer | Windows 11 |
| Virtualization software | Oracle VirtualBox 7.2.22 |
| Hardware virtualization | Enabled |
| Installer image | `ubuntu-24.04.5-live-server-amd64.iso` |
| Operating system | Ubuntu Server 24.04.5 LTS |
| Version control | Git and GitHub |

The Ubuntu Server ISO should be downloaded from the official Ubuntu website.

Official download page:

[Ubuntu Server Downloads](https://ubuntu.com/download/server)

**Important:** A `.torrent` file is not the Ubuntu installation image. The actual installer must have the `.iso` extension.

## 3. Installation Steps

### Step 1: Prepare the ISO file

Download the Ubuntu Server 24.04.5 LTS ISO image.

Store it in a directory outside OneDrive to avoid synchronization problems with large installation files.

Example location:

```text
C:\ISO\ubuntu-24.04.5-live-server-amd64.iso
```

### Step 2: Create the virtual machine

Open VirtualBox and select **New**.

Use the following configuration:

| Setting | Value |
|---|---|
| Name | `linuxops-server` |
| Type | Linux |
| Version | Ubuntu (64-bit) |
| ISO Image | Ubuntu Server 24.04.5 LTS ISO |
| Unattended Installation | Disabled |
| Base Memory | 2048 MB |
| Processors | 2 |
| Virtual Disk | 25 GB |
| Network Adapter | NAT |

The installation is performed manually to understand and document each configuration step.

**Expected result:** The `linuxops-server` virtual machine appears in the VirtualBox machine list.

### Step 3: Start the installer

Start the virtual machine.

Select:

`Try or Install Ubuntu Server`

The installer uses a text-based interface. Use the keyboard arrows, Tab, Space, and Enter to navigate.

### Step 4: Configure the installer

The following configuration was used during installation:

| Installer Screen | Selection |
|---|---|
| Language | English |
| Keyboard Layout | Turkish Q |
| Installation Type | Ubuntu Server |
| Network | DHCP |
| Proxy | Default |
| Ubuntu Mirror | Default |
| Storage | Use an entire virtual disk with LVM |
| Encryption | Disabled |
| Profile | Ekin |
| Server Name | `linuxops-server` |
| Initial Username | `ekin` |
| Ubuntu Pro | Skipped |
| Featured Snaps | None selected |

The virtual disk belongs exclusively to the virtual machine. The installation does not format the host computer's physical disk.

### Step 5: Complete the installation

Wait for the installer to copy files, install the required packages, and configure the bootloader.

When installation is complete, select **Reboot Now**.

A message such as:

```text
Failed unmounting cdrom.mount - /cdrom
```

may appear during the first reboot.

This can occur when the installation medium is still attached. Follow the installer prompt and press Enter to continue.

### Step 6: Log in to Ubuntu Server

After reboot, the console displays:

```text
linuxops-server login:
```

Log in using the initial username and password created during installation.

Verify the system:

```bash
whoami
hostname
pwd
```

Expected results:

```text
ekin
linuxops-server
/home/ekin
```

## 4. Initial System Configuration

After installation, the following environment was established:

| Component | Configuration |
|---|---|
| Hostname | `linuxops-server` |
| Initial user | `ekin` |
| Project administration user | `deploy` |
| Project user privileges | Member of `sudo` group |
| Operating system | Ubuntu Server 24.04.5 LTS |
| Network mode | VirtualBox NAT |
| Guest IPv4 address | `10.0.2.15` |
| SSH service | Active and enabled |

### 4.1 User Management

The initial account, `ekin`, was created during Ubuntu installation.

A separate user named `deploy` was subsequently created for project administration and subsequent deployment activities.

The `deploy` user was added to the `sudo` group to allow authorized administrative operations.

The account and group membership were verified with:

```bash
whoami
id
groups
```

The `deploy` account was used to create and manage the project directory:

```bash
mkdir -p /home/deploy/linuxops
```

Directory ownership was configured with:

```bash
sudo chown deploy:deploy /home/deploy/linuxops
```

The project directory is owned by `deploy:deploy`.

A separate temporary account named `testuser` and a group named `linuxops-team` were also used during Sprint 1 permission experiments. These were learning and testing objects, not the primary project account.

### 4.2 SSH Configuration

The OpenSSH service was activated and configured to start automatically:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Verify the service:

```bash
systemctl status ssh
```

Expected service state:

```text
active (running)
```

### 4.3 VirtualBox NAT Port Forwarding

To access the Ubuntu virtual machine from Windows, a NAT port forwarding rule was configured.

VirtualBox network settings:

| Setting | Value |
|---|---|
| Network Adapter | Adapter 1 |
| Attached to | NAT |
| Protocol | TCP |
| Host Port | 2222 |
| Guest IP | `10.0.2.15` |
| Guest Port | 22 |

This forwards connections from the Windows host's port `2222` to the Ubuntu guest's SSH port `22`.

The host-side connection uses `127.0.0.1`, while the guest's network interface has the private IP address `10.0.2.15`.

## 5. Network Verification

The following commands were used to inspect the network configuration:

```bash
ip a
ip route
ss -tln
```

Observed network information:

| Item | Observed Value |
|---|---|
| Network Interface | `enp0s3` |
| IPv4 Address | `10.0.2.15/24` |
| Default Gateway | `10.0.2.2` |
| SSH Port | `22` |
| Network Mode | NAT |

The `ip a` command displays network interfaces and assigned addresses.

The `ip route` command displays the routing table and default gateway.

The `ss -tln` command displays listening TCP ports.

## 6. SSH Connection Test

A remote SSH connection was successfully established from Windows PowerShell.

Command:

```powershell
ssh -p 2222 deploy@127.0.0.1
```

Connection details:

| Parameter | Value |
|---|---|
| Client | Windows PowerShell |
| Server User | `deploy` |
| Host Address | `127.0.0.1` |
| Host Port | `2222` |
| Guest SSH Port | `22` |

After successful authentication, the Ubuntu terminal displayed:

```text
deploy@linuxops-server:~$
```

This confirms that the Windows host can remotely access the Ubuntu virtual machine through SSH.

**Note:** SSH password authentication was used for this initial connection. SSH key-based authentication is planned for Sprint 2 and has not yet been configured.

## 7. System Verification

The following commands were used to verify the system:

```bash
hostnamectl
whoami
pwd
df -h
free -h
uptime
```

Additional system inspection commands:

```bash
ps aux
top
systemctl status ssh
ip a
ip route
ss -tln
```

These commands provide information about:

- Operating system and hostname.
- Current user and working directory.
- Disk capacity and usage.
- RAM and swap usage.
- System uptime.
- Running processes.
- Service status.
- Network interfaces and listening ports.

## 8. System Information Script

A Bash script named `sysinfo.sh` was created to collect basic system information.

The script is stored in the repository at:

```text
scripts/sysinfo.sh
```

It displays:

- Hostname.
- Operating system.
- System uptime.
- Disk usage.
- Memory usage.
- Logged-in users.
- Top five CPU-consuming processes.

The updated script was transferred to the Ubuntu Server VM and executed successfully.

From the repository root, the script can be executed with:

```bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

When running the transferred copy from the Ubuntu project directory (`/home/deploy/linuxops`), use:

```bash
chmod +x sysinfo.sh
./sysinfo.sh
```

The successful execution of the updated script is documented in:

`evidence/sprint-01/04-system-information-script.png`

## 9. Common Errors and Troubleshooting

| Symptom | Possible Cause | Resolution |
|---|---|---|
| VirtualBox does not recognize the installer correctly | A `.torrent` file was selected instead of an ISO | Download the actual Ubuntu `.iso` image |
| Mouse pointer is unavailable in the Ubuntu console | Ubuntu Server uses a text-based interface | Use the keyboard or connect through SSH |
| `Failed unmounting cdrom.mount` appears during reboot | Installation medium is still attached | Follow the installer prompt and press Enter |
| SSH connection is refused | SSH service is inactive or port forwarding is incorrect | Check `systemctl status ssh` and VirtualBox NAT rules |
| SSH connection times out | Incorrect host port or network configuration | Verify host port 2222 and guest port 22 |
| Permission denied when accessing project files | Incorrect ownership or file permissions | Inspect permissions with `ls -l` and ownership with `ls -ld` |
| Network interface has no IPv4 address | DHCP or virtual network configuration issue | Inspect `ip a` and `ip route` |

Additional troubleshooting notes are stored in:

`docs/sprints/sprint-01-troubleshooting-log.md`

## 10. Evidence

The following six screenshots document the installation environment and Sprint 1 verification activities.

| Evidence File | Description |
|---|---|
| `02-network.png` | Network interface configuration using `ip a` |
| `03-network-routing.png` | Routing table using `ip route` |
| `04-system-information-script.png` | Successful execution of the updated system information script |
| `05-ssh-connection.png` | Successful SSH connection from Windows PowerShell |
| `06-user-permissions.png` | User, group, and directory permission verification |
| `07-linux-commands.png` | Linux command execution and system inspection |

All six files are stored in:

`evidence/sprint-01/`

**Evidence limitation:** The current screenshot collection does not contain a separate screenshot of the original Ubuntu installation process or VirtualBox creation settings. The installation and configuration are documented in this guide, but those specific screenshots have not been captured.

## 11. Security Notes

The following practices are used in this project:

- A separate `deploy` user is used for project administration.
- Administrative privileges are granted through the `sudo` group.
- The application is planned to run under a dedicated non-root account.
- Passwords and private credentials are not stored in the repository.
- SSH key-based authentication will be configured in Sprint 2.
- Firewall rules and exposed services will be reviewed in Sprint 2.

## 12. Rollback and Cleanup

If the installation must be repeated:

1. Shut down the `linuxops-server` virtual machine.
2. Open VirtualBox.
3. Select the virtual machine.
4. Choose **Remove**.
5. Select **Delete all files** only if the virtual machine should be completely removed.
6. Repeat the installation process.

This operation affects the selected virtual machine and its virtual disk. Make sure that any required project files or evidence have been backed up before deleting the VM.

## 13. References

- Ubuntu Server Documentation: [https://ubuntu.com/server/docs](https://ubuntu.com/server/docs)
- Ubuntu Server Downloads: [https://ubuntu.com/download/server](https://ubuntu.com/download/server)
- VirtualBox Documentation: [https://www.virtualbox.org/manual/](https://www.virtualbox.org/manual/)
- OpenSSH Documentation: [https://www.openssh.com/manual.html](https://www.openssh.com/manual.html)
