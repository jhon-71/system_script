wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
tar xf node_exporter-1.1.2.linux-amd64.tar.gz -C /usr/local/
cd /usr/local/
mv node_exporter-1.1.2.linux-amd64/ node_exporter

# add to system-server
cat > /usr/lib/systemd/system/node_exporter.service << EOF
[Unit]
Description=node_exporter
After=network.target 

[Service]
ExecStart=/usr/local/node_exporter/node_exporter
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# start node_exporter
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
