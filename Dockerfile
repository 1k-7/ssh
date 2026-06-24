FROM ubuntu:latest

# Install Python (for UptimeRobot) and curl (to download Tailscale)
RUN apt-get update && apt-get install -y python3 curl wget nano

# Install Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port 8080 for UptimeRobot
EXPOSE 8080

# Boot the script
CMD ["/start.sh"]
