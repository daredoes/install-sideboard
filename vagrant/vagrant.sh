#!/bin/bash

# dictionary stuff needed for the test DB code to have words to pull from
sudo apt-get update -y
sudo apt-get install -y wamerican language-pack-id apache2-utils
sudo apt-get install -y fabric vim lynx git tofrodos python-paver python-setuptools libcap-dev python-dev libffi-dev python3-dev python3.4-venv python-virtualenv
sudo apt-get install -y dos2unix
sudo locale-gen en_US en_US.UTF-8 hu_HU hu_HU.UTF-8
sudo dpkg-reconfigure locales

# setup our custom bash aliases to make development easy
sudo easy_install virtualenv
cp /home/vagrant/uber/vagrant/bash_aliases /home/vagrant/.bash_aliases
sudo dos2unix /home/vagrant/.bash_aliases
cd /home/vagrant/uber
if [ ! -d "sideboard" ]; then
  git clone https://github.com/daredoes/sideboard
fi
cd sideboard
if [! -d "darecms"]; then
  git clone https://github.com/daredoes/darecms
fi
virtualenv -p python3 env --always-copy
paver install_deps
sudo apt-get install -y postgresql postgresql-contrib
printf 'cms\ncms' | sudo -u postgres createuser -s -d -P cms
sudo -u postgres createdb cms
