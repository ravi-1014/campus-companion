CAMPUS COMPANION - FRESH SETUP

1. Extract this folder.
2. Open the extracted folder in VS Code.
3. Open Terminal in the project folder.
4. Run:
   flutter create .
5. Run:
   flutter pub get
6. Install FlutterFire CLI if needed:
   dart pub global activate flutterfire_cli
7. Create a Firebase project named Campus Companion.
8. In Firebase Console enable Authentication > Email/Password.
9. Create Firestore Database.
10. Run:
    flutterfire configure
    Select the Campus Companion project and Android.
    This generates lib/firebase_options.dart.
11. Do NOT invent or manually write firebase_options.dart.
12. Check that firebase_options.dart exists in lib.
13. Run:
    flutter analyze
14. Connect Android phone with USB debugging and run:
    flutter devices
15. Run on phone:
    flutter run -d <DEVICE_ID>
16. For an installable APK:
    flutter build apk --release
    APK: build/app/outputs/flutter-apk/app-release.apk

Firebase Firestore rules are in firestore/firestore.rules. After testing, publish those rules in Firebase Console.

IMPORTANT: google-services.json is generated/downloaded from YOUR Firebase project if your FlutterFire setup asks for it. Never use someone else's Firebase config.
