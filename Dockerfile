FROM ubuntu:latest

# Install standard utilities and ttyd
RUN apt-get update && apt-get install -y ttyd nano curl wget python3

# Expose the standard web port
EXPOSE 8080

# Boot ttyd on port 8080, secure it with a password, and launch bash
CMD ["ttyd", "-p", "8080", "-c", "krono:5KHQGmhugXwXSA", "bash"]
