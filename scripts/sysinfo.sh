
#!/bin/bash

echo "===== LINUXOPS SYSTEM INFORMATION ====="
echo ""

echo "--- Hostname ---"
hostname

echo ""
echo "--- Operating System ---"
lsb_release -d

echo ""
echo "--- System Uptime ---"
uptime

echo ""
echo "--- Disk Usage ---"
df -h /

echo ""
echo "--- Memory Usage ---"
free -h

echo ""
echo "--- Logged-in Users ---"
who

echo ""
echo "--- Top 5 CPU-Consuming Processes ---"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo ""
echo "===== REPORT COMPLETED ====="
