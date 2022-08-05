#!/bin/bash
apt-get update -qq 
apt-get install -y curl apt-transport-https wget mariadb-client jq 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install -y yarn
curl -sL https://deb.nodesource.com/setup_14.x | bash - 
apt-get install -y nodejs
