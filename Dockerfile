FROM n8nio/n8n:latest

# 設定基本環境變數
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=8080
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production

# 啟用基本認證（安全性）
ENV N8N_BASIC_AUTH_ACTIVE=true

# 創建必要目錄
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n
USER node

# 開放端口
EXPOSE 8080

# 啟動命令
CMD ["n8n", "start"]
