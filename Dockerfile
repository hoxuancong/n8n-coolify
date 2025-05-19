FROM n8nio/n8n:latest

USER root

# Cài các package hệ thống cần thiết
RUN apk update && apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    openssl \
    ca-certificates \
    bash \
    git \
    curl

# Tạo virtual environment cho Python
RUN python3 -m venv /opt/venv

# Kích hoạt virtualenv và cài các package Python
RUN /bin/bash -c "source /opt/venv/bin/activate && pip install --upgrade pip && pip install pytube youtube_dl youtube-transcript-api"

# Cài các thư viện npm cần thiết
RUN npm install moment lodash axios pyodide

# Dọn dẹp cache apk
RUN rm -rf /var/cache/apk/*

# Thêm virtualenv vào PATH
ENV PATH="/opt/venv/bin:$PATH"

USER node
