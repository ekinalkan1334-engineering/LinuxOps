
# Command Reference: Linux Fundamentals (Sprint 1)

| Field | Value |
|---|---|
| Topic | Linux System Administration |
| Sprint | 1 - Linux Fundamentals |
| Operating System | Ubuntu Server 24.04.5 LTS |
| Environment | VirtualBox Virtual Machine |
| Last Updated | 2026-11-23 |

This document provides a reference for the Linux commands used and studied during Sprint 1 of the LinuxOps project.

The examples are based on the Ubuntu Server environment. Commands requiring administrative privileges are marked with `sudo`.

---

## 1. System Information and Navigation

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `whoami` | Display current username | `whoami` | Shows which user is currently logged in |
| `hostname` | Display server hostname | `hostname` | Shows the machine name |
| `pwd` | Print working directory | `pwd` | Displays the current working directory |
| `ls` | List directory contents | `ls` | Displays files and directories |
| `ls -la` | Detailed directory listing | `ls -la` | Includes hidden files, permissions, and ownership |
| `cd` | Change directory | `cd ~/linuxops` | Moves to the specified directory |
| `uptime` | Display system uptime | `uptime` | Shows how long the system has been running |
| `hostnamectl` | Display system information | `hostnamectl` | Shows hostname and operating system information |

### Important Notes

- `~` represents the current user's home directory.
- `pwd` helps identify the current working location.
- `ls -la` is useful for inspecting file permissions and ownership.
- `cd` without an argument returns the user to their home directory.

---

## 2. Disk and Memory Management

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `df -h` | Display filesystem disk usage | `df -h /` | Shows disk capacity and available space for the root filesystem |
| `free -h` | Display RAM and swap usage | `free -h` | Shows total, used, and available memory |
| `top` | Monitor system resources | `top` | Displays running processes and real-time resource usage |

### Important Notes

- The `-h` option means human-readable output.
- In `free -h`, the `available` value estimates memory available to applications.
- `top` can be closed by pressing `q`.

---

## 3. Files and Directories

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `mkdir` | Create a directory | `mkdir test-folder` | Creates a new directory |
| `mkdir -p` | Create nested directories | `mkdir -p ~/linuxops` | Creates parent directories when necessary |
| `touch` | Create an empty file | `touch test.txt` | Creates a file if it does not exist |
| `cat` | Display file contents | `cat test.txt` | Prints the contents of a file |
| `echo` | Display text | `echo "Hello Linux"` | Prints text to the terminal |
| `echo "text" > file` | Write text into a file | `echo "Hello" > test.txt` | Creates or overwrites a file |
| `find` | Search for files and directories | `find ~/linuxops -name "test.txt"` | Searches recursively by filename |
| `find -type f` | Find regular files | `find ~/linuxops -type f` | Lists regular files in the selected location |
| `find -type d` | Find directories | `find ~/linuxops -type d` | Lists directories in the selected location |

### Important Notes

- `>` overwrites existing file contents.
- `>>` appends text instead of overwriting.
- `find` searches recursively through directories.
- Use `pwd` to verify your current location before creating or modifying files.

---

## 4. File Permissions and Ownership

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `ls -l` | Display file permissions | `ls -l` | Shows permissions, owner, group, and file information |
| `chmod` | Change file permissions | `chmod +x sysinfo.sh` | Adds executable permission |
| `chown` | Change ownership | `sudo chown deploy:deploy ~/linuxops` | Changes the owner and group of the specified directory |
| `ls -ld` | Inspect directory permissions | `ls -ld ~/linuxops` | Displays permissions of the directory itself |

### Understanding Linux Permissions

Example:

```text
drwxr-xr-x
```

The permission string contains three main permission groups:

| Permission Group | Applies To |
|---|---|
| First group | File owner |
| Second group | File group |
| Third group | Other users |

Permission symbols:

| Symbol | Meaning | Numeric Value |
|---|---|---|
| `r` | Read | 4 |
| `w` | Write | 2 |
| `x` | Execute | 1 |
| `-` | No permission | 0 |

Example:

```bash
chmod +x sysinfo.sh
```

This command adds executable permission to the script.

### Why Permissions Matter

Linux uses permissions to control who can read, modify, and execute files.

Correct permissions help protect system files and prevent unauthorized changes.

---

## 5. Users and Groups

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `whoami` | Display current user | `whoami` | Shows the active username |
| `id` | Display user and group IDs | `id` | Shows UID, GID, and group memberships |
| `groups` | Display group memberships | `groups` | Lists groups of the current user |
| `sudo adduser` | Create a user | `sudo adduser deploy` | Creates a new user account |
| `sudo usermod -aG` | Add user to a group | `sudo usermod -aG sudo deploy` | Adds a user to an additional group |
| `sudo -iu` | Start a login shell as another user | `sudo -iu deploy` | Opens a login shell as the specified user |
| `grep` | Search text in files | `grep "deploy" /etc/passwd` | Finds matching lines |
| `cat /etc/passwd` | Display user account information | `cat /etc/passwd` | Shows local user account entries |

### LinuxOps User Configuration

The project uses two main user accounts:

| User | Purpose |
|---|---|
| `ekin` | Initial Ubuntu installation account |
| `deploy` | Additional project administration account |

The `deploy` account was added to the `sudo` group.

Verification commands:

```bash
whoami
id
groups
```

To inspect the group memberships of the project account:

