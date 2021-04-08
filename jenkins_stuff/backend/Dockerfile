FROM python:3.7
COPY . .
RUN pip3 install -r requirements.txt
ENV PROD_DATABASE_URI="mysql+pymysql://admin:12345Qq!@project-prod-db.cnwuilgvwhm0.eu-west-2.rds.amazonaws.com:3306/users"
ENV TEST_DATABASE_URI="mysql+pymysql://admin:12345Qq!@project-test-db.cnwuilgvwhm0.eu-west-2.rds.amazonaws.com:3306/testdb"
ENV SECRET_KEY="testsecret"
EXPOSE 5001
ENTRYPOINT ["python3","app.py"]
