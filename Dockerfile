FROM n8nio/n8n:latest

USER root

RUN apk update && apk add --no-cache \
    python3 py3-pip \
    curl bash git \
    ffmpeg ttf-freefont \
    chromium \
    libnss \
    libstdc++ \
    udev \
    wget \
    nss \
    libc6-compat \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm \
    libxshmfence \
    libxcomposite \
    libxrandr \
    libappindicator3-1 \
    libatspi \
    libxdamage \
    libsecret

# Tạo virtualenv và cài Python package
RUN python3 -m venv /opt/venv
RUN /bin/bash -c "source /opt/venv/bin/activate && pip install --upgrade pip && pip install playwright asyncio"

# Cài trình duyệt Chromium cho Playwright
RUN /bin/bash -c "source /opt/venv/bin/activate && python -m playwright install chromium"

# Cài npm packages
RUN npm install moment lodash axios pyodide

ENV PATH="/opt/venv/bin:$PATH"

USER node
