FROM n8nio/n8n:14-buster

# Cài ffmpeg, python3, pip và dọn dẹp
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cài npm packages bạn cần
RUN npm install moment lodash axios pyodide
