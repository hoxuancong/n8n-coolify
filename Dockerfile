FROM n8nio/n8n:latest

USER root

RUN apk update && apk add --no-cache \
    ffmpeg python3 py3-pip openssl ca-certificates && \
    pip3 install --no-cache-dir pytube youtube_dl youtube-transcript-api && \
    apk del py3-pip && \
    rm -rf /var/cache/apk/*

RUN npm install moment lodash axios pyodide

USER node