@echo off
setlocal enabledelayedexpansion

REM Documentation Version Update Script for Windows
REM Use this script when you make significant content changes that warrant a version bump

echo 📋 Current Documentation Version Info
echo ====================================

REM Check if version file exists
if not exist "docs\_version.yml" (
    echo ❌ Version file not found!
    pause
    exit /b 1
)

REM Read current version (simplified)
for /f "tokens=2 delims=:" %%a in ('findstr /c:"version:" docs\_version.yml') do (
    set current_version=%%a
    set current_version=!current_version: =!
    set current_version=!current_version:"=!
)

for /f "tokens=2 delims=:" %%a in ('findstr /c:"release_date:" docs\_version.yml') do (
    set release_date=%%a
    set release_date=!release_date: =!
    set release_date=!release_date:"=!
)

echo Current Version: !current_version!
echo Release Date: !release_date!

echo.
echo 📝 Version Update Options
echo ========================
echo 1) Patch version (e.g., 1.0.0 → 1.0.1) - Bug fixes, minor corrections
echo 2) Minor version (e.g., 1.0.1 → 1.1.0) - New content, features  
echo 3) Major version (e.g., 1.1.0 → 2.0.0) - Major restructure, breaking changes
echo 4) Custom version
echo 5) Cancel
echo.

set /p choice="Choose an option (1-5): "

if "%choice%"=="1" (
    REM For simplicity, ask user to enter new patch version
    set /p new_version="Enter new patch version (e.g., 1.0.1): "
) else if "%choice%"=="2" (
    set /p new_version="Enter new minor version (e.g., 1.1.0): "
) else if "%choice%"=="3" (
    set /p new_version="Enter new major version (e.g., 2.0.0): "
) else if "%choice%"=="4" (
    set /p new_version="Enter new version number (e.g., 2.1.0): "
) else if "%choice%"=="5" (
    echo ❌ Cancelled
    pause
    exit /b 0
) else (
    echo ❌ Invalid option
    pause
    exit /b 1
)

REM Get today's date (YYYY-MM-DD format)
for /f %%i in ('powershell -Command "Get-Date -Format 'yyyy-MM-dd'"') do set new_date=%%i

echo.
echo 📋 Version Update Summary
echo ========================
echo Current: !current_version! → New: !new_version!
echo Release Date: !new_date!
echo.

set /p changes="Describe the changes for this version: "

echo.
set /p confirm="Continue with version update? (y/N): "

if /i "!confirm!"=="y" (
    REM Update version file using PowerShell for reliable text replacement
    powershell -Command "(Get-Content 'docs\_version.yml') -replace 'version: .*', 'version: \"!new_version!\"' | Set-Content 'docs\_version.yml'"
    powershell -Command "(Get-Content 'docs\_version.yml') -replace 'release_date: .*', 'release_date: \"!new_date!\"' | Set-Content 'docs\_version.yml'"
    powershell -Command "(Get-Content 'docs\_version.yml') -replace 'build_date: .*', 'build_date: \"!new_date!\"' | Set-Content 'docs\_version.yml'"
    
    REM Update the main page with new version info
    powershell -Command "(Get-Content 'docs\index.md') -replace 'Version [0-9.]*', 'Version !new_version!' | Set-Content 'docs\index.md'"
    
    REM Get formatted date for display
    for /f %%i in ('powershell -Command "Get-Date -Format 'MMMM dd, yyyy'"') do set formatted_date=%%i
    powershell -Command "(Get-Content 'docs\index.md') -replace 'Last Updated: [A-Za-z0-9, ]*', 'Last Updated: !formatted_date!' | Set-Content 'docs\index.md'"
    
    echo ✅ Version updated successfully!
    echo 📝 Files updated:
    echo    - docs\_version.yml
    echo    - docs\index.md
    echo.
    echo 🚀 Don't forget to commit and push your changes:
    echo    git add docs\_version.yml docs\index.md
    echo    git commit -m "📌 Release version !new_version!: !changes!"
    echo    git push origin main
) else (
    echo ❌ Version update cancelled
)

echo.
pause