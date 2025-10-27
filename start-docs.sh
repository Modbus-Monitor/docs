#!/bin/bash

# WSL Documentation Editor Launcher
# Run this script from your docs repository root in WSL

clear
echo "🚀 Starting MkDocs Documentation Editor (WSL)..."
echo

# Check if we're in the right directory
if [ ! -f "mkdocs.yml" ]; then
    echo "❌ ERROR: mkdocs.yml not found!"
    echo "Please run this script from your docs repository root."
    echo "Example: cd ~/docs && ./start-docs.sh"
    exit 1
fi

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ ERROR: Python 3 is not installed"
    echo "Installing Python 3 and pip..."
    sudo apt update
    sudo apt install python3 python3-pip -y
fi

# Check if pip3 is installed
if ! command -v pip3 &> /dev/null; then
    echo "❌ ERROR: pip3 is not installed"
    echo "Installing pip3..."
    sudo apt install python3-pip -y
fi

# Check if MkDocs is installed
if ! command -v mkdocs &> /dev/null; then
    echo "📦 Installing MkDocs and required plugins..."
    pip3 install mkdocs mkdocs-material mkdocs-include-markdown-plugin mkdocs-awesome-pages-plugin mkdocs-autorefs mkdocs-redirects
    
    # Add local pip bin to PATH if mkdocs still not found
    if ! command -v mkdocs &> /dev/null; then
        echo "Adding local pip bin to PATH..."
        export PATH="$HOME/.local/bin:$PATH"
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    fi
fi

# Start MkDocs server in background
echo "✅ Starting MkDocs live server..."
mkdocs serve --dev-addr=0.0.0.0:8000 &
MKDOCS_PID=$!

# Wait for server to start
echo "⏳ Waiting for server to start..."
sleep 3

# Check if server started successfully
if ps -p $MKDOCS_PID > /dev/null; then
    echo "✅ MkDocs server started successfully (PID: $MKDOCS_PID)"
else
    echo "❌ Failed to start MkDocs server"
    exit 1
fi

# Open browser (this will open in Windows, not WSL)
echo "🌐 Opening documentation in browser..."
# Use wsl command to open Windows browser from WSL
powershell.exe -Command "Start-Process 'http://localhost:8000'"

# Open VS Code (this will open Windows VS Code)
echo "📝 Opening VS Code..."
# Use the Windows VS Code from WSL
code.exe .

echo
echo "========================================="
echo "📚 Documentation Editor Ready!"
echo "========================================="
echo
echo "• VS Code is now open with your docs"
echo "• Live preview: http://localhost:8000"
echo "• Edit any .md file and save to see changes"
echo "• To stop the server: kill $MKDOCS_PID"
echo "• Or press Ctrl+C if running in foreground"
echo
echo "💡 Tip: Keep this terminal open while editing"
echo

# Function to cleanup on exit
cleanup() {
    echo
    echo "🛑 Stopping MkDocs server..."
    kill $MKDOCS_PID 2>/dev/null
    echo "✅ Cleanup complete"
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Keep script running and show server status
echo "🔄 MkDocs server is running. Press Ctrl+C to stop."
echo "📊 Server logs:"
echo "----------------------------------------"

# Follow the mkdocs process
wait $MKDOCS_PID