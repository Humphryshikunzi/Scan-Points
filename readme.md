# SafiriCar
[![Flutter Responsive](https://img.shields.io/badge/flutter-responsive-brightgreen.svg?style=flat-square)](https://github.com/Codelessly/ResponsiveFramework)

## Safiricar Mobile and Web Project.


### Graphql
#### Generate  QL Code

``
    flutter pub run build_runner watch --delete-conflicting-outputs
    
``
   # build apk file
    https://docs.flutter.dev/deployment/android

    keytool -genkey -v -keystore ./upload-keystore.jks    -keysize 2048 -validity 10000 -alias upload
    flutter build apk --split-per-abi  --verbose
    flutter build apk --obfuscate --split-debug-info . --verbose
    flutter build appbundle -v  # for google play



