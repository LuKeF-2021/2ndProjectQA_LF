ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF 
sudo docker pull frontend:latest
sudo docker pull backend:latest
EOF 
