
# Troubleshooting Log: Sprint 1

| Field | Value |
|---|---|
| Scope | Sprint 1: installation and Linux fundamentals |
| Last Updated | 2026-11-23 |
| Environment | Ubuntu Server 24.04.5 LTS on VirtualBox |

This log records the issues encountered during Sprint 1, their root causes, the solutions applied, and the lessons learned.

---

## Log Index

| ID | Date | Symptom | Status |
|---|---|---|---|
| TS-001 | 2026-11-21 | Downloaded `.torrent` file instead of the ISO | Resolved |
| TS-002 | 2026-11-21 | No mouse pointer and no copy/paste in the VM console | Workaround |
| TS-003 | 2026-11-21 | `Failed unmounting cdrom.mount - /cdrom` at first reboot | Resolved |
| TS-004 | 2026-11-21 | `ls -l/home` and `ls -1 /home` did not behave as intended | Resolved |
| TS-005 | 2026-11-21 | `cs` used instead of `cd` | Resolved |
| TS-006 | 2026-11-22 | Incorrect `sudo rm` command syntax | Resolved |

---

### TS-001: Wrong Download Type

| Field | Value |
|---|---|
| Date | 2026-11-21 |
| Component | Installer image |
| Status | Resolved |

**Symptom:**

The ISO field in the VirtualBox wizard pointed to `ubuntu-24.04.5-live-server-amd64.iso.torrent`, and the OS fields remained at "Linux 2.6".

**Expected Behavior:**

The wizard should recognize Ubuntu (64-bit) when provided with a valid Ubuntu installation `.iso` file.

**Checks Performed:**

| # | Command / Action | Result |
|---|---|---|
| 1 | Checked the downloaded filename | The filename ended in `.torrent` |
| 2 | Opened the official Ubuntu releases file listing | `.iso`, `.iso.torrent`, and `.iso.zsync` files were listed separately |

**Finding / Root Cause:**

The downloaded file was a `.torrent` file rather than the actual ISO installation image. A torrent file contains information used by a torrent client to download the image; it is not itself the installation image.

**Fix Applied:**

Downloaded the actual file:

`ubuntu-24.04.5-live-server-amd64.iso`

Verified the file on Windows using PowerShell:

```powershell
Get-Item C:\ISO\*.iso | Select-Object Name, Length
```

The downloaded ISO size was 4,080,486,400 bytes (approximately 3.8 GiB).

**Result:**

VirtualBox accepted the ISO image, and the Ubuntu installation completed successfully.

**Takeaway:**

Check the file extension and size before selecting an installation image. A `.torrent` file is not interchangeable with an `.iso` file.

---

### TS-002: No Mouse Pointer and No Copy/Paste in the Console

| Field | Value |
|---|---|
| Date | 2026-11-21 |
| Component | VM console |
| Status | Workaround |

**Symptom:**

The mouse pointer was not visible or useful inside the VM console, and text could not be copied or pasted between Windows and the Ubuntu console.

**Finding / Root Cause:**

Ubuntu Server was running in a text-based console without a graphical desktop environment. VirtualBox shared clipboard functionality was not available in this environment.

**Fix Applied:**

Initially, commands were entered manually and their output was checked directly in the console.

Later, an SSH connection was established from Windows PowerShell:

```powershell
ssh -p 2222 deploy@127.0.0.1
```

This provided a more convenient terminal for entering commands and copying output.

**Result:**

The VM console remained available for direct access, while SSH provided a practical alternative for everyday terminal work.

**Takeaway:**

A text-based server does not require a graphical desktop. SSH can provide a more convenient way to administer the server remotely.

---

### TS-003: Installation Medium Message at First Reboot

| Field | Value |
|---|---|
| Date | 2026-11-21 |
| Component | Installer / virtual optical drive |
| Status | Resolved |

**Symptom:**

The console printed:

```text
[FAILED] Failed unmounting cdrom.mount - /cdrom
Please remove the installation medium, then press ENTER
```

The installation medium removal prompt appeared, but the virtual optical drive could not be changed through the VirtualBox interface while the VM was running.

