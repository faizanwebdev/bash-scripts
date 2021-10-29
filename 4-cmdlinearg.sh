#!/bin/bash

#Script for installing httpd webserver on Centos
#Along with artifact deployment inside webserver


#Variable Declarations
PKG  = "unzip wget httpd"
SRVC = "httpd"
#ARTURL = "https://www.tooplate.com/zip-templates/2098_health.zip"
#ARTNAME = "2098_health"
TMPDIR = "/tmp/webfiles" 

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install $PKG -y
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SRVC
sudo systemctl enable $SRVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TMPDIR
cd $TMPDIR
echo

# Unpacking the artifact package in tmp directory and copying, deploying in server directory location
wget $1
unzip $2.zip
sudo cp -r $2/* /var/www/html/
echo

# Restarting Web Server
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart $SRVC
echo

# Clean Up the temp directory
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TMPDIR
echo

# Checking status f Webserver and displaying all files inside webserver
sudo systemctl status $SRVC
ls /var/www/html/

#commandline argument command => ./4-cmdlinearg.sh https://www.tooplate.com/zip-templates/2098_health.zip 2098_health
#by default $0 will name of script, $1 will be command after script name and so on...like this we can have 9 arguments

