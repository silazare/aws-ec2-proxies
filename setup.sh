#!/bin/bash
set -e

# Update system
sudo apt -qq update

# Install goproxy
curl -L https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | sudo bash

# Define settings variables
instance_user=$1
proxy_type=$2
proxy_port=$3
proxy_user=$4
proxy_password=$5

# Define service command
if [ -n "$proxy_user" ] && [ -n "$proxy_password" ]; then
  COMMAND="${proxy_type} -t tcp -p '0.0.0.0:${proxy_port}' -a '${proxy_user}:${proxy_password}'"
else
  COMMAND="${proxy_type} -t tcp -p '0.0.0.0:${proxy_port}'"
fi

# Create systemd service
echo "[Unit]
Description=Proxy server
Requires=network.target

[Service]
Type=simple
User=${instance_user}
WorkingDirectory=/home/${instance_user}
ExecStart=/bin/bash -lc '/usr/bin/proxy ${COMMAND}'
TimeoutSec=15
Restart=always

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/proxy.service

# Enable service
sudo systemctl daemon-reload
sudo systemctl enable proxy.service
sudo systemctl start proxy.service

# Print status
sudo systemctl status proxy.service --no-pager
