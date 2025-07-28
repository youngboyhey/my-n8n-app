FROM n8nio/n8n:latest

# 設定環境變數
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=8080
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true

# 設定工作目錄和權限
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 755 /home/node/.n8n

# 切換到 node 用戶
USER node
WORKDIR /home/node

# 開放端口
EXPOSE 8080

# 添加健康檢查
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# 啟動命令
CMD ["n8n", "start"]
