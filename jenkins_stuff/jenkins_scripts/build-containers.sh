#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF
sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD
sudo docker run -d -p 5000:5000 --name lukef2021/frontend:latest frontend:latest
sudo docker run -d -p 5001:5001 --name lukef2021/backend:latest backend:latest
EOF