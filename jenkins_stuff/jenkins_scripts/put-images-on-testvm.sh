ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF 
sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD
sudo docker pull frontend:latest
sudo docker pull backend:latest
EOF 
