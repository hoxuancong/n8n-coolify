FROM n8nio/n8n:latest

USER root

# Cài các gói cần thiết cho Chromium và Playwright
RUN apk update && apk add --no-cache \
    chromium \
    chromium-chromedriver \
    python3 \
    py3-pip \
    bash \
    curl \
    ttf-freefont \
    libstdc++ \
    libx11 \
    libxext \
    libxrender \
    mesa-gl \
    mesa-dri-gallium \
    nss \
    && rm -rf /var/cache/apk/*

# Cài thư viện Python cần thiết
RUN pip3 install --no-cache-dir playwright asyncio

# Tải trình duyệt Chromium cho Playwright
RUN python3 -m playwright install chromium

# Cài thêm các thư viện npm nếu cần
RUN npm install moment lodash axios

USER node