**Finding / Root Cause:**

The message appeared during the transition from the installer environment to the installed operating system. The installation image was still associated with the virtual optical drive.

**Fix Applied:**

Pressed Enter as requested. The system continued booting from the virtual hard disk.

After shutting down the VM, checked the VirtualBox optical drive configuration. The drive was shown as "Empty".

**Result:**

Ubuntu booted successfully from the virtual hard disk.

**Takeaway:**

Follow the installer's removal prompt. If the virtual optical drive cannot be changed while the VM is running, shut down the VM and inspect the drive configuration before the next boot.

---

### TS-004: Command Syntax Typos (`ls -l/home`, `ls -1 /home`)

| Field | Value |
|---|---|
| Date | 2026-11-21 |
| Component | Shell |
| Status | Resolved |

**Symptom:**

The following commands did not produce the intended output:

```bash
ls -l/home
ls -1 /home
```

The first command printed an invalid option error. The second listed names without displaying permissions.

**Finding / Root Cause:**

Two different typing mistakes occurred:

- `ls -l/home`: There was no space between the `-l` option and `/home`.
- `ls -1 /home`: The digit `1` was entered instead of the lowercase letter `l`.

The `-1` option displays one entry per line, while `-l` displays a detailed listing.

**Fix Applied:**

Used the correct command:

```bash
ls -l /home
```

**Result:**

The command displayed the directory contents with permissions, ownership, and other file information.

**Takeaway:**

Linux command options and path arguments must be separated correctly. Pay attention to visually similar characters such as `1` and `l`.

---

### TS-005: `cs` Instead of `cd`

| Field | Value |
|---|---|
| Date | 2026-11-21 |
| Component | Shell |
| Status | Resolved |

**Symptom:**

The following message appeared:

```text
Command 'cs' not found, but can be installed with:
sudo apt install csound
```

**Finding / Root Cause:**

The command was mistyped. The intended command was `cd`, which changes the current working directory.

The shell suggested a similarly named package, but that package was unrelated to the intended operation.

**Fix Applied:**

Used the correct command:

```bash
cd linuxops-test
```

The terminal prompt then reflected the new working directory.

**Result:**

The directory change completed successfully.

**Takeaway:**

Understand what a command is intended to do before installing a package suggested by the shell. A similar package name does not necessarily solve the original problem.

---

### TS-006: Incorrect `sudo rm` Command Syntax

| Field | Value |
|---|---|
| Date | 2026-11-22 |
| Component | Shell / File Management |
| Status | Resolved |

**Symptom:**

Two incorrectly formatted commands failed:

```bash
sudo -rm -r /srv/shared
sudo rm -r/srv/shared
```

The first command printed the `sudo` usage text. The second printed:

```text
rm: invalid option -- '/'
```

The directory was still present when checked with:

```bash
ls /srv
```

**Finding / Root Cause:**

Two syntax errors occurred:

- `sudo -rm`: An unnecessary `-` was placed before the `rm` command.
- `sudo rm -r/srv/shared`: There was no space between the `-r` option and the target path.

**Fix Applied:**

After checking the target path, used:

```bash
sudo rm -r /srv/shared
```

Then verified the result:

```bash
ls /srv
```

The target directory was no longer listed.

**Result:**

The test directory was removed successfully.

**Takeaway:**

Commands such as `rm -r` can permanently delete files and directories. Check the target path carefully before execution, separate options from arguments correctly, and verify the result afterward.

---

## Lessons Learned

The issues encountered during Sprint 1 reinforced several practical Linux administration skills:

1. **File verification:** Check installation image names, extensions, and sizes before using them.
2. **Command syntax:** Pay attention to spaces, options, and visually similar characters.
3. **Terminal workflow:** Understand the difference between a VM console and an SSH terminal.
4. **Service and system behavior:** Observe system messages during installation and startup before assuming a failure is critical.
5. **Safe file management:** Verify paths before executing commands that modify or delete files.
6. **Troubleshooting discipline:** Identify the symptom, investigate the likely cause, apply a fix, and verify the result.
