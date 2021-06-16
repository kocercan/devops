#!/bin/bash
wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz 
tar xvf node_exporter-1.1.2.linux-amd64.tar.gz  
sudo cp node_exporter-1.1.2.linux-amd64/node_exporter /usr/local/bin 
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter  
sudo cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit] 
Description=Node Exporter 
[Service] 
User=node_exporter 
Group=node_exporter 
Type=simple 
ExecStart= /usr/local/bin/node_exporter 
Restart=on-failure 
RestartSec=5 
[Install] 
WantedBy=multi-user.target 
EOF
sudo systemctl daemon-reload 
sudo systemctl start node_exporter 
sudo systemctl enable node_exporter 
systemctl status node_exporter.service 
