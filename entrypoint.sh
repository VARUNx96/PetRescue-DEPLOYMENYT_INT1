#!/bin/sh
set -e

echo "Running migration.....⏳⏳⏳"
python manage.py migrate --noinput

echo "Collecting static files...📦"
python manage.py collectstatic --noinput

echo "Starting Gunicorn.........🔥🔥"
exec gunicorn petrescue.wsgi:application --bind 0.0.0.0:8000
