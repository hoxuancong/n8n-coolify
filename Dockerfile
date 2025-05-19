FROM n8nio/n8n:latest

USER root

RUN apk update && apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    openssl \
    ca-certificates \
    bash \
    git \
    curl && rm -rf /var/cache/apk/*

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip && /opt/venv/bin/pip install pytube youtube_dl youtube-transcript-api

RUN npm install moment lodash axios pyodide

ENV PATH="/opt/venv/bin:$PATH"

RUN mkdir -p /data/scripts && chown node:node /data/scripts

# COPY my_script.py /data/scripts/my_script.py

USER node
