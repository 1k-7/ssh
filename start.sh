#!/bin/bash

# Boot the native SSH server
/usr/sbin/sshd

# Start a temporary Cloudflare tunnel targeting local port 22
cloudflared tunnel --url ssh://localhost:22 > /tmp/cf.log 2>&1 &

# Wait for Cloudflare to assign a URL
sleep 8

echo "========================================"
echo "YOUR SSH HOSTNAME:"
grep -o 'https://.*trycloudflare.com' /tmp/cf.log | sed 's/https:\/\///'
echo "========================================"

# Start the dummy web server for UptimeRobot pings
python3 -m http.server 8080
