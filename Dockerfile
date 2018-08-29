FROM python:3.7
# FROM ubuntu:18.04 AS build
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm
COPY . /app
WORKDIR /app
RUN apt update \
  && apt install -y \
    fontforge \
    tree \
    ttfautohint \
    zip

# FROM python:3.7-slim
MAINTAINER Peter Fonseca <peter.nfonseca@gmail.com>
ENV PYTHONUNBUFFERED=1
# ENV DEBIAN_FRONTEND=noninteractive
# COPY . /app
# COPY --from=build /app/BrassMono /app/BrassMono
# WORKDIR /app

RUN pip install pipenv
RUN pipenv install --system

CMD bin/docker/build
