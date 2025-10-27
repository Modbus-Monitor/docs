# Modbus Monitor — Documentation

This repository hosts the documentation for all Modbus Monitor products:
- Modbus Monitor XPF
- Modbus Monitor Advanced  
- Modbus Monitor Android (Free)
- Modbus Monitor Mapper Pro

Built with **MkDocs Material**. Each product has its own section and comprehensive documentation.

## 🌐 Live Documentation

**View the documentation**: https://modbus-monitor.github.io/docs/

## 🚀 Local Development Setup

### Prerequisites
- **Windows**: WSL2 with Ubuntu 22.04+ (recommended) or Python 3.8+
- **macOS/Linux**: Python 3.8+
- **Git**: For cloning the repository

### Quick Start

1. **Clone the repository**:
   ```bash
   git clone https://github.com/modbus-monitor/docs.git
   cd docs
   ```

2. **Option A: Automated Setup (WSL/Linux)**
   ```bash
   # Make script executable and run
   chmod +x start-docs.sh
   ./start-docs.sh
   ```

3. **Option B: Manual Setup**
   ```bash
   # Install MkDocs and plugins
   pip3 install mkdocs mkdocs-material mkdocs-awesome-pages-plugin mkdocs-redirects mkdocs-minify-plugin
   
   # Start development server
   mkdocs serve
   ```

4. **Open your browser**: http://localhost:8000

### 📝 Editing Documentation

1. Edit any `.md` file in the `docs/` directory
2. Changes appear instantly in your browser
3. Commit and push changes to deploy to GitHub Pages

### 📂 Structure

```
docs/
├── docs/                     # Documentation source files
│   ├── index.md             # Homepage
│   └── imported/            # Auto-imported WordPress content
├── mkdocs.yml               # MkDocs configuration
├── start-docs.sh            # One-click setup script
└── .github/workflows/       # Automated deployment
```

### 🔄 WordPress Integration

Documentation is automatically imported from WordPress and converted to Markdown via GitHub Actions. The imported content appears in `docs/imported/` and is rebuilt nightly.

### 📋 Version Management

The documentation uses semantic versioning (`MAJOR.MINOR.PATCH`) for tracking significant content changes:

- **Patch** (1.0.0 → 1.0.1): Bug fixes, typos, minor corrections
- **Minor** (1.0.1 → 1.1.0): New content, features, sections  
- **Major** (1.1.0 → 2.0.0): Major restructure, breaking changes

**Updating Version:**
```bash
# Linux/WSL
./update-version.sh

# Windows
update-version.bat
```

**Note:** The build date updates automatically with each deployment, but the version number should only be updated when actual content changes occur.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test locally with `mkdocs serve`
5. If significant changes: Run `update-version.sh` or `update-version.bat`
6. Submit a pull request

## 📄 License

This documentation is available under the MIT License.
