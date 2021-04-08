#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF
sudo docker run -d -p 5000:5000 --name frontend:latest frontend:latest
sudo docker run -d -p 5001:5001 --name backend:latest backend:latest
EOF