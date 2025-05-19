FROM node:18-bullseye-slim

# Cài hệ thống cần thiết
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip curl bash git ffmpeg fonts-freefont-ttf \
    libnss3 libxss1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libgbm1 libxshmfence1 \
    libxcomposite1 libxrandr2 libappindicator3-1 libatspi2.0-0 libxdamage1 libsecret-1-0 \
    udev wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Tạo virtual environment Python
RUN python3 -m venv /opt/venv

# Kích hoạt venv, cập nhật pip và cài Python packages
RUN /bin/bash -c "source /opt/venv/bin/activate && pip install --upgrade pip && pip install playwright asyncio"

# Tải Chromium cho Playwright
RUN /bin/bash -c "source /opt/venv/bin/activate && python -m playwright install chromium"

# Cài n8n
RUN npm install -g n8n

# Cài các thư viện npm cần thiết
RUN npm install moment lodash axios pyodide

ENV PATH="/opt/venv/bin:$PATH"

# Chạy n8n
CMD ["n8n"]

# Expose port
EXPOSE 5678
