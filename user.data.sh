#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2

echo "<h1>Secure VPC Web Server - Deployed with Terraform</h1>" > /var/www/html/index.html
