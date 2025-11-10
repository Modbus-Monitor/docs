# Documentation Version Management Guide

This document explains how to manage documentation versions and track content changes.

## 📋 Version System Overview

The documentation uses **semantic versioning** to track significant content changes:

- **Version Number**: Only updated when actual user manual content changes
- **Build Date**: Automatically updated with each GitHub Actions deployment
- **Release Date**: Updated when version number changes

## 🔢 Version Format: MAJOR.MINOR.PATCH

### When to Bump Version Numbers

**Patch Version (1.0.0 → 1.0.1)**
- Typo fixes
- Minor corrections
- Link updates
- Small clarifications

**Minor Version (1.0.1 → 1.1.0)**
- New sections or pages
- Additional features documented
- New help content
- Structural improvements

**Major Version (1.1.0 → 2.0.0)**
- Complete documentation restructure
- Breaking changes in navigation
- Major product version changes
- Fundamental changes to user guides

## 🛠️ How to Update Version

### Automated Script (Recommended)

**Linux/WSL:**
```bash
./update-version.sh
```

**Windows:**
```batch
update-version.bat
```

The script will:
1. Show current version information
2. Offer version bump options
3. Prompt for change description
4. Update all relevant files
5. Provide git commands for committing

### Manual Update

If you need to update manually:

1. **Edit `docs/_version.yml`**:
   ```yaml
   version: "1.1.0"
   release_date: "2025-01-20"
   ```

2. **Update main page `docs/index.md`**:
   ```markdown
   **Version 1.1.0** • Last Updated: January 20, 2025
   ```

3. **Update footer in `mkdocs.yml`**:
   ```yaml
   copyright: |
     Documentation Version 1.1.0 • Last Updated: January 20, 2025 • 
   ```

## 📅 Automatic Updates

### What Updates Automatically
- **Build Date**: Updated by GitHub Actions on every deployment
- **Documentation Content**: Static content updated manually
- **Site Deployment**: Happens on every push to main branch

### What Requires Manual Update
- **Version Number**: Only when content significantly changes
- **Release Date**: When version number is bumped
- **Changelog**: Document what changed in each version

## 📝 Best Practices

### Version Update Workflow
1. Make your content changes
2. Test locally with `mkdocs serve`
3. If changes are significant, run version update script
4. Commit and push changes
5. Verify deployment at https://modbus-monitor.github.io/modbus-monitor-docs/

### Change Documentation
Always document what changed:
- Keep changelog in `docs/_version.yml`
- Use descriptive commit messages
- Note breaking changes clearly

### Communication
- Minor updates: No announcement needed
- Major updates: Consider notifying users
- Breaking changes: Provide migration guide

## 🔍 Version Information Display

Users can see version information in:
- **Homepage banner**: Current version and last update
- **Footer**: Version and GitHub link on every page
- **Version file**: Complete changelog in `docs/_version.yml`

## 🚀 Examples

### Typical Version History
```yaml
changelog:
  - version: "1.2.0"
    date: "2025-02-15"
    changes:
      - "Added Android app documentation"
      - "Improved XPF setup guide"
  
  - version: "1.1.1" 
    date: "2025-01-25"
    changes:
      - "Fixed broken links in mapper help"
      - "Corrected typos in advanced guide"
      
  - version: "1.1.0"
    date: "2025-01-20"
    changes:
      - "New troubleshooting section"
      - "Added FAQ page"
```

### Sample Commit Messages
```bash
# Version updates
git commit -m "📌 Release version 1.1.0: Add troubleshooting and FAQ sections"

# Content updates without version change
git commit -m "📝 Fix typos in XPF help documentation"

# WordPress sync (automatic)
git commit -m "Auto-update imported Markdown files (2025-01-15 10:30 UTC)"
```

This system ensures that users always know when documentation was last significantly updated while maintaining automatic synchronization with WordPress content.