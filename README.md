# Flutter 项目分离

```
0.clean build 
    flutter clean
1.Build release AOT
    flutter build aot --release --preview-dart-2 --output-dir=build/flutteroutput/aot

2.Build release Bundle
    flutter build bundle --precompiled --preview-dart-2 --asset-dir=build/flutteroutput/flutter_assets
        
3.Copy flutter jar
     mkdir -p android/packflutter/flutter/flutter/android-arm-release && cp ~/Desktop/tools/flutter/bin/cache/artifacts/engine/android-arm-release/flutter.jar "$_"

4.Copy flutter asset
    mkdir -p android/packflutter/flutter/assets/release && cp -r build/flutteroutput/aot/* "$_"
    mkdir -p android/packflutter/flutter/assets/release/flutter_assets && cp -r build/flutteroutput/flutter_assets/* "$_"
```