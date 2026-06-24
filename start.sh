#!/bin/bash

# Start the Tailscale daemon in the background 
# (Userspace mode bypasses AWS/SnapDeploy Docker restrictions)
tailscaled --tun=userspace-networking &
sleep 5

# Connect to your Tailnet and force a permanent hostname
tailscale up --authkey="tskey-auth-kS8xP8tuez11CNTRL-9AkthZPTup4Y6iRLdmrko4XPkU425CHL" --hostname="snapdeploy-shell" --ssh

echo "Permanent SSH Tunnel Established."

# Start the dummy web server so UptimeRobot keeps it awake 24/7
python3 -m http.server 8080
