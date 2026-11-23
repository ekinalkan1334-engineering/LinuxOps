
# Sprint 1 Report: Linux Fundamentals

| Field | Value |
|---|---|
| Sprint | 1 |
| Period | 2026-11-21 to 2026-11-22 |
| Status | Hands-on work completed; documentation prepared; six screenshots collected; final repository review in progress |
| Author | Ekin |
| Environment | Ubuntu Server 24.04.5 LTS in VirtualBox 7.2.22 on Windows 11; VM `linuxops-server` (2 GB RAM, 2 CPUs, 25 GB disk, NAT network); text console only |

## 1. Overview

Sprint 1 builds the foundation of the project: installing Ubuntu Server in a virtual machine and learning the everyday Linux skills needed for later sprints.

The work covered Linux filesystem navigation, user and group management, administrative privileges, file permissions, process and service management, basic network inspection, SSH access, and writing a Bash script to display system information.

## 2. Learning Objectives

Tick a box only when you can demonstrate the skill independently.

- [ ] Install Ubuntu Server in a virtual machine and log in
- [ ] Describe the Linux directory layout and find disk and memory usage
- [ ] Create users and groups and explain least privilege
- [ ] Explain the difference between `root` and `sudo`
- [ ] Read and change file permissions (`ls -l`, `chmod`, `chown`)
- [ ] List, start and stop processes and services
- [ ] Write and run a simple Bash script
- [x] Establish an SSH connection to the Ubuntu Server VM

## 3. Concepts and Explanations

**Filesystem layout.** Everything in Linux starts from the root directory, `/`. Important directories include `/home` for user files, `/etc` for configuration, `/var` for changing data such as logs, `/srv` for server data, and `/root` for the root user's home directory.

**Users and groups.** Each user has a numeric user ID (UID). Regular user accounts commonly start at UID 1000. Groups make it possible to grant permissions to multiple users. A regular user does not automatically have administrative privileges. This supports the principle of least privilege.

**root and sudo.** The `root` account has full administrative privileges. Using it for everyday tasks increases the risk of accidental system changes. The `sudo` command allows an authorized user to execute individual commands with administrative privileges.

**Permissions.** Linux permissions define read, write and execute access for the file owner, group and other users. Their numeric values are 4, 2 and 1. A directory requires execute permission to be entered. The setgid bit (`2` in `2770`) makes newly created files and directories inherit the parent directory's group.

**Processes and services.** A process is a running program with a process ID (PID). A service is commonly managed by `systemd` and controlled with `systemctl`. `enabled` means a service is configured to start at boot, while `active` means it is currently running.

**Bash script.** A Bash script is a text file containing commands. The first line, `#!/bin/bash`, identifies the interpreter. The script needs execute permission to be launched directly.

## 4. Commands Used

The full command list, explanations and examples are available in [Command Reference](../reference/command-reference.md).

Commands included navigation, file management, permissions, user and group management, process inspection, service management, networking and Bash scripting.

## 5. Expected vs. Actual Output

Expected results were considered before running commands. Some outputs were captured in screenshots, while others were checked directly on the terminal and recorded in text.

### Identity and group membership

**Expected:** The initial regular user has UID 1000 and belongs to the `sudo` group.

**Actual:**

```text
uid=1000(ekin) gid=1000(ekin) groups=1000(ekin),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),101(lxd)
```

**Notes:** The output matched the expected result. The `lxd` group was also present and was noted for future security review.

A separate `deploy` account was created later for project work. It has UID 1001 and was added to the `sudo` group. Its membership was verified with the `groups` command. The project directory `/home/deploy/linuxops` is owned by `deploy:deploy`.

### Home directory permissions

**Expected:** The home directory should restrict access by other users.

**Actual:**

```text
drwxr-x--- 4 ekin ekin 4096 Nov 21 09:04 ekin
```

The permissions allow the owner full access, the group read and execute access, and no access for others.

### Changing permissions with chmod

**Expected:** `chmod 600` removes group and other permissions.

**Actual:**

```text
-rw-rw-r-- 1 ekin ekin 0 Nov 21 21:06 not.txt
-rw------- 1 ekin ekin 0 Nov 21 21:06 not.txt
```

After `chmod 000`, reading the file with `cat not.txt` returned `Permission denied`. After `chmod 600`, the owner could read the file again.

### A second user without administrative rights

**Expected:** A newly created regular user should not automatically belong to the `sudo` group and should not be able to read files that its permissions do not allow.

**Actual:**

```text
uid=1001(testuser) gid=1001(testuser) groups=1001(testuser),100(users)
```

The command below returned `Permission denied`:

```bash
sudo -u testuser cat /home/ekin/linuxops-test/not.txt
```

This experiment demonstrated how Linux file permissions restrict access between users.

### Group-shared directory

**Expected:** With the `linuxops-team` group and directory permissions set to `2770`, group members should be able to create files in the shared directory, and new files should inherit the directory's group.

**Actual:** Both `ekin.txt` and `testuser.txt` were created in `/srv/shared`. Their group ownership was verified as `linuxops-team`.

### root and sudo

**Actual (confirmed during the exercise):**

- `whoami` printed `ekin`.
- `sudo whoami` printed `root`.
- `ls /root` was denied.
- `sudo ls -a /root` worked.
- `testuser` was not allowed to use `sudo`.

The initial user `ekin` and the later project user `deploy` both had administrative access through the `sudo` group. The `testuser` account was used only for permission experiments.

