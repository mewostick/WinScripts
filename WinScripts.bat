@echo off
:start
cls
title WinScripts - main menu
echo.
echo. WinScripts 1.1
echo. A collection of tweaks and PowerShell scripts.
echo. https://github.com/mewostick/WinScripts
echo.
echo. !!! MAKE SURE THIS IS BEING RAN AS ADMINISTRATOR !!!
echo.
echo. Type in "tweaks" for registry tweaks
echo. Type in "scripts" for PowerShell scripts
echo. Type in "cpanel" for certain Control Panel applets
echo. Type in "notes" for notes
echo.
echo. Type in "light" for light mode
echo. Type in "dark" for dark mode
echo.
echo. Type in "exit" to exit
echo.
set /p typein= Enter your choice: 

if %typein% == exit goto exit
if %typein% == notes goto notes
if %typein% == matrix goto matrix
if %typein% == tweaks goto tweaks
if %typein% == scripts goto scripts
if %typein% == cpanel goto cpanel
if %typein% == light goto light
if %typein% == dark goto dark

goto wrong
:wrong
title WinScripts - error!
cls
echo.
echo. Did you make a mistake while typing?
echo.
pause
cls
goto start

:light
color F0
goto start

:dark
color 07
goto start

:matrix
cls
title Shhh! It's a secret!
color 0a
goto start

:notes
cls
title WinScripts - notes
echo.
echo. NOTES
echo.
echo. Hey, thanks for taking a look!
echo.
echo. This script is based on my previous batch file thingy.
echo. However, now it is a collection of PowerShell scripts which I use to setup Windows every time I do a clean install.
echo. Of course, it is not perfect but nothing in life is as well.
echo.
echo. In any case, you're free to make any modifications.
echo.
echo. Cheers!
echo.
pause
cls
goto start

goto wrongthesecond
:wrongthesecond
cls
title WinScripts - error!
echo.
echo. Did you make a mistake while typing?
echo.
pause
cls
goto done

:restart
cls
title WinScripts - restarting your machine..
echo. Restarting your machine..
shutdown /r -t 1
exit

:exit
title WinScripts - quitting
cls
echo. Quiting the program..
exit

:tweaks
cls
title WinScripts - registry tweaks
echo.
echo. TWEAKS
echo.
echo. Type in "1" to increase JPEG quality to 100% for wallpapers
echo. Type in "2" to enable verbose messages
echo. Type in "3" to disable MRT updates
echo. Type in "4" to enable Ctrl+Alt+Delete on lock screen
echo.
echo. Type in "d1" to remove JPEG quality increase
echo. Type in "d2" to disable verbose messages
echo. Type in "d3" to enable MRT updates
echo. Type in "d4" to disable Ctrl+Alt+Delete on lockscreen
echo.
echo. Type in "start" to go to the main menu
echo. Type in "restart" to restart your machine
echo. Type in "exit" to quit the program
echo.
set /p optionaltweaks= Enter your choice: 

if %optionaltweaks% == 1 goto 1
if %optionaltweaks% == 2 goto 2
if %optionaltweaks% == 3 goto 3
if %optionaltweaks% == 4 goto 4
if %optionaltweaks% == d1 goto d1
if %optionaltweaks% == d2 goto d2
if %optionaltweaks% == d3 goto d3
if %optionaltweaks% == d4 goto d4
if %optionaltweaks% == start goto start
if %optionaltweaks% == restart goto restart
if %optionaltweaks% == exit goto exit

goto wrongthethird
:wrongthethird
cls
title WinScripts - error!
echo.
echo. Did you make a mistake while typing?
echo.
pause
cls
goto tweaks

:1
cls
title WinScripts - applying the tweak..
echo.
echo. Settings JPEG quality to 100% for wallpapers..
echo.
REG ADD "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d 64
title WinScripts - the tweak has been applied!
echo.
echo. Done!
echo.
timeout 5
goto tweaks

:2
cls
title WinScripts - applying the tweak..
echo.
echo. Enabling verbose messages..
echo.
title WinScripts - the tweak has been applied!
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "verbosestatus" /t REG_DWORD /d 1
echo.
echo. Verbose messages have been enabled!
echo.
timeout 5
goto tweaks

:3
cls
title WinScripts - applying the tweak..
echo.
echo. Disabling MRT updates..
echo.
title WinScripts - the tweak has been applied!
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT /v "DontOfferThroughWUAU" /t REG_DWORD /d 1
echo.
echo. MRT updates have been disabled!
echo.
timeout 5
goto tweaks

:4
cls
title WinScripts - applying the tweak..
echo.
echo. Enabling Ctrl+Alt+Del sign-in on Windows lock screen..
echo.
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "DisableCAD" /t REG_DWORD /d 0 /f
echo.
echo. Ctrl+Alt+Del sign-in has been enabled!
echo.
timeout 5
goto tweaks


:d1
cls
title WinScripts - applying the tweak..
echo.
echo. Removing JPEG quality increase..
echo.
REG DELETE "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /f
title WinScripts - the tweak has been applied!
echo.
echo. Removed JPEG quality increase!
echo.
timeout 5
goto tweaks

:d2
cls
title WinScripts - applying the tweak..
echo.
echo. Disabling verbose messages..
echo.
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "verbosestatus" /f
title WinScripts - the tweak has been applied!
echo.
echo. Verbose messages have been disabled!
echo.
timeout 5
goto tweaks

:d3
cls
title WinScripts - applying the tweak..
echo.
echo. Enabling MRT updates..
echo.
title WinScripts - the tweak has been applied!
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT /v "DontOfferThroughWUAU" /f
echo.
echo. MRT updates have been enabled!
echo.
timeout 5
goto tweaks

:d4
cls
title WinScripts - applying the tweak..
echo.
echo. Disabling Ctrl+Alt+Del sign-in on Windows lock screen..
echo.
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "DisableCAD" /t REG_DWORD /d 0 /f
echo.
echo. Ctrl+Alt+Del sign-in has been disabled!
echo.
timeout 5
goto tweaks

:scripts
cls
title WinScripts - PowerShell scripts
echo.
echo. POWERSHELL SCRIPTS
echo.
echo. Type in "1" for Chris Titus Tech's Windows Utility script
echo. Type in "2" for Microsoft Activation Scripts
echo. Type in "3" for AveYo edge removal
echo. Type in "4" to download WPD + ShutUp10++ to your documents
echo. Type in "5" to install all VC Runtimes (my mirror)
echo. Type in "6" to install Chocolatey
echo. Type in "7" for Win11Debloat
echo.
echo. Type in "start" to go to the main menu
echo. Type in "restart" to restart your machine
echo. Type in "exit" to quit the program
echo.
set /p script= Enter your choice: 

if %script% == 1 goto s1
if %script% == 2 goto s2
if %script% == 3 goto s3
if %script% == 4 goto s4
if %script% == 5 goto s5
if %script% == 6 goto s6
if %script% == 7 goto s7
if %script% == start goto start
if %script% == restart goto restart
if %script% == exit goto exit

goto wrongthefourth
:wrongthefourth
cls
title WinScripts - error!
echo.
echo. Did you make a mistake while typing?
echo.
pause
cls
goto scripts

:s1
start powershell.exe -NoProfile -Command "iwr -useb https://christitus.com/win | iex"
goto scripts

:s2
start powershell.exe -NoProfile -Command "irm https://get.activated.win | iex"
goto scripts

:s3
start powershell.exe -NoProfile -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/ishad0w/3b79bf829e9725aa102b2e8446bb5ef8/raw/aveyo_edge_removal.bat'))"
goto scripts

:s4
start PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mewostick/WinScripts/main/privacysoftware.ps1'))"
goto scripts

:s5
start PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mewostick/WinScripts/main/vcruntimes.ps1'))"
goto scripts

:s6
start PowerShell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
echo.
echo. After installation use "choco feature enable -n=allowGlobalConfirmation" in a new CMD window to automatially accept prompts when installing packages in Chocolatey.
echo.
pause
goto scripts

:s7
start PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Raphire/Win11Debloat/master/Get.ps1")))"
goto scripts

:cpanel
cls
title WinScripts - applets
echo.
echo. CONTROL PANEL APPLETS
echo.
echo. Type in "1" for mouse applet
echo. Type in "2" for power plan applet
echo. Type in "3" for user accounts applet
echo. Type in "4" for sound applet
echo. Type in "5" for personalization applet
echo. Type in "6" for indexing options applet
echo. Type in "7" for AutoPlay applet
echo. Type in "8" for fonts applet
echo. Type in "9" for game controllers applet
echo.
echo. Type in "start" to go to the main menu
echo. Type in "restart" to restart your machine
echo. Type in "exit" to quit the program
echo.
set /p applet= Enter your choice: 

if %applet% == 1 goto c1
if %applet% == 2 goto c2
if %applet% == 3 goto c3
if %applet% == 4 goto c4
if %applet% == 5 goto c5
if %applet% == 6 goto c6
if %applet% == 7 goto c7
if %applet% == 8 goto c8
if %applet% == 9 goto c9
if %applet% == start goto start
if %applet% == restart goto restart
if %applet% == exit goto exit

goto wrongthefifth
:wrongthefifth
cls
title WinScripts - error!
echo.
echo. Did you make a mistake while typing?
echo.
pause
cls
goto cpanel

:c1
start control main.cpl
goto cpanel

:c2
start control /NAME Microsoft.PowerOptions
goto cpanel

:c3
start control /NAME Microsoft.UserAccounts
goto cpanel

:c4
start control /NAME Microsoft.Sound
goto cpanel

:c5
start explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}
goto cpanel

:c6
start control /NAME Microsoft.IndexingOptions
goto cpanel

:c7
start control /NAME Microsoft.AutoPlay
goto cpanel

:c8
start control /NAME Microsoft.Fonts
goto cpanel

:c9
start control /NAME Microsoft.GameControllers
goto cpanel