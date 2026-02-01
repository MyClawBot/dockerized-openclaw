FROM node:22-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    bash \
    jq \
    ffmpeg \
    openssl \
    tmux \
    python3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Skip local LLM build (using OpenRouter API)
ENV NODE_LLAMA_CPP_SKIP_DOWNLOAD=true
ENV NODE_LLAMA_CPP_SKIP_BUILD=true

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Create OpenClaw directories
RUN mkdir -p /root/.openclaw/data /root/.openclaw/workspace /root/.openclaw/canvas

# Copy configuration
COPY config/openclaw.json /root/.openclaw/openclaw.json

EXPOSE 18789

# Start gateway with LAN binding for external access
CMD ["openclaw", "gateway", "--bind", "lan"]