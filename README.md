# HomeLab Scripts

Collection of automation and monitoring scripts for my Home Lab environment

## HomeLab Infrastructure

**Virtualization Platform:**
- **Host:** Windows 11 Pro (16GB RAM)
- **Hypervisor:** Oracle VirtualBox 7.2.2
- **Networking:** Bridged Adapter (VM accessible from home network)

**Virtual Machines:**
- **Ubuntu Server 24.04.3 LTS**
  - Ram: 4GB allocated
  - Storage: 25GB virtual disk
  - Network: DHCP from home router
  - Services: Nginx, SSH from Windows host via dynamic IP

  (future services to be included here...)

**Remote Access:**
- SSH key-based authentication
- Accessible from Windows Terminal/PowerShell
- Github integration with SSH keys



## Monitoring Scripts

### system_health.sh
Basic script that diplays info about:
- System uptime
- Disk usage
- Memory usage
- Top processes by CPU
- Network connections
- System load

**Usage:**
```bash
cd scripts/monitoring
./system_health.sh
```

## Automation Scripts

### disk_space_alert.sh
Monitors disk space usage and alerts when threshold is exceeded.
- Default threshold: 80%
- Checks root partition (/)
- Shows current usage and available space

**Usage:**
```bash
cd scripts/automation
./disk_space_alert.sh
```

