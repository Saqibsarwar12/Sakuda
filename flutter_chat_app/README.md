# Flutter Chat App - WebView Android App

A minimal Flutter Android app that loads a website in a WebView with full JavaScript support.

## Features

✅ **WebView-based**: Loads the website at `https://technosaqib.github.io/chat`
✅ **JavaScript Enabled**: Full JavaScript support for interactive content
✅ **Minimal UI**: No unnecessary UI elements, clean presentation
✅ **Android Back Button**: Properly handles back navigation within WebView
✅ **Loading Indicator**: Shows a loading spinner while the page loads
✅ **Latest Flutter**: Built with Flutter 3.x and latest stable packages
✅ **Clean Code**: Follows Flutter best practices and conventions

## Project Structure

```
flutter_chat_app/
├── lib/
│   └── main.dart                          # Main application code
├── android/
│   ├── app/
│   │   ├── build.gradle                   # Android build configuration
│   │   └── src/main/
│   │       ├── AndroidManifest.xml        # App manifest with permissions
│   │       └── kotlin/
│   │           └── com/example/flutter_chat_app/
│   │               └── MainActivity.kt    # Android main activity
│   ├── settings.gradle                    # Gradle settings
│   └── gradle.properties                  # Gradle properties
├── web/
│   └── index.html                         # Web version support
├── pubspec.yaml                           # Flutter dependencies
├── analysis_options.yaml                  # Dart linting rules
└── .gitignore                             # Git ignore patterns
```

## Dependencies

The app uses the following key packages:

- **webview_flutter** (^4.7.0): Official WebView plugin for Flutter
- **webview_flutter_android** (^4.7.0): Android-specific WebView implementation
- **webview_flutter_web** (^4.7.0): Web support for WebView

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or later)
- Android SDK (API Level 21 or higher)
- Gradle
- Internet connection (app requires internet to load the website)

### Installation

1. **Clone or download the project**:
   ```bash
   cd flutter_chat_app
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app on an Android device**:
   ```bash
   flutter run
   ```

### Running on Android Device

**Using physical device**:
```bash
flutter run -v
```

**Using Android emulator**:
```bash
flutter emulators
flutter run -d <emulator_id>
```

## Key Implementation Details

### main.dart

**WebViewController Setup**:
- JavaScript is enabled via `JavaScriptMode.unrestricted`
- Navigation delegate handles page loading states
- Error handling with user-friendly snackbar messages
- Loads the target website URL on initialization

**Loading Indicator**:
- `CircularProgressIndicator` displayed while page loads
- Automatically hidden when page finishes loading
- Shows over the WebView for visibility

**Android Back Button Handling**:
- `WillPopScope` widget manages back navigation
- Checks if WebView can go back using `_webViewController.canGoBack()`
- If history exists: goes back in WebView, stays in app
- If no history: exits the app

### Android Configuration

**AndroidManifest.xml**:
- `android.permission.INTERNET` permission required for internet access
- `android:usesCleartextTraffic="true"` allows mixed content (HTTP/HTTPS)
- Single top launch mode prevents multiple instances

**build.gradle**:
- Targets Android API level 24+
- Kotlin support enabled
- Proper compilation settings

## Important Notes

1. **Internet Required**: The app requires an active internet connection to load the website
2. **No Offline Support**: No caching or offline functionality implemented
3. **Website UI**: No modifications to the original website design
4. **HTTPS Support**: Website loads from GitHub Pages (HTTPS)
5. **JavaScript**: Fully enabled for interactive features

## Testing the App

1. Build and deploy to Android device
2. App opens to the chat website
3. Test interactive features on the website
4. Test back button:
   - Navigate to different pages
   - Press device back button - should go back in browser history
   - When at the first page, back button exits the app
5. Verify loading indicator appears during page navigation

## Building Release APK

```bash
# Build release APK
flutter build apk --release

# Build release App Bundle (for Google Play)
flutter build appbundle --release
```

The APK/bundle will be available in `build/app/outputs/`

## Troubleshooting

**App crashes on startup**:
- Verify internet connection is active
- Check Android API level is 21+
- Run `flutter clean` and try again

**WebView not loading**:
- Verify `android.permission.INTERNET` in manifest
- Check internet connectivity
- Look at `flutter logs` for error messages

**Back button not working**:
- This implementation uses `WillPopScope` which is the recommended approach
- Ensure you're using the latest `webview_flutter` package

**JavaScript features not working**:
- Verify `JavaScriptMode.unrestricted` is set (it is)
- Check browser console in the website for JS errors

## Code Quality

- Follows [Flutter effective Dart](https://dart.dev/guides/language/effective-dart) style guide
- Includes comprehensive comments
- Uses proper state management with StatefulWidget
- Includes error handling and user feedback
- Follows Android best practices

## Future Enhancements (Optional)

If needed in the future:
- Add splash screen with custom branding
- Implement URL filtering/whitelist
- Add pull-to-refresh functionality
- Cache strategy for offline viewing
- Custom error pages
- Analytics integration

## License

Same license as the original website source code.

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review Flutter documentation: https://flutter.dev/docs
3. Check WebView plugin docs: https://pub.dev/packages/webview_flutter
4. Review Android documentation: https://developer.android.com
