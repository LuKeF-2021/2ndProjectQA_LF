#! /bin/bash

ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa ubuntu@35.176.207.137 << EOF
sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD
sudo docker pull lukef2021/frontend:latest
sudo docker pull lukef2021/backend:latest
EOF