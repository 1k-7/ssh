FROM ubuntu:latest

# Install OpenSSH, Python, and wget
RUN apt-get update && apt-get install -y openssh-server python3 wget nano curl

# Configure the SSH Server
RUN mkdir /var/run/sshd
RUN echo 'root:5KHQGmhugXwXSA' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Download and install the Cloudflare Tunnel daemon
RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && dpkg -i cloudflared-linux-amd64.deb

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port 8080 for UptimeRobot
EXPOSE 8080

CMD ["/start.sh"]
