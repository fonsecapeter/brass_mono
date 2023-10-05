FROM python:3.8
LABEL maintainer="Peter Fonseca <peter.nfonseca@gmail.com>"
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.cargo/bin:${PATH}"
ENV PYTHONUNBUFFERED=1
ENV TERM=xterm
COPY . /app
WORKDIR /app

RUN apt update \
  && apt install -y \
    cmake \
    fontforge \
    meson \
    ninja-build \
    tree \
    ttfautohint \
    zip
RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN mkdir /root/.FontForge \
  && touch /root/.FontForge/hotkeys

RUN pip install --upgrade pip==23.2.1 \
  && pip install pip-tools==7.3.0 \
  && pip install -r /app/requirements.txt

WORKDIR /app/lib/ots
RUN meson build \
  && ninja -C build \
  && cp build/ots-sanitize /usr/local/bin
WORKDIR /app

RUN /app/bin/docker/build
