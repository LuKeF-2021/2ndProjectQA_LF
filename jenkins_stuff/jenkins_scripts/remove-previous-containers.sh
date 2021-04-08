#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF 
sudo service docker stop
sudo service docker start

sudo docker stop frontend lukef2021/frontend:latest
sudo docker stop backend lukef2021/backend:latest

sudo docker rm frontend lukef2021/frontend:latest
sudo docker rm backend lukef2021/backend:latest
EOF