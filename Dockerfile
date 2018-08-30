FROM python:3.7
MAINTAINER Peter Fonseca <peter.nfonseca@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV TERM=xterm
COPY . /app
WORKDIR /app

RUN apt update \
  && apt install -y \
    fontforge \
    meson \
    tree \
    ttfautohint \
    zip
RUN pip install pipenv
RUN pipenv install --system

WORKDIR /app/lib/ots
RUN meson build \
  && ninja -C build \
  && cp build/ots-sanitize /usr/local/bin
WORKDIR /app

CMD bin/docker/build
