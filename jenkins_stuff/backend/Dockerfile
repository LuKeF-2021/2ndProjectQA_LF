FROM python:3.7
COPY . .
RUN pip3 install -r requirements.txt
ENV TEST_DATABASE_URI=""
ENV SECRET_KEY=""
EXPOSE 5001
ENTRYPOINT ["python3","app.py"]
