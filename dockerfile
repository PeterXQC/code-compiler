# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the environment variable to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install VS Code server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Create a workspace directory under the home directory
RUN mkdir -p /root/workspace
WORKDIR /root/workspace

# Expose the port for VS Code server
EXPOSE 6666

# Start the VS Code server
CMD ["code-server", "--bind-addr", "0.0.0.0:6666", "--auth", "none", "--disable-telemetry"]
