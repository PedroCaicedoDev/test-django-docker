FROM python:3.8-alpine

RUN pip install pipenv
COPY Pipfile* /
RUN pipenv lock --requirements > requirements.txt

RUN pip install -r requirements.txt

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN adduser -D appUser
RUN chown -R appUser:appUser /app
RUN chmod -R 755 /app

USER appUser

ARG INFRA_DOCKER_PORT

ENV GLOBAL_PORT=${INFRA_DOCKER_PORT}

EXPOSE $GLOBAL_PORT

CMD python manage.py runserver 0.0.0.0:$GLOBAL_PORT