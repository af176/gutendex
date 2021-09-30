#!/bin/sh

until nc -z -v -w30 postgresdb 5432; do
    echo "Waiting for db"
    sleep 3
done

python3 ./manage.py migrate
python3 ./manage.py updatecatalog
python3 ./manage.py collectstatic --noinput
python3 ./manage.py runserver 0.0.0.0:8000
