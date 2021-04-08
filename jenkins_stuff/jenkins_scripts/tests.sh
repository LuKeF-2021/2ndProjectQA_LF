#! /bin/bash

ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa ubuntu@35.176.207.137 << EOF

sudo docker exec frontend pytest tests/test_frontend.py --cov application >> frontend_results.txt
sudo docker exec backend pytest tests/test_backend.py --cov application >> backend_results.txt

cat ~/frontend_results.txt
cat ~/backend_results.txt

EOF