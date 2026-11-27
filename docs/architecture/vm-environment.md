\# Virtual Machine Environment Diagram



\## 1. Project Environment



This project uses an Ubuntu Server virtual machine running on a Windows 11 host. Oracle VirtualBox provides the virtualization environment.



The virtual machine is configured with NAT networking and SSH access through port forwarding.



\## 2. Environment Architecture



```text

+------------------------------------------------+

|                Windows 11 Host                 |

|                                                |

|  Oracle VirtualBox 7.2.22                     |

|                                                |

|  SSH Client (PowerShell)                       |

|  127.0.0.1:2222                                |

|                                                |

+------------------------+-----------------------+

&#x20;                        |

&#x20;                        | TCP Port Forwarding

&#x20;                        | Host Port: 2222

&#x20;                        | Guest Port: 22

&#x20;                        |

&#x20;                        v

+------------------------------------------------+

|             Ubuntu Server Virtual Machine      |

|                                                |

|  Operating System: Ubuntu Server 24.04.5 LTS   |

|  Hostname: linuxops-server                     |

|                                                |

|  Network Mode: NAT                             |

|  IPv4 Address: 10.0.2.15                       |

|  Network Interface: enp0s3                     |

|  Default Gateway: 10.0.2.2                     |

|                                                |

|  SSH Server: TCP Port 22                       |

|                                                |

|  Project User: deploy                          |

+------------------------------------------------+

```



\## 3. Virtual Machine Specifications



| Item | Configuration |

|---|---|

| Host Operating System | Windows 11 |

| Virtualization Software | Oracle VirtualBox 7.2.22 |

| Guest Operating System | Ubuntu Server 24.04.5 LTS |

| Hostname | linuxops-server |

| CPU | 2 cores |

| RAM | 2048 MB (2 GB) |

| Virtual Disk | 25 GB |

| Network Mode | NAT |

| Guest IPv4 Address | 10.0.2.15 |

| Network Interface | enp0s3 |

| Default Gateway | 10.0.2.2 |

| SSH Protocol | TCP |

| SSH Guest Port | 22 |

| SSH Host Port | 2222 |



\## 4. Network Configuration



The virtual machine uses Network Address Translation (NAT).



NAT allows the Ubuntu Server virtual machine to access external networks through the host computer's network connection. The guest operating system uses a private IP address assigned by VirtualBox.



The network interface `enp0s3` handles network communication inside the virtual machine.



The default gateway is `10.0.2.2`. It provides the route from the virtual machine to external networks.



Because the VM uses NAT, SSH access from the Windows host is provided through a port forwarding rule.



\## 5. SSH Connection and Port Forwarding



SSH (Secure Shell) provides encrypted remote access to the Ubuntu Server.



VirtualBox port forwarding maps TCP port `2222` on the Windows host to TCP port `22` on the Ubuntu guest.



| Setting | Value |

|---|---|

| Protocol | TCP |

| Host IP Address | 127.0.0.1 |

| Host Port | 2222 |

| Guest IP Address | 10.0.2.15 |

| Guest Port | 22 |

| SSH User | deploy |



The SSH connection is initiated from Windows PowerShell with the following command:



```bash

ssh -p 2222 deploy@127.0.0.1

```



\### SSH Connection Flow



```text

Windows PowerShell

&#x20;      |

&#x20;      v

127.0.0.1:2222

&#x20;      |

&#x20;      v

VirtualBox Port Forwarding

&#x20;      |

&#x20;      v

Ubuntu Server

10.0.2.15:22

&#x20;      |

&#x20;      v

SSH Server

&#x20;      |

&#x20;      v

deploy User

```



\## 6. Sprint Scope



This environment was prepared for Sprint 1: Linux Fundamentals.



The completed Sprint 1 activities include:



\- Ubuntu Server virtual machine setup

\- Linux command-line practice

\- User and group management

\- File permissions and ownership

\- Process and service management

\- Network configuration inspection

\- SSH remote access

\- Bash system information scripting



The following activities are planned for Sprint 2:



\- SSH key-based authentication

\- UFW firewall configuration

\- HTTP port 80 configuration

\- Nginx installation and configuration

\- Web server connectivity testing



\## 7. Notes



\- The virtual machine uses NAT networking, not bridged networking.

\- SSH port forwarding is configured for access from the Windows host.

\- The SSH server listens on guest port `22`.

\- HTTP port `80` and Nginx are not part of the current Sprint 1 implementation.