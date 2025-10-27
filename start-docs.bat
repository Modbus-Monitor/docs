@echo off
cls
echo Starting MkDocs Documentation Editor...
echo.

REM Check if we're in the right directory
if not exist "mkdocs.yml" (
    echo ERROR: mkdocs.yml not found!
    echo Please run this script from your docs repository root.
    pause
    exit /b 1
)

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.11+ and try again
    pause
    exit /b 1
)

REM Check if MkDocs is installed
mkdocs --version >nul 2>&1
if errorlevel 1 (
    echo Installing MkDocs and required plugins...
    pip install mkdocs mkdocs-material mkdocs-include-markdown-plugin mkdocs-awesome-pages-plugin mkdocs-autorefs mkdocs-redirects
)

echo ✅ Starting MkDocs live server...
start "MkDocs Server" cmd /c "mkdocs serve & pause"

REM Wait a moment for server to start
timeout /t 3 /nobreak >nul

echo ✅ Opening documentation in browser...
start http://localhost:8000

echo ✅ Opening VS Code...
code .

echo.
echo ========================================
echo 📝 Documentation Editor Ready!
echo ========================================
echo.
echo • VS Code is now open with your docs
echo • Live preview is running at http://localhost:8000
echo • Edit any .md file and save to see changes
echo • Press Ctrl+C in the MkDocs window to stop
echo.
echo Happy documenting! 🚀
pause