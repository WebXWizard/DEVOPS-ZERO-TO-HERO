# EC2 Troubleshooting Common Issues

As a Solution Architect, you need to debug "Why is my server not working?" quickly.

## 1. Connection Refused / Timeout
**Symptom:** You try to SSH/RDP or hit the web server, and it hangs or says "Connection Refused".

**Checklist:**
1. **Security Group:** Is Port 22 (SSH), 3389 (RDP), or 80 (HTTP) allowed from your IP? *Remember: Security Groups are stateful.*
2. **NACL:** Is the subnet NACL blocking traffic? *Remember: NACLs are stateless (check Inbound AND Outbound rules).*
3. **Route Table:** Does the subnet have a route to the Internet Gateway (IGW)?
4. **OS Firewall:** Is `ufw` (Linux) or Windows Firewall blocking the port inside the OS?

## 2. Instance Status Checks
- **System Status Check:** Hardware/Network issue on AWS side.
  - *Fix:* Stop and Start the instance (moves it to a new healthy host). Rebooting helps, but Stop/Start is better for hardware issues.
- **Instance Status Check:** OS/Software issue.
  - *Fix:* Reboot. Check system logs.

## 3. Immediate Termination
**Symptom:** You launch an instance and it goes `Pending` -> `Shutting Down` -> `Terminated` immediately.

**Causes:**
1. **EBS Limit:** You've reached the limit of volumes only your region.
2. **EBS Encryption:** You don't have permission to use the KMS key for decryption.
3. **Corrupted Snapshot/AMI:** The AMI is broken.

## 4. "Unprotected Private Key File" (SSH Error)
**Symptom:** `WARNING: UNPROTECTED PRIVATE KEY FILE!`
**Fix:** `chmod 400 my-key.pem`. Permissions are too open.
