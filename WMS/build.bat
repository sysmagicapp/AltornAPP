@echo on

call cordova build --release android

pause 

cd platforms\android\build\outputs\apk

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ../../../../../key.keystore android-armv7-release-unsigned.apk alias_name

F:\android-sdk\build-tools\22.0.1\zipalign.exe -v 4 android-armv7-release-unsigned.apk Altron.apk

xcopy /y "%~dp0platforms\android\build\outputs\apk\Altron.apk" "%~dp0"

del "%~dp0platforms\android\build\outputs\apk\Altron.apk" /f /q

pause