```bash
id deploy
```

The exact output depends on the active user and its group configuration.

**Note:** `/etc/passwd` contains account information, not users' actual passwords. Password hashes are stored separately in `/etc/shadow`, which requires appropriate privileges to read.

---

## 6. Process Management

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `ps` | Display current terminal processes | `ps` | Shows processes associated with the terminal |
| `ps aux` | Display running processes | `ps aux` | Lists processes across the system |
| `ps -eo` | Select process information columns | `ps -eo pid,comm,%cpu,%mem` | Displays PID, command, CPU, and memory usage |
| `top` | Real-time process monitoring | `top` | Shows resource consumption and running processes |
| `head` | Display the first lines | `ps aux \| head -n 8` | Limits output to the first eight lines |

### Process Monitoring in the Project

The system information script uses:

```bash
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
```

This command:

1. Lists processes.
2. Displays PID, command name, CPU usage, and memory usage.
3. Sorts processes by CPU consumption in descending order.
4. Displays the first six lines, including the header.

---

## 7. Service Management with systemd

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `systemctl status` | Check service status | `systemctl status ssh` | Displays detailed service information |
| `systemctl is-active` | Check whether a service is running | `systemctl is-active ssh` | Returns the active state |
| `systemctl is-enabled` | Check startup configuration | `systemctl is-enabled ssh` | Checks whether the service starts automatically |
| `sudo systemctl start` | Start a service | `sudo systemctl start ssh` | Starts the specified service |
| `sudo systemctl stop` | Stop a service | `sudo systemctl stop ssh` | Stops the specified service |
| `sudo systemctl enable` | Enable startup at boot | `sudo systemctl enable ssh` | Configures automatic startup |

### LinuxOps SSH Service

The OpenSSH service was started and enabled:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Verification:

```bash
systemctl status ssh
```

Expected state:

```text
active (running)
```

The `active (running)` state indicates that the SSH service is currently running.

---

## 8. Networking Commands

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `ip a` | Display network interfaces | `ip a` | Shows IP addresses and interface status |
| `ip route` | Display routing table | `ip route` | Shows routes and the default gateway |
| `ss -tln` | Display listening TCP ports | `ss -tln` | Shows TCP sockets in listening state |
| `ss -tlnp` | Display listening ports and processes | `ss -tlnp` | Includes process information when permissions allow |

### LinuxOps Network Configuration

The Ubuntu virtual machine uses VirtualBox NAT networking.

Observed network information:

| Item | Value |
|---|---|
| Network Interface | `enp0s3` |
| IPv4 Address | `10.0.2.15` |
| Default Gateway | `10.0.2.2` |
| SSH Guest Port | `22` |
| SSH Host Port | `2222` |

The SSH connection was established from Windows PowerShell using:

```powershell
ssh -p 2222 deploy@127.0.0.1
```

In this configuration, Windows connects to its own loopback address on port `2222`. VirtualBox forwards that connection to the Ubuntu virtual machine on port `22`.

---

## 9. Bash Scripting

| Command | Purpose | Example | Explanation |
|---|---|---|---|
| `#!/bin/bash` | Specify script interpreter | First line of a script | Runs the script using Bash |
| `echo` | Print output | `echo "System Information"` | Displays text |
| `chmod +x` | Make script executable | `chmod +x sysinfo.sh` | Adds execute permission |
| `./script.sh` | Execute a local script | `./sysinfo.sh` | Runs the script in the current directory |

### LinuxOps System Information Script

The project includes:

```text
scripts/sysinfo.sh
```

The script collects:

- Hostname.
- Operating system information.
- System uptime.
- Disk usage.
- Memory usage.
- Logged-in users.
- Top five CPU-consuming processes.

**Execution from the repository root:**

```bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
```

**Execution in the Ubuntu VM:**

The script was also transferred to `/home/deploy/linuxops/sysinfo.sh`.

From the `/home/deploy/linuxops` directory, it was executed using:

```bash
chmod +x sysinfo.sh
./sysinfo.sh
```

The script was successfully executed in the Ubuntu Server environment.

---

## 10. Important Linux Concepts

| Concept | Explanation |
|---|---|
| Kernel | The core of the Linux operating system that manages hardware and system resources |
| Shell | A command-line interface used to interact with the operating system |
| Process | A running instance of a program |
| Service | A background system function managed through a service manager such as systemd |
| Root | The administrative account with unrestricted system privileges |
| Sudo | Allows authorized users to execute commands with elevated privileges |
| Permission | Defines who can read, write, or execute a file |
| PID | Process Identifier, a unique number assigned to a process |
| IP Address | An address used to identify a device on a network |
| Port | A communication endpoint used by network services |

---

## 11. Safety Notes

- Use `sudo` only when administrative privileges are required.
- Check the current directory with `pwd` before changing or deleting files.
- Inspect permissions with `ls -l` before modifying them.
- Avoid executing commands copied from unknown sources.
- Never store passwords, private keys, or tokens in public repositories.
- Be especially careful with recursive deletion commands.
- Verify the target path before running commands that modify ownership or permissions.

---

## 12. References

- Ubuntu Server Documentation: https://ubuntu.com/server/docs
- Linux Manual Pages: https://man7.org/linux/man-pages/
- GNU Coreutils Manual: https://www.gnu.org/software/coreutils/manual/
- systemd Documentation: https://systemd.io/
