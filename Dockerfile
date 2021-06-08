FROM python:3.9.5

ENV PYTHONUNBUFFERED 1

ENV APP_ROOT /project

WORKDIR ${APP_ROOT}

RUN apt-get update

RUN pip3 install -U pip

COPY requirements.txt ${APP_ROOT}/requirements.txt

RUN pip3 install -r ${APP_ROOT}/requirements.txt

# Set the working directory to /app
WORKDIR ${APP_ROOT}

# Copy the current directory contents into the container at /app
ADD . ${APP_ROOT}

RUN chmod 775 -R ${APP_ROOT}

CMD  python manage.py migrate --noinput && python manage.py collectstatic --noinput && python manage.py runserver 0.0.0.0:8000

EXPOSE 8000