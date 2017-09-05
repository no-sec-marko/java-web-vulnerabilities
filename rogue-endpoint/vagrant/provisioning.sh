#!/usr/bin/env bash

sudo apt-get update

# install java8
sudo apt-get install software-properties-common
sudo apt-get update
sudo apt-get install --yes python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -qq
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
sudo apt-get install --yes oracle-java8-installer
yes "" | apt-get -f install