### Processes and services

**Actual (confirmed during the exercise):**

A background process started with `sleep 300 &` appeared in the process list with PID 1146. It disappeared after running `kill 1146`.

For the `cron` service:

- `systemctl is-active cron` returned `active`.
- After stopping the service, it returned `inactive`.
- After starting it again, it returned `active`.
- `systemctl is-enabled cron` returned `enabled`.

### System information script

The Bash script was created, given execute permission with `chmod +x`, and executed successfully in the Ubuntu Server environment.

The final version of the script displays:

- Hostname: `linuxops-server`
- Operating system: Ubuntu 24.04.5 LTS
- System uptime
- Disk usage
- Memory and swap usage
- Logged-in users
- Top 5 CPU-consuming processes

The updated script was transferred to the Ubuntu Server VM, given execute permission, and executed successfully.

The output confirmed that the script could retrieve and display the expected system information.

The message `No LSB modules are available.` appeared before the operating system description. This was a harmless message from `lsb_release` and did not prevent the script from completing.

The final execution output is documented in `evidence/sprint-01/04-system-information-script.png`.

## 6. Configuration Details

| Item | Configuration | Reason |
|---|---|---|
| VM `linuxops-server` | 2048 MB RAM, 2 CPUs, 25 GB disk, NAT | Suitable for a text-only server |
| Operating system | Ubuntu Server 24.04.5 LTS | Linux server environment |
| Installer keyboard | Turkish Q | Matches the physical keyboard |
| Storage | Guided storage, LVM, no encryption | Installer configuration |
| Initial user | `ekin` | Created during installation |
| Project user | `deploy` | Separate account for project work |
| Test user | `testuser` | Used for permission experiments |
| Test group | `linuxops-team` | Used for shared-directory permission experiments |
| SSH | Host port 2222 forwarded to guest port 22 | Allows SSH access from Windows |
| Test objects | `/srv/shared`, `~/linuxops-test`, test files | Created for permission experiments |

The `deploy` account is the project administration account. The `testuser` account and `linuxops-team` group were created for learning and permission experiments, not as permanent application accounts.

## 7. Screenshots and Evidence

The following six screenshots document the practical work completed during Sprint 1. All evidence files are stored in `evidence/sprint-01/`.

| Repository file name | What it shows |
|---|---|
| `02-network.png` | Ubuntu network interfaces and IP address information (`ip a`) |
| `03-network-routing.png` | Network routing table and default gateway (`ip route`) |
| `04-system-information-script.png` | Output of the updated Bash system information script |
| `05-ssh-connection.png` | Successful SSH connection from Windows PowerShell to the Ubuntu Server VM |
| `06-user-permissions.png` | User identity, group membership and project directory permissions |
| `07-linux-commands.png` | Examples of Linux commands for inspecting processes, disk usage, memory, SSH service status and listening ports |

These screenshots provide evidence of the network configuration, remote access, user management, command-line practice and system monitoring tasks performed during the sprint.

**Evidence limitations:** The current screenshot collection does not include separate images for the Ubuntu installation process, group-sharing experiment, `root`/`sudo` exercise, or process and service management experiments. Some of these activities were completed and their results were recorded in this report, but dedicated screenshots were not captured.

Before publishing, check that no passwords or other sensitive information are visible in the screenshots.

## 8. Troubleshooting Notes

Several issues occurred during the sprint, including an incorrect download type, missing mouse and clipboard integration, a harmless installation-media message, and command typos.

The detailed problems, causes and fixes are documented in [Sprint 1 Troubleshooting Log](sprint-01-troubleshooting-log.md).

## 9. Deliverables Checklist

- [x] Ubuntu Server installation
- [x] Installation guide prepared
- [x] Command reference prepared
- [x] Bash system information script created and tested
- [x] SSH connection established from Windows PowerShell
- [x] Six Sprint 1 screenshots saved in `evidence/sprint-01/`
- [x] Updated Bash script re-tested and final output captured
- [ ] Final review of repository files

## 10. Final Reflection

During Sprint 1, I gained practical experience with Ubuntu Server and learned how basic Linux system administration works. Before this sprint, I had limited experience working with a Linux server through the terminal. Installing Ubuntu Server in VirtualBox and performing the tasks step by step helped me become more comfortable with the command line.

One of the most important things I learned was how Linux permissions work. By creating a separate user, changing file permissions with `chmod`, and testing group access, I understood why user and group management is important for server security. The permission experiments also helped me understand the principle of least privilege and why users should only have the access they need.

Another important part of the sprint was learning how to inspect processes and manage services with `systemctl`. I also created and executed a Bash script to display system information such as the hostname, uptime, disk usage, and memory usage. This helped me see how simple scripts can make repetitive system checks easier.

I faced some difficulties during the process, especially when entering commands incorrectly or working with the virtual machine environment. However, checking error messages and correcting my commands helped me understand the terminal better. Establishing an SSH connection from Windows PowerShell to the Ubuntu Server was also an important achievement because it showed me how a server can be managed remotely.

Overall, Sprint 1 helped me build a foundation in Linux administration. I now have a better understanding of users, permissions, processes, services, networking commands, and basic Bash scripting. In the next sprint, I want to improve my understanding of SSH key authentication, firewall configuration, and web server management. I also want to become more independent when troubleshooting problems instead of relying on step-by-step instructions.
