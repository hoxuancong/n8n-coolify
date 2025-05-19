FROM n8nio/n8n:latest

# Cài ffmpeg và Python (phiên bản mặc định của repo apt)
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cài thêm các package npm nếu cần
RUN npm install moment lodash axios
