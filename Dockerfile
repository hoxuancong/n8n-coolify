FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache python3 py3-pip ffmpeg openssl ca-certificates nodejs npm

USER node
RUN python3 -m pip install --user --break-system-packages pipx

ENV PATH="/home/node/.local/bin:$PATH"

RUN npm install moment lodash axios

RUN python3 -m pip install --user requests pandas pytube yt-dlp youtube-transcript-api pyodide
