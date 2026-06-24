#!/bin/bash

# Start the SSH server silently in the background
/usr/sbin/sshd

# Start Websockify to map the WebSocket stream to the SSH port
websockify --web /var/www/html 8080 localhost:2222
