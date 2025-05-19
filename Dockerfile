FROM n8nio/n8n:latest

# Cài ffmpeg, python3 và pip
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cài npm packages cần thiết
RUN npm install moment lodash axios pyodide

# Cài pyodide (nếu cần chạy python trong node Function)
# Lưu ý: pyodide thường chạy trong browser, nên cách này phù hợp để tích hợp python script qua node Function sandbox

# (Nếu bạn có code python hoặc cần cài thêm packages pip, bạn có thể cài ở đây)
