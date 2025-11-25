# VS Code Setup Guide for Documentation Editing

## 1. Install VS Code
Download from: https://code.visualstudio.com/download

## 2. Essential Extensions
Open VS Code and press `Ctrl+Shift+X` to open Extensions, then search and install:

### Required Extensions:
1. **Markdown All in One** (by Yu Zhang)
   - Auto-completion, TOC generation, keyboard shortcuts
   
2. **Markdown Preview Enhanced** (by Yiyi Wang)
   - Enhanced preview with better styling
   
3. **Material Icon Theme** (by Philipp Kief)
   - Better file icons for navigation

### Optional but Helpful:
4. **vscode-pdf** (by tomoki1207)
   - View PDFs inside VS Code
   
5. **GitLens** (by GitKraken)
   - Enhanced Git integration

## 3. Recommended Settings
After installing extensions, go to `File > Preferences > Settings` and add:

```json
{
    "markdown.preview.breaks": true,
    "markdown.preview.typographer": true,
    "workbench.iconTheme": "material-icon-theme",
    "editor.wordWrap": "on",
    "editor.minimap.enabled": false,
    "markdown.extension.toc.updateOnSave": true
}
```

## 4. Usage
- Open your docs folder: `File > Open Folder > [your docs repo]`
- Edit `.md` files in the left pane
- View live preview at http://localhost:8000 (after running `start-docs.bat`)
- Press `Ctrl+S` to save and auto-refresh the browser preview

## 5. Keyboard Shortcuts
- `Ctrl+Shift+V` - Toggle Markdown preview
- `Ctrl+K V` - Open Markdown preview to the side
- `Ctrl+B` - Toggle sidebar
- `Ctrl+`` - Toggle terminal