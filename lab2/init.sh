#!/bin/sh
while ! nc -z db 5432; do
  sleep 1
done

python3 manage.py migrate

echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists() or User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')" | python3 manage.py shell


python3 manage.py collectstatic --noinput

python3 manage.py runserver 0.0.0.0:8000