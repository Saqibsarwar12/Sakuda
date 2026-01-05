#!/bin/bash

# Quick setup script for GitHub Actions APK build
# Run this from Codespaces to prepare your repository

echo "🚀 Setting up Flutter app for GitHub Actions build..."
echo ""

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: pubspec.yaml not found. Are you in the flutter_chat_app directory?"
    exit 1
fi

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo "📦 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit: Flutter WebView chat app"
else
    echo "✅ Git repository already initialized"
fi

# Check if GitHub workflow exists
if [ -f ".github/workflows/build-apk.yml" ]; then
    echo "✅ GitHub Actions workflow found"
else
    echo "❌ Warning: GitHub Actions workflow not found at .github/workflows/build-apk.yml"
fi

echo ""
echo "📋 Next steps:"
echo "1. Create a new repository on GitHub (on your phone or web)"
echo "2. Run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Go to GitHub → Actions tab"
echo "4. Download the APK artifact after build completes"
echo ""
echo "✅ Setup complete!"
