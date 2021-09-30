FROM python:3.6

WORKDIR /app
RUN apt-get update -y && apt-get upgrade -y
RUN apt-cache search postgresql-server
RUN apt install postgresql python3-dev libpq-dev netcat -y
COPY . .
RUN apt install rsync grsync -y
RUN pip install psycopg2
RUN pip install -r requirements.txt


ENTRYPOINT ["sh", "/app/run.sh", "postgresdb"]
