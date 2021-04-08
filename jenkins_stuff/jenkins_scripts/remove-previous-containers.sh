#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF 
sudo docker stop frontend
sudo docker stop backend

sudo service docker stop
sudo docker network rm project-network
sudo docker rm -f frontend
sudo docker rm -f backend
sudo service docker start

EOF