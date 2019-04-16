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
    tree \
    ttfautohint \
    zip
# RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# RUN cargo --version
# RUN rustc --version
# RUN pip install --upgrade pip==22.3.1 \
#   && pip install pip-tools==6.12.1 \
#   && pip install -r /app/requirements.txt
RUN pip install --no-cache-dir poetry>=0.12 \
  && poetry config settings.virtualenvs.create false \
  && poetry install --no-interaction

WORKDIR /app/lib/ots
RUN meson build \
  && ninja -C build \
  && cp build/ots-sanitize /usr/local/bin
WORKDIR /app

CMD /app/bin/docker/build
