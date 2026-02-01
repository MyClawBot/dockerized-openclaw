# Dockerized OpenClaw

Ready-to-deploy OpenClaw Docker setup with preinstalled Linux-compatible skills.

## Features

- OpenClaw with Gemini 2.5 Flash (via OpenRouter)
- 9 preinstalled skills (API-free, Linux-compatible)
- Single-container deployment with Docker Compose
- Persistent data via Docker volumes
- Health check enabled

## Preinstalled Skills

| Category | Skills |
|----------|--------|
| **Utilities** | weather, jq, tldr, shorten, xkcd |
| **Dev Tools** | github |
| **Productivity** | notebook, todo-tracker |
| **Data** | domaindetails |

## Quick Start

```bash
# Clone repo
git clone https://github.com/MyClawBot/dockerized-openclaw.git
cd dockerized-openclaw

# Configure
cp .env.example .env
# Edit .env and add your OPENROUTER_API_KEY and GATEWAY_TOKEN

# Run
docker-compose up -d
```

## Configuration

### Environment Variables

| Variable | Description |
|----------|-------------|
| `OPENROUTER_API_KEY` | Your OpenRouter API key ([get one here](https://openrouter.ai/keys)) |
| `GATEWAY_TOKEN` | Token for API/remote access (generate with `openssl rand -hex 32`) |
| `PORT` | External port (default: `18789`) |

### Change Model

Edit `config/openclaw.json`:

```json
{
  "agents": {
    "defaults": {
      "model": {
        "primary": "openrouter/anthropic/claude-sonnet-4"
      }
    }
  }
}
```

### Enable/Disable Skills

Edit `config/openclaw.json` under `skills.entries`:

```json
{
  "skills": {
    "entries": {
      "skill-name": { "enabled": true }
    }
  }
}
```

## System Requirements

- **Minimum**: 1 vCPU, 1GB RAM
- **Recommended**: 2 vCPU, 2GB RAM

## License

MIT
