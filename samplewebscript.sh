#!/bin/bash

#Script for installing httpd webserver on Centos
#Along with artifact deployment inside webserver

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install wget unzip httpd -y
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

# Unpacking the artifact package in tmp directory and copying, deploying in server directory location
wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip
sudo cp -r 2098_health/* /var/www/html/
echo

# Restarting Web Server
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart httpd
echo

# Clean Up the temp directory
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf /tmp/webfiles
echo

# Checking status f Webserver and displaying all files inside webserver
sudo systemctl status httpd
ls /var/www/html/
