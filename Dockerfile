FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    procps curl git openssl && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g openclaw@latest

EXPOSE 8080

ENV OPENCLAW_GATEWAY_PORT=8080

CMD ["openclaw", "gateway", "--allow-unconfigured"]
