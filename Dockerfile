FROM python:stretch

# Set up app dir
COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3-pip

RUN pip3 install pyjwt flask gunicorn pytest

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]

# To run docker, docker run -p 8080:8080 --rm --env-file=env_file jwt-api-test