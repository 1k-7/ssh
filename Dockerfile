FROM ubuntu:latest

# Install curl (for Tailscale) and python3 (for the health-check web server)
RUN apt-get update && apt-get install -y curl python3 nano

# Install Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Copy the boot script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Back4App requires the container to bind to a web port to pass health checks
EXPOSE 8080

CMD ["/start.sh"]
