FROM n8nio/n8n:latest

RUN apk update && apk add --no-cache ffmpeg python3 py3-pip

RUN npm install moment lodash axios pyodide
