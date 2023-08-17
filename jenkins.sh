#!/bin/bash

#install java and set environment variable
sudo amazon-linux-extras install java-openjdk11 -y
sudo echo 'JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64"' >> /etc/profile
$ sudo echo 'PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
$ source /etc/profile


#install maven and set environmentvariable
sudo yum install maven -y
export MAVEN_HOME=/usr/share/maven
export PATH=$PATH:$MAVEN_HOME/bin

#install Git 
sudo yum install git -y

# install jenkins
sudo yum update
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins


# install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
