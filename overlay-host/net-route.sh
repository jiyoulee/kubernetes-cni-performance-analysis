#!/bin/bash

# Add firewall rules for Docker Swarm.
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 2376 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 7946 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 7946 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 4789 -j ACCEPT

# Save firewall settings.
sudo /sbin/iptables-save

# Restart Docker.
sudo systemctl restart docker
