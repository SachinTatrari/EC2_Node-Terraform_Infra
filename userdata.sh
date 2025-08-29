#!/bin/bash

sudo apt update -y

# installing curl and git

sudo apt install -y curl git

#installing node

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

#clone the node js app

git clone https://github.com/SachinTatrari/EC2_Node-Terraform_Infra.git /home/ubuntu/nodeapp

cd /home/ubuntu/nodeapp
npm install

#Run the app on port 3000
nohup node index.js > app.log 2>&1 &
