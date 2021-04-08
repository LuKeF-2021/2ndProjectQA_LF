ssh 18.133.247.125 << EOF
docker run -d -p 5000:5000 --name frontend:latest
docker run -d -p 5001:5001 --name backend:latest
EOF
