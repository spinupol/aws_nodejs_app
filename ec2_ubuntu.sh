#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y libssl-dev g++ make python-pip python-dev build-essential
sudo pip install awscli
wget http://nodejs.org/dist/v0.10.32/node-v0.10.32.tar.gz
tar -xvf node-v0.10.32.tar.gz
cd node-v0.10.32
./configure && make && sudo make install
cd /home/ubuntu
sudo npm install express
sudo npm install forever -g
mkdir application
cd application
sudo wget https://raw.githubusercontent.com/spinupol/aws_nodejs_app/master/app.js
sudo wget https://raw.githubusercontent.com/spinupol/aws_nodejs_app/master/index.html
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 9000
sudo chmod 755 *
sudo node app.js
#forever start app.js