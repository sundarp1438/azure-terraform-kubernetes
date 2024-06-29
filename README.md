# Pre-requisites:
  ### No. Of VMs: 1 (Jenkins)
# Tools Installed:
  ### Java
  ### Jenkins
  ### Azure-Cli
  ### Terraform
# Jenkins Plugins:
  ### Azure CLI Plugin
  ### Azure Credentials
  ### Terraform Plugin
# Jenkins Installation:
### sudo yum install java-11* -y
### sudo yum install wget -y
# Please download the Jenkins.war file in any location.
### cd /opt
### wget https://get.jenkins.io/war-stable/2.440.2/jenkins.war
### Run the below command to run the Jenkins.
### java -jar jenkins.war
### Browse to” http://localhost:8080” and wait until the Unlock Jenkins page appears.
### Please get the initial password from the below path for first time.
### /root/.jenkins/secrets/initiaalAdminPassword
### Please proceed with suggested plug-ins installation
### Please proceed with Admin
### Change the password for admin.
### Go to Admin  click on Configure.
### Relogin to the Jenkins

