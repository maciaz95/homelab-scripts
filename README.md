# HomeLab Scripts

Collection of automation and monitoring scripts for my Home Lab environment

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

