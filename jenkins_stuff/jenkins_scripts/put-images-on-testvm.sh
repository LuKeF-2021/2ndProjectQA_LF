ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF 
sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD
sudo docker pull lukef2021/frontend:latest
sudo docker pull lukef2021/backend:latest
EOF 
