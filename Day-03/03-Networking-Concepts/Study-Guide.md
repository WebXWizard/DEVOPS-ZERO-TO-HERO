# Networking Concepts Study Guide

**Estimated Time**: 2 weeks

Networking is the backbone of DevOps. It defines how services talk to each other and how they are exposed to the internet. Understanding the flow of data is key to configuring and troubleshooting distributed systems.

## Essential Concepts

### 1. OSI and TCP/IP Models
The standard framework for how data moves across computer networks:
- **OSI Model**: (7 Layers) Physical, Data Link, Network, Transport, Session, Presentation, Application.
- **TCP/IP Model**: (4 Layers) Data Link/Physical, Internet, Transport, Application.

### 2. IP Addressing and Subnetting
Identification and categorization of devices on a network:
- **IPv4 vs IPv6**: Range, format, and common use cases.
- **Public vs Private IPs**: Used within a local network vs globally routeable.
- **Subnetting**: Dividing a large network into smaller ones (CIDR notation).
- `127.0.0.1` (localhost), `192.168.*.*` (private), `0.0.0.0` (all interfaces).

### 3. DNS and DHCP
Automating human-friendly names and address assignment:
- **DNS (Domain Name System)**: Maps domain names (`google.com`) to IP addresses.
- **DHCP (Dynamic Host Configuration Protocol)**: Automatically assigns IP addresses to devices.

### 4. Network Protocols
The rules for data exchange:
- **HTTP/HTTPS**: Hypertext Transfer Protocol (Port 80/443).
- **FTP/SFTP**: File Transfer Protocol (Port 21 / SSH-based 22).
- **SSH**: Secure Shell for remote access (Port 22).
- **TCP vs UDP**: Connection-oriented vs connectionless communication.

### 5. Firewalls and Security Groups
Managing network traffic flow:
- `iptables`: Traditional Linux firewall.
- `UFW` (Uncomplicated Firewall): User-friendly management tool.
- **Security Groups**: Cloud-specific (AWS/Azure) firewalls for instances.

### 6. Basic Troubleshooting Tools
Diagnose and fix network issues:
- `ping`: Check connectivity to a host.
- `traceroute`: Identify the path and delays to a host's destination.
- `netstat` / `ss`: View all active incoming and outgoing network connections.
- `curl` / `wget`: Command-line tools for making HTTP requests.
- `dig` / `nslookup`: Query DNS records.

---
**Practical Challenge**: Use `curl -I` on a popular website to view its HTTP headers. Identify the server type and the HTTP status code.
