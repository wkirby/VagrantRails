#!/usr/bin/env bash

echo "-------------------------------------------"
echo "------ Provisioning New Rails App ---------"
echo "-------------------------------------------"

#
# Update Box
#

echo "=> Updating system... "
echo "-------------------------------------------"

sudo apt-get update
echo "=> done..."

#
# Install requirements
#

echo "=> Installing system requirements... "
echo "-------------------------------------------"

apt-get -y install curl nodejs libyaml-dev libtool openssl libxslt-dev libxml2-dev
echo "=> done..."

echo "=> Installing db..."
echo "-------------------------------------------"

apt-get -y install libsqlite3-0 sqlite3 libsqlite3-dev libmysqlclient-dev
echo "=> done..."

echo "=> Installing git..."
echo "-------------------------------------------"

apt-get -y install git-core
echo "=> done..."

#
# Install RVM
#

echo "=> Installing RVM... "
echo "-------------------------------------------"

curl -L https://get.rvm.io | sudo bash -s stable
source "/usr/local/rvm/scripts/rvm"
command rvm install 2.0.0 --autolibs=enabled
rvm --default use 2.0.0

echo "=> done..."

echo "=> Updating gemfiles... "
echo "-------------------------------------------"

gem update --system --no-ri --no-rdoc
gem install bundler rails --no-ri --no-rdoc -f

echo "=> done..."

#
# Creating App Directory
#

cd /vagrant
rails new railsApp
cd railsApp

#
# GIT Setup
#

touch .gitignore
touch README.md

git init
git add .
git commit -m 'initial commit'

echo "=> That's all folks!"
echo "-------------------------------------------"