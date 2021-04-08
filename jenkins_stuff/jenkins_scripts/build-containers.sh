#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF
sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD
sudo docker network create project-network
sudo docker run -d --network project-network -p 5000:5000 --name frontend lukef2021/frontend:latest 
sudo docker run -d --network project-network -p 5001:5001 --name backend lukef2021/backend:latest
EOF