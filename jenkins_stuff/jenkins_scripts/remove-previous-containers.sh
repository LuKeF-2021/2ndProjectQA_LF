#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF 
sudo docker stop frontend
sudo docker stop backend

sudo docker rm server
sudo docker rm backend
EOF