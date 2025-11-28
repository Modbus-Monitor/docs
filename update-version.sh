#!/bin/bash

# Documentation Version Update Script
# Use this script when you make significant content changes that warrant a version bump

set -e

echo "📋 Current Documentation Version Info"
echo "===================================="

# Read current version info
if [ -f "docs/_version.yml" ]; then
    current_version=$(grep "version:" docs/_version.yml | head -1 | sed 's/version: *"*\([^"]*\)"*/\1/')
    release_date=$(grep "release_date:" docs/_version.yml | head -1 | sed 's/release_date: *"*\([^"]*\)"*/\1/')
    echo "Current Version: $current_version"
    echo "Release Date: $release_date"
else
    echo "❌ Version file not found!"
    exit 1
fi

echo
echo "📝 Version Update Options"
echo "========================"
echo "1) Patch version (e.g., 1.0.0 → 1.0.1) - Bug fixes, minor corrections"
echo "2) Minor version (e.g., 1.0.1 → 1.1.0) - New content, features"  
echo "3) Major version (e.g., 1.1.0 → 2.0.0) - Major restructure, breaking changes"
echo "4) Custom version"
echo "5) Cancel"
echo

read -p "Choose an option (1-5): " choice

case $choice in
    1)
        # Patch version
        new_version=$(echo $current_version | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')
        ;;
    2)
        # Minor version  
        new_version=$(echo $current_version | awk -F. '{$(NF-1) = $(NF-1) + 1; $NF = 0} 1' | sed 's/ /./g')
        ;;
    3)
        # Major version
        new_version=$(echo $current_version | awk -F. '{$1 = $1 + 1; $2 = 0; $3 = 0} 1' | sed 's/ /./g')
        ;;
    4)
        # Custom version
        read -p "Enter new version number (e.g., 2.1.0): " new_version
        ;;
    5)
        echo "❌ Cancelled"
        exit 0
        ;;
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac

# Get today's date
new_date=$(date +'%Y-%m-%d')

echo
echo "📋 Version Update Summary"
echo "========================"
echo "Current: $current_version → New: $new_version"
echo "Release Date: $new_date"
echo

read -p "Describe the changes for this version: " changes

echo
read -p "Continue with version update? (y/N): " confirm

if [[ $confirm =~ ^[Yy]$ ]]; then
    # Update version file
    sed -i "s/version: .*/version: \"$new_version\"/" docs/_version.yml
    sed -i "s/release_date: .*/release_date: \"$new_date\"/" docs/_version.yml
    sed -i "s/build_date: .*/build_date: \"$new_date\"/" docs/_version.yml
    
    # Add to changelog
    temp_file=$(mktemp)
    {
        grep -B 100 "changelog:" docs/_version.yml
        echo "  - version: \"$new_version\""
        echo "    date: \"$new_date\""
        echo "    changes:"
        echo "      - \"$changes\""
        grep -A 100 "changelog:" docs/_version.yml | tail -n +2
    } > "$temp_file"
    mv "$temp_file" docs/_version.yml
    
    # Update the main page with new version info
    sed -i "s/Version [0-9.]*/Version $new_version/" docs/index.md
    sed -i "s/Last Updated: [A-Za-z0-9, ]*/Last Updated: $(date +'%B %d, %Y')/" docs/index.md
    
    # Update mkdocs.yml copyright footer
    sed -i "s/Documentation Version [0-9.]*/Documentation Version $new_version/" mkdocs.yml
    sed -i "s/Last Updated: [A-Za-z0-9, ]*/Last Updated: $(date +'%B %d, %Y')/" mkdocs.yml
    
    echo "✅ Version updated successfully!"
    echo "📝 Files updated:"
    echo "   - docs/_version.yml"
    echo "   - docs/index.md"
    echo "   - mkdocs.yml"
    echo
    echo "🚀 Don't forget to commit and push your changes:"
    echo "   git add docs/_version.yml docs/index.md mkdocs.yml"
    echo "   git commit -m \"📌 Release version $new_version: $changes\""
    echo "   git push origin main"
else
    echo "❌ Version update cancelled"
fi