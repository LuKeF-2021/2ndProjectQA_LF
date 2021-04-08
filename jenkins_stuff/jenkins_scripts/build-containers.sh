#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF
sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD
docker run -d -p 5000:5000 --name frontend:latest
docker run -d -p 5001:5001 --name backend:latest
EOF