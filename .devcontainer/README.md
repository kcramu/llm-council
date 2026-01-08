# Devcontainer Configuration for LLM Council

This directory contains the configuration for running LLM Council in GitHub Codespaces or a local VS Code devcontainer.

## What's Included

- **Python 3.10** - Base Python environment
- **Node.js LTS** - For the React frontend
- **uv** - Python package manager (installed via setup script)
- **Git** - Version control
- **VS Code Extensions**:
  - Python language support
  - ESLint for JavaScript linting
  - Prettier for code formatting
  - React snippets

## How It Works

1. When a Codespace is created, the container is built from the official Python 3.10 image
2. Node.js LTS and Git features are installed automatically
3. The `setup.sh` script runs automatically to:
   - Install the `uv` package manager
   - Install Python dependencies with `uv sync`
   - Install frontend dependencies with `npm install`
   - Create a `.env.example` file for reference

## Port Forwarding

The devcontainer automatically forwards these ports:

- **8001** - Backend FastAPI server
- **5173** - Frontend Vite dev server (auto-opens in browser)

## Environment Setup

After the container is created, you need to:

1. Create a `.env` file with your OpenRouter API key:
   ```bash
   cp .env.example .env
   # Edit .env and add your actual key
   ```

2. Start the application:
   ```bash
   ./start.sh
   ```

## Customization

To modify the devcontainer:

- Edit `devcontainer.json` to change VS Code settings or add extensions
- Edit `setup.sh` to change the post-create setup process
- The container uses the official Microsoft Python devcontainer image as a base

## Troubleshooting

If dependencies aren't installed:
```bash
bash .devcontainer/setup.sh
```

If the Python environment isn't activated:
```bash
export PATH="$HOME/.cargo/bin:$PATH"
source .venv/bin/activate  # If using venv
```
