@REM note: curl is pre-installed in nanoserver container-images

curl -SL --output C:\TEMP\vs_buildtools.exe https://aka.ms/vs/17/release/vs_buildtools.exe
IF NOT "%ERRORLEVEL%"=="0" EXIT

START /w C:\TEMP\vs_buildtools.exe ^
    --quiet --wait --norestart --nocache ^
    --installPath "%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools" ^
    --add Microsoft.VisualStudio.Component.VC.v141.x86.x64

IF NOT "%ERRORLEVEL%"=="0" IF NOT "%ERRORLEVEL%"=="3010" EXIT /b

DEL /q vs_buildtools.exe

@REM --remove Microsoft.VisualStudio.Component.Windows10SDK.10240
@REM --remove Microsoft.VisualStudio.Component.Windows10SDK.10586
@REM --remove Microsoft.VisualStudio.Component.Windows10SDK.14393
