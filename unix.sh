#!/bin/bash

# dictionary stuff needed for the test DB code to have words to pull from
sudo apt-get update -y
sudo apt-get install -y wamerican language-pack-id apache2-utils
sudo apt-get install -y fabric vim lynx git tofrodos python-paver python-setuptools libcap-dev python-dev libffi-dev python3-dev python3.4-venv python-virtualenv
sudo locale-gen en_US en_US.UTF-8 hu_HU hu_HU.UTF-8
sudo dpkg-reconfigure locales

sudo apt-get install -y postgresql postgresql-contrib
printf 'cms\ncms' | sudo -u postgres createuser -s -d -P cms
sudo -u postgres createdb cms
