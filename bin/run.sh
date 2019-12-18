#!/bin/bash

if [ "$1" == "" ]; then
    echo "Missing argument."
    exit
fi

source venv/bin/activate

if [ "$1" == "docker" ]; then
    docker-compose up postgres redis
    exit
fi

if [ "$1" == "server" ]; then 
    ./manage.py runserver
    exit
fi

if [ "$1" == "beat" ]; then
    celery -A cafesys beat
    exit
fi

if [ "$1" == "worker" ]; then
    celery -A cafesys worker
    exit
fi

echo "$1 is not a valid argument."
