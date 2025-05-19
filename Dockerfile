FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache python3 py3-pip ffmpeg openssl ca-certificates nodejs npm

USER node

# Tạo virtualenv
RUN python3 -m venv /home/node/venv

# Kích hoạt venv và cài các package Python — không còn pyodide
RUN /bin/sh -c ". /home/node/venv/bin/activate && pip install --upgrade pip && pip install requests pandas pytube yt-dlp youtube-transcript-api"

# Cập nhật PATH để dùng venv mặc định
ENV PATH="/home/node/venv/bin:$PATH"

RUN npm install moment lodash axios
