# mataginews

A Flutter project assigned by Matagi.id as the coding test.

## How to build the APK

1. clone the project to your computer
2. create a firebase project and download the 'google-service.json' put in the 'android/app' folder
(replace my 'google-service.json')
3. open a terminal and go to the directory of this project
4. run 'flutter clean' to clean all the cache (probably have something in the cache of this app)
5. run 'flutter packages get' to get all the packages that needed in this app
6. run 'flutter build apk' / 'flutter build apk --split-per-abi' since this project can only support the android device (I haven't tested on the iOS device)
7. the output apk can be found on 'build/app/outputs/apk' folder
8. or run 'flutter install' to install the apk to your connected device