#! /bin/bash

ssh -o StrictHostKeyChecking=no -i /home/jenkins/.ssh/id_rsa ubuntu@18.133.247.125 << EOF

sudo docker exec frontend pytest tests/test_frontend.py --cov application
sudo docker exec backend pytest tests/test_backend.py --cov application

EOF