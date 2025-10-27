# Documentation Editing Workflow Guide

## Your Complete Setup (Simple & Future-Proof)

### What You Have Now
✅ GitHub repository with auto-import from WordPress  
✅ MkDocs Material theme with clean navigation  
✅ Auto-commit of generated Markdown files  
✅ Live documentation at: https://modbus-monitor.github.io/docs/  

### Daily Editing Workflow

#### Option 1: WSL Environment (Recommended for Linux tools)
1. **Open WSL terminal** (Ubuntu/Debian)
2. **Navigate to your docs folder**:
   ```bash
   cd /mnt/c/path/to/your/docs
   ```
3. **Run the start script**:
   ```bash
   ./start-docs.sh
   ```
4. This automatically:
   - Installs MkDocs if needed
   - Starts live preview server
   - Opens Windows browser and VS Code
   - Keeps server running in WSL

#### Option 2: Windows PowerShell (Hybrid approach)
1. **Open PowerShell** in your docs folder
2. **Run**:
   ```powershell
   .\start-docs.ps1
   ```
3. This automatically:
   - Uses WSL for MkDocs server
   - Opens Windows VS Code and browser
   - Manages WSL processes from Windows

#### Option 3: Manual WSL Start
1. Open WSL terminal
2. Navigate to docs: `cd /mnt/c/path/to/your/docs`
3. Run: `mkdocs serve --dev-addr=0.0.0.0:8000`
4. Open Windows browser: http://localhost:8000
5. Open VS Code: `code.exe .`

#### Option 4: Pure Windows (if WSL not preferred)
1. Open PowerShell in docs folder
2. Run: `mkdocs serve` (requires Python installed on Windows)
3. Open browser: http://localhost:8000
4. Open VS Code: `code .`

## File Structure You're Working With

```
docs/
├── mkdocs.yml              # Configuration
├── start-docs.sh           # WSL launcher script
├── start-docs.ps1          # PowerShell launcher (WSL hybrid)
├── start-docs.bat          # Windows-only launcher (legacy)
├── VS-CODE-SETUP.md        # Setup instructions
├── WORKFLOW-GUIDE.md       # This guide
├── docs/
│   ├── index.md           # Homepage
│   └── imported/          # Auto-generated from WordPress
│       ├── xpf-help.md
│       ├── advanced-help.md
│       ├── mapper-help.md
│       └── android-help.md
└── .github/
    └── workflows/
        └── deploy.yml     # Auto-build & import system
```

## Editing Tips

### 1. **Edit Imported Files Safely**
The files in `docs/imported/` are auto-generated from WordPress.
- ✅ You can edit them locally for testing
- ⚠️ Changes will be overwritten on next WordPress import
- 💡 For permanent changes: edit in WordPress, then re-import

### 2. **Add New Documentation**
For new manuals not imported from WordPress:
```
docs/
├── products/
│   ├── xpf/
│   │   ├── index.md
│   │   ├── installation.md
│   │   └── user-guide.md
│   └── advanced/
│       ├── index.md
│       └── setup.md
```

### 3. **Navigation Updates**
Edit `mkdocs.yml` to add new pages to the sidebar:
```yaml
nav:
  - Home: index.md
  - Imported (from WordPress):
      - XPF Help: imported/xpf-help.md
  - Product Manuals:
      - XPF User Guide: products/xpf/user-guide.md
```

## Git Workflow (VS Code Built-in)

### Commit Your Changes
1. **Stage files**: Click the `+` next to changed files in Source Control panel
2. **Write commit message**: "Updated XPF installation guide"
3. **Commit**: Click ✓ checkmark
4. **Push**: Click sync button (↑↓)

### Or Use Terminal
```bash
git add .
git commit -m "Updated documentation"
git push origin main
```

## Publishing Workflow

1. **Edit locally** with live preview
2. **Test thoroughly** at http://localhost:8000
3. **Commit & push** to GitHub
4. **GitHub Actions automatically**:
   - Re-imports from WordPress
   - Builds MkDocs site
   - Deploys to GitHub Pages
5. **Live site updates** at https://modbus-monitor.github.io/docs/

## WSL-Specific Setup

### First Time Setup in WSL
```bash
# Update WSL package manager
sudo apt update

# Install Python and pip
sudo apt install python3 python3-pip

# Install MkDocs and plugins
pip3 install mkdocs mkdocs-material mkdocs-include-markdown-plugin mkdocs-awesome-pages-plugin mkdocs-autorefs mkdocs-redirects

# Make the start script executable
chmod +x start-docs.sh
```

### WSL Path Notes
- Your Windows docs folder is accessible in WSL at:
  ```
  /mnt/c/path/to/your/docs
  ```
- Always use forward slashes in WSL paths
- VS Code can be opened from WSL using: `code.exe .`
- Windows browser can be opened from WSL using PowerShell commands

## Troubleshooting

### Live Preview Not Working?

**In WSL:**
```bash
# Check if MkDocs is installed
mkdocs --version

# If not installed:
pip3 install mkdocs mkdocs-material

# Restart server with specific address
mkdocs serve --dev-addr=0.0.0.0:8000
```

**In Windows:**
```powershell
# Check if MkDocs is installed
mkdocs --version

# If not installed:
pip install mkdocs mkdocs-material

# Restart server
mkdocs serve --dev-addr=127.0.0.1:8000
```

### VS Code Extensions Not Working?
1. Press `Ctrl+Shift+P`
2. Type "Extensions: Show Recommended Extensions"
3. Install the workspace recommendations

### Port Already in Use?

**In WSL:**
```bash
# Find and kill process using port 8000
sudo netstat -tlnp | grep :8000
sudo kill -9 <PID>

# Or use different port
mkdocs serve --dev-addr=0.0.0.0:8001
```

**In Windows:**
```powershell
# Find and kill process using port 8000
netstat -ano | findstr :8000
taskkill /PID <PID_NUMBER> /F

# Or use different port
mkdocs serve --dev-addr=127.0.0.1:8001
```

### WSL Permission Issues?
```bash
# Fix file permissions in WSL
chmod +x start-docs.sh

# If editing from Windows creates permission issues:
sudo chown -R $USER:$USER .
```

## Next Steps

Once comfortable with editing:
1. **Custom domain setup**: docs.quantumbitsolutions.com
2. **WordPress integration**: Remove iframe, use reverse proxy
3. **Search integration**: WordPress search → MkDocs content
4. **Legacy redirects**: modbusmonitor.com → new docs

**Your documentation system is now professional-grade and completely future-proof!** 🚀