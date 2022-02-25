#!/bin/bash

#Description: This script automate the installation of Sonarqube
#Author: Alex Ricardo
#Date: Feb,22,2022

echo " Please wait while we are installing Sonarqube....."
echo $UID
if [ $UID = 0 ]
then
echo "Sonarqube doesnt  work when you start it  as root user"
else
echo " you all set to proceed let proceed...... relax and get a coffee..."
fi
sleep 5
echo "Now we are updating your server....."
sleep 2
sudo yum update -y
echo " Let Install Java 11..............."
sleep 2
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt 

echo " Let install Wget..............."
sleep 2
sudo yum install wget -y
sleep 2
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

echo " Let bring up your extra packages.............."
sudo yum install unzip -y
sleep 2
sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo " Let Change ownership to the user and Switch to Linux binaries directory to start service..."
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
sleep 2
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
sleep 2
./sonar.sh start
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
sudo yum install net-tools -y
ifconfig | grep 192.

echo " your installation and configuration of SonarQube server is READY.... Enjoy..."
