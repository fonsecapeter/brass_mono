FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

COPY . /app
WORKDIR /app

RUN apt update \
  && apt install -y fontforge tree zip

CMD bin/build
