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
# TODO: Go back to latest pipenv
# see https://github.com/pypa/pipenv/issues/4273
RUN pip install pipenv==2018.11.26
RUN pipenv install --system

WORKDIR /app/lib/ots
RUN meson build \
  && ninja -C build \
  && cp build/ots-sanitize /usr/local/bin
WORKDIR /app

CMD bin/docker/build
