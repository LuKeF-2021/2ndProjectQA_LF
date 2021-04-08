#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF
cd ~/jenkins_stuff/frontend
sudo docker run -d -p 5000:5000 --name lukef2021/frontend:latest lukef2021/frontend:latest
cd ..

cd ~/jenkins_stuff/backend
sudo docker run -d -p 5001:5001 --name lukef2021/backend:latest lukef2021/backend:latest
EOF