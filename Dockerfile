FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache python3 py3-pip ffmpeg openssl ca-certificates nodejs npm

USER node

# Tạo virtualenv trong home node
RUN python3 -m venv /home/node/venv

# Kích hoạt virtualenv và cài đặt các thư viện Python vào đó
RUN /bin/sh -c ". /home/node/venv/bin/activate && pip install --upgrade pip && pip install requests pandas pytube yt-dlp youtube-transcript-api pyodide"

ENV PATH="/home/node/venv/bin:$PATH"

RUN npm install moment lodash axios
