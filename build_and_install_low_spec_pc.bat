@echo off
REM Copyright (c) 2026 Ankit Gothwal. All rights reserved.
REM Project: JARVIS AI (com.ankit.jarvis) | Developer: Ankit Gothwal
REM Specifically tuned for Intel(R) Pentium(R) CPU G645 @ 2.90GHz (2 Cores / 2 Threads, 6 GB RAM)
REM Pins Gradle to Core #2 (/AFFINITY 2) at BelowNormal priority so Core #1 keeps Windows 10 100%% lag-free!

echo ============================================================================
echo   JARVIS AI - ANKIT GOTHWAL (INTEL PENTIUM G645 2.90GHz BUILDER)
echo   Pinning compiler to CPU Core #2 (/AFFINITY 2) so Core #1 stays lag-free
echo ============================================================================
echo.

start "JARVIS Pentium G645 Build" /B /WAIT /BELOWNORMAL /AFFINITY 2 cmd /c "gradlew.bat assembleDebug --no-daemon --max-workers=1 -Dkotlin.compiler.execution.strategy=in-process"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [!] Local build failed or Android SDK not configured yet.
    echo     Tip: On an Intel Pentium G645, you can also use .github\workflows\android-build.yml
    echo     to compile the APK on GitHub servers for ₹0 with 0%% CPU usage on your PC!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [+] Build succeeded! Installing onto connected Infinix Hot 10 / ASUS Zenfone Max M1...
adb devices
adb install -r app\build\outputs\apk\debug\app-debug.apk

echo.
echo [+] Installation complete!
pause
