FROM n8nio/n8n:latest

# Chuyển sang user root để cài đặt
USER root

RUN apk update && apk add --no-cache ffmpeg python3 py3-pip

# Cài npm packages
RUN npm install moment lodash axios pyodide

# Chuyển lại user n8n để chạy an toàn
USER node
