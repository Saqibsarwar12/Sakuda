# 📱 How to Download & Install APK from GitHub Actions (Phone Guide)

## ✅ Section 1: GitHub Actions Workflow

**File created**: `.github/workflows/build-apk.yml`

This workflow automatically:
- Triggers on push to main/master branch
- Can be manually triggered from GitHub UI
- Builds release APK using Flutter stable
- Uploads APK as downloadable artifact for 30 days

---

## 📥 Section 2: How to Download APK on Your Phone

### Step-by-Step Instructions:

#### Option A: Automatic Build (Push to GitHub)

1. **Push your code to GitHub**:
   ```bash
   cd /workspaces/Sakuda/flutter_chat_app
   git add .
   git commit -m "Add GitHub Actions build workflow"
   git push origin main
   ```

2. **On your phone, open GitHub**:
   - Go to your repository
   - Tap **Actions** tab
   - Find the latest workflow run (green checkmark = success)

3. **Download APK**:
   - Tap on the successful workflow run
   - Scroll down to **Artifacts** section
   - Tap **android-apk** to download
   - The ZIP will download to your phone

4. **Extract & Install**:
   - Use file manager to unzip the downloaded file
   - Find `app-release.apk` inside
   - Tap to install
   - Enable "Install from Unknown Sources" if prompted

#### Option B: Manual Trigger (Best for Phone Users)

1. **On your phone in GitHub**:
   - Go to repository → **Actions** tab
   - Click **Build Android APK** workflow
   - Tap **Run workflow** button
   - Select branch (main/master)
   - Tap green **Run workflow** button

2. **Wait for build** (usually 3-5 minutes)
   - Refresh the page
   - Green checkmark = success ✅
   - Red X = failed ❌

3. **Download APK** (same as Option A, step 3-4)

---

## 📂 Section 3: APK Output Details

### Exact APK Paths:

**Primary APK**:
```
build/app/outputs/flutter-apk/app-release.apk
```

**Timestamped APK** (for tracking builds):
```
build/app/outputs/flutter-apk/chat-app-YYYYMMDD_HHMMSS.apk
```

### Artifact Structure:
```
android-apk.zip
├── app-release.apk          ← Install this one
└── chat-app-20260105_143022.apk
```

**File size**: ~20-50 MB (varies based on dependencies)

---

## 🔧 Section 4: Common Failures & Fixes

### ❌ Build Failed: "Flutter SDK not found"
**Fix**: Already handled in workflow (uses `subosito/flutter-action`)

### ❌ Build Failed: "Gradle error"
**Fix**: Add to `android/gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx4096m
android.useAndroidX=true
android.enableJetifier=true
```
*(Already included in your project)*

### ❌ Build Failed: "Java version mismatch"
**Fix**: Workflow uses Java 17 (compatible with Flutter 3.x)
- If issues persist, change `java-version: '17'` to `'11'`

### ❌ "Artifact not found"
**Cause**: Build failed before APK creation
**Fix**: 
- Check workflow logs in GitHub Actions
- Look for red X marks to see where it failed

### ❌ "Can't install APK on phone"
**Fix**:
1. Go to **Settings → Security**
2. Enable **Install Unknown Apps** for your browser/file manager
3. Try installing again

### ❌ Workflow doesn't trigger automatically
**Fix**:
- Check branch name matches (main vs master)
- Update workflow file if needed:
  ```yaml
  branches: [ main ]  # or [ master ]
  ```

### ❌ "Permission denied" when installing
**Fix**:
- Your phone blocked installation
- Go to Settings → Security → Unknown Sources
- Enable for the app you're using to install

---

## 🚀 Quick Command Reference

### Push code and trigger build:
```bash
cd /workspaces/Sakuda/flutter_chat_app
git add .
git commit -m "Trigger APK build"
git push
```

### Check workflow status:
```bash
gh run list  # If GitHub CLI is installed
```

### Download artifact via CLI (if on desktop later):
```bash
gh run download
```

---

## 📱 Phone-Friendly Tips

1. **Use GitHub Mobile App**: Easier to navigate Actions and download artifacts
2. **Bookmark the Actions page**: Quick access to builds
3. **Enable notifications**: Get notified when builds complete
4. **Use Chrome/Firefox**: Better download handling than some browsers
5. **File manager apps**: ES File Explorer, Files by Google work well for unzipping

---

## 🎯 Expected Workflow Runtime

- **Checkout & Setup**: ~30 seconds
- **Flutter Installation**: ~1-2 minutes  
- **Dependencies**: ~30 seconds
- **Build APK**: ~2-3 minutes
- **Upload**: ~10 seconds

**Total**: ~4-6 minutes per build

---

## ✅ Success Indicators

When everything works:
- ✅ Green checkmark on workflow run
- ✅ "Build Flutter APK" shows as completed
- ✅ Artifacts section shows "android-apk"
- ✅ APK downloads as ~20-50 MB file
- ✅ Installs on phone without errors

---

## 🔐 Security Note

The APK is signed with Flutter's debug keystore (safe for personal use).

For Google Play Store release, you'll need to:
1. Create a keystore
2. Add signing config to `android/app/build.gradle`
3. Add secrets to GitHub repository settings

---

## 📞 Need Help?

Check workflow logs:
1. GitHub → Actions → Click on workflow run
2. Click on "Build Flutter APK" job
3. Expand any red step to see error details
4. Copy error message for troubleshooting
