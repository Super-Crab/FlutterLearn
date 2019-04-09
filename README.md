# Flutter 项目分离

### 使用步骤

> 1.运行根目录下的package.sh生成flutter的产物（注意将第7行中 ***~/Desktop/tools/flutter/bin/cache/artifacts/engine/android-arm-release/flutter.jar*** 换成各自电脑flutter tool对应的路径）

> 2.编译***android/packflutter***生成aar

> 3.将根目录下的**build/packflutter/outputs/aar** 对应的产物拷贝到**android/aartest** 并重新命名为 **packflutter.aar**（注：此处因为只是做示范这么处理，实际开发过程中，需要放到远程仓库去，这样做到native和flutter相互之间不影响）

> 4.运行aartest即可看到效果

### 基于1.0的打包命令
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