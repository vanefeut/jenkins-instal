 #Author : vanessa feutsa
    #Date : 19-jun-2022

## ----------Install jenkins on centos 7 server  -----------------

#Step 1: Install Java
yum install java-1.8.0-openjdk-devel

#Step 2: Enable the Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

if
  [ $! eq 1]
then
yum install wget -y
fi

#Now, disable key check on the repo, run:
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

#Step 3: Install the latest stable version of Jenkins
yum install jenkins
systemctl start jenkins
systemctl status jenkins
systemctl enable jenkins

#Step 4: Adjust the firewall
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload
#does not mine if firewall failed?