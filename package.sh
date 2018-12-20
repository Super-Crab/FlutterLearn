#!/usr/bin/env bash
flutter clean
flutter build aot --suppress-analytics --release  --target=lib/main.dart --target-platform=android-arm  --output-dir=build/flutteroutput/aot --target-platform=android-arm --release
flutter build bundle --suppress-analytics --target=lib/main.dart --target-platform=android-arm --precompiled  --asset-dir=build/flutteroutput/flutter_assets --release
rm -rf android/packflutter/flutter/
mkdir android/packflutter/flutter
mkdir -p android/packflutter/flutter/flutter/android-arm-release && cp ~/Desktop/tools/flutter/bin/cache/artifacts/engine/android-arm-release/flutter.jar "$_"
mkdir -p android/packflutter/flutter/assets/release && cp -r build/flutteroutput/aot/* "$_"
mkdir -p android/packflutter/flutter/assets/release/flutter_assets && cp -r build/flutteroutput/flutter_assets/* "$_"