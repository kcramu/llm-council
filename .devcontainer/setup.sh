#!/bin/bash

echo "🚀 Setting up LLM Council development environment..."

# Install uv (Python package manager)
echo "📦 Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.cargo/bin:$PATH"

# Install Python dependencies
echo "📦 Installing Python dependencies..."
uv sync

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd frontend
npm install
cd ..

# Create .env.example if it doesn't exist
if [ ! -f .env.example ]; then
  echo "📝 Creating .env.example..."
  cat > .env.example << 'EOL'
# OpenRouter API Key
# Get your API key at https://openrouter.ai/
OPENROUTER_API_KEY=sk-or-v1-...
EOL
fi

# Remind user to create .env file
echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Create a .env file with your OpenRouter API key:"
echo "      cp .env.example .env"
echo "      # Then edit .env and add your actual API key"
echo ""
echo "   2. Start the application:"
echo "      ./start.sh"
echo ""
echo "   Or run manually in separate terminals:"
echo "      Terminal 1: uv run python -m backend.main"
echo "      Terminal 2: cd frontend && npm run dev"
echo ""
echo "🌐 The app will be available at:"
echo "   Backend:  http://localhost:8001"
echo "   Frontend: http://localhost:5173"
