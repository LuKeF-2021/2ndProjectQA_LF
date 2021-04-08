#! /bin/bash

echo "Docker image building in process"

# finding frontend/Dockerfile
echo "build frontend image started"
cd jenkins_stuff
cd frontend
sudo docker build -t frontend:latest .
cd ..

# finding backend/Dockerfile
echo "build backend image started"
cd backend
sudo docker build -t backend:latest .
cd ..
# builds complete by this stage, time to push images to DockerHub

echo "Pushing images to DockerHub"

sudo docker tag frontend:latest lukef2021/frontend:latest
sudo docker tag backend:latest lukef2021/backend:latest
sudo docker login -u $USERNAME -p $PASSWORD
sudo docker push lukef2021/frontend:latest
sudo docker push lukef2021/backend:latest

echo "images pushed, deleting local images"

sudo docker rmi frontend:latest
sudo docker rmi backend:latest
sudo docker rmi lukef2021/frontend:latest
sudo docker rmi lukef2021/backend:latest
