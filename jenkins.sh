#STEP-1: INSTALLING GIT JAVA-1.8.0 MAVEN 
yum install git java-1.8.0-openjdk -y
cd /opt
sudo wget https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo tar -xzf apache-maven-3.9.6-bin.tar.gz
#Then set it up:
sudo ln -s /opt/apache-maven-3.9.6 /opt/maven
Add to your profile:
echo "export M2_HOME=/opt/maven" | sudo tee -a /etc/profile.d/maven.sh
echo "export PATH=\$M2_HOME/bin:\$PATH" | sudo tee -a /etc/profile.d/maven.sh
#Then load it:
source /etc/profile.d/maven.sh


#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# STEP 3: Install Java 17 (NOT Java 11)
sudo yum install -y java-17-amazon-corretto


# STEP 4: Install Jenkins
sudo yum install -y jenkins

# STEP 5: Set Java 17 as default (if needed)
sudo alternatives --config java

# STEP 6: Enable and start Jenkins (when we download service it will on stopped state)
sudo systemctl enable jenkins.service
sudo systemctl start jenkins.service

# STEP 6: Check Jenkins status
sudo systemctl status jenkins.service
