# Windows PowerShell script that launches WSL documentation environment
# Run this from PowerShell in your docs folder

Write-Host "🚀 Starting MkDocs Documentation Editor (Windows + WSL)..." -ForegroundColor Green
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "mkdocs.yml")) {
    Write-Host "❌ ERROR: mkdocs.yml not found!" -ForegroundColor Red
    Write-Host "Please run this script from your docs repository root." -ForegroundColor Yellow
    pause
    exit 1
}

# Check if WSL is installed
try {
    wsl --version | Out-Null
} catch {
    Write-Host "❌ ERROR: WSL is not installed or not accessible" -ForegroundColor Red
    Write-Host "Please install WSL and a Linux distribution first." -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "✅ Checking WSL Python installation..." -ForegroundColor Green

# Check and install Python/MkDocs in WSL if needed
$wslCheck = wsl bash -c "command -v python3 && command -v mkdocs"
if ($LASTEXITCODE -ne 0) {
    Write-Host "📦 Installing Python and MkDocs in WSL..." -ForegroundColor Yellow
    wsl bash -c "sudo apt update && sudo apt install -y python3 python3-pip"
    wsl bash -c "pip3 install mkdocs mkdocs-material mkdocs-include-markdown-plugin mkdocs-awesome-pages-plugin mkdocs-autorefs mkdocs-redirects"
}

Write-Host "✅ Starting MkDocs server in WSL..." -ForegroundColor Green

# Convert Windows path to WSL path
$currentPath = (Get-Location).Path
$wslPath = $currentPath -replace '^([C-Z]):', '/mnt/$1' -replace '\\', '/' | ForEach-Object { $_.ToLower() }

# Start MkDocs in WSL (background process)
$job = Start-Job -ScriptBlock {
    param($wslPath)
    wsl bash -c "cd '$wslPath' && mkdocs serve --dev-addr=0.0.0.0:8000"
} -ArgumentList $wslPath

# Wait for server to start
Start-Sleep 3

Write-Host "🌐 Opening documentation in browser..." -ForegroundColor Green
Start-Process "http://localhost:8000"

Write-Host "📝 Opening VS Code..." -ForegroundColor Green
code .

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "📚 Documentation Editor Ready!" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "• VS Code is now open with your docs" -ForegroundColor White
Write-Host "• Live preview: http://localhost:8000" -ForegroundColor White
Write-Host "• Edit any .md file and save to see changes" -ForegroundColor White
Write-Host "• Press Enter to stop the server and exit" -ForegroundColor Yellow
Write-Host ""

# Wait for user input to stop
Read-Host "Press Enter to stop the MkDocs server"

# Stop the background job
Write-Host "🛑 Stopping MkDocs server..." -ForegroundColor Yellow
Stop-Job $job
Remove-Job $job

Write-Host "✅ Documentation editor stopped successfully!" -ForegroundColor Green