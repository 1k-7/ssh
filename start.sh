#!/bin/bash

# 1. Start Tailscale in userspace mode (Bypasses Docker restrictions on Back4App)
tailscaled --tun=userspace-networking &
sleep 5

# 2. Authenticate using the hidden Environment Variable
# Make sure your Tailscale key is Reusable, Ephemeral, and Tagged
tailscale up --authkey="${TS_AUTHKEY}" --hostname="back4app-shell" --ssh

echo "Tailscale SSH tunnel established."

# 3. Start a basic web server on port 8080
# Back4App will hit this port to verify the container hasn't crashed.
# If you don't run this, Back4App assumes your container is dead and kills it.
python3 -m http.server 8080
