Nexus Server Configuration 

sudo yum update -y
yum install wget vim unzip -y
sudo  yum install tar make unzip wget vim -y
cd /opt/

#for java11:
yum fontconfig install java-17-openjdk-devel -y
java -version
wget https://download.sonatype.com/nexus/3/nexus-3.69.0-02-java11-unix.tar.gz
tar -xvf nexus-3.69.0-02-java11-unix.tar.gz
ll 
mv nexus-3.69.0-02 nexus
sudo useradd nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work/
sudo vim /opt/nexus/bin/nexus.rc
sudo vim /opt/nexus/bin/nexus.vmoptions  //no need to change
sudo ln -s /opt/nexus/bin/nexus /etc/rc.d/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig --levels 35 nexus on
sudo service nexus start
sudo service nexus status
firewall-cmd --permanent --add-port=8081/tcp 
firewall-cmd --reload 

systemctl stop firewalld  // don't' apply this command if you have applied above two commands


#login Configurations:


username:  admin

for password set/reset 

cat /opt/sonatype-work/nexus3/admin.password

user: admin
Password: CloudGen@123

#for java1.8
sudo yum install -y java-1.8.0-openjdk.x86_64
java -version
sudo wget https://download.sonatype.com/nexus/3/nexus-3.45.0-01-unix.tar.gz
sudo tar -xvf nexus-3.45.0-01-unix.tar.gz
ll
mv nexus-3.45.0-01 nexus
ll
sudo useradd nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work/
sudo vim /opt/nexus/bin/nexus.rc
sudo vim /opt/nexus/bin/nexus.vmoptions
sudo ln -s /opt/nexus/bin/nexus /etc/rc.d/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig --levels 35 nexus on
sudo service nexus start
sudo service nexus status
systemctl stop firewalld
username:  admin

for password set/reset 

cat /opt/sonatype-work/nexus3/admin.password

user: admin
Password: CloudGen@123


