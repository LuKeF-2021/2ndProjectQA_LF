#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@35.176.207.137 << EOF

sh './logindocker.sh'
sudo docker login -u lukef2021 -p $PASSWORD

sudo docker tag frontend lukef2021/frontend
sudo docker tag backend lukef2021/backend

sudo docker push lukef2021/frontend
sudo docker push lukef2021/backend

sudo docker logout

EOF