@echo off
:start
cls
title WinScripts - main menu
echo.
echo. WinScripts 1.0
echo. A collection of tweaks and PowerShell scripts.
echo. https://github.com/mewostick/WinScripts
echo.
echo. !!! MAKE SURE THIS IS BEING RAN AS ADMINISTRATOR !!!
echo.
echo. Type in "debloat" if you want to run my $hitty optimizer
echo. Type in "tweaks" for tweaks
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

if %typein% == debloat goto debloat
if %typein% == exit goto bye
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

:bye
cls
title WinScripts - quitting..
echo.
echo. You did not want to continue, therefore this script will quit.
timeout 3
exit

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

:debloat 
cls
title WinScripts - $hitty optimizer is running!
echo. Running!
echo.
echo Uninstalling OneDrive (32-bit)
taskkill /f /im OneDrive.exe
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
echo Uninstalling OneDrive (64-bit)
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
echo Services:
echo Disabling DiagTrack
sc stop DiagTrack
sc config DiagTrack start= disabled
echo Disabling Delivery Optimization
sc stop DoSvc
sc config DoSvc start= disabled
echo Disabling Server
echo.
echo. Telemetry services have been disabled.
echo.
echo. Scheduled tasks:
echo.
echo Disabling Microsoft Compatibility Appraiser taskkill (telemetry)
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
echo Disabling ProgramDataUpdater (telemetry)
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
echo Disabling StartupAppTask (telemetry)
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
echo Disabling Consolidator (telemetry)
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
echo Disabling KernelCeipTask (telemetry)
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
echo Disabling UsbCeip (telemetry)
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
echo Disabling Scheduled Diagnosis (telemetry)
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable
echo Disaling Disk Diagnostic Data Collector (telemetry)
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
echo Disabling Disk Footprint Diagnostics (telemetry)
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
echo Disabling Storage Sense
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable
echo Disabling dusmtask
schtasks /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
echo Disabling DmClient (telemetry)
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
echo Disabling DmClientOnScenarioDownload (telemetry)
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
echo Disabling WinSAT
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
echo Disabling BfeOnServiceStartTypeChange
schtasks /Change /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /Disable
echo Disabling Sqm-Tasks (telemetry)
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
echo Disabling BackgroundUploadTask
schtasks /Change /TN "Microsoft\Windows\SettingSync\BackgroundUploadTask" /Disable
echo Disabling GatherNetworkInfo (telemetry)
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
echo Disabling Device (telemetry)
schtasks /Change /TN "Microsoft\Windows\Device Information\Device" /Disable
echo.
echo. Rubbish tasks have been disabled
echo.
echo. Registry
echo.
echo Disallowing telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0
echo Disabling Windows Customer Experience Improvement Program
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0
echo Disabling Cortana
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
echo Disabling Windows Error Reporting
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1
echo Disabling Steps Recorder
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1
echo Disabling Inventory Collector
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1
echo Disabling Handwriting automatic learning
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrickImplicitTextCollection" /t REG_DWORD /d 1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1
echo Disabling Advertising ID
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1
echo Disabling Search Companion
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SearchCompanion"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d 1
echo Disabling Microsoft consumer exeperiences
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1
echo.
echo. Registry done!
echo.
title WinScripts - done!
echo. Script's done!
echo. It may be recommended to restart your computer now.
echo. 
echo. You're free to go to the main menu now.
pause
goto done

:done
title WinScripts - choose!
echo.
echo. Type in "restart" to restart your machine
echo. Type in "exit" to quit the program
echo. Type in "start" to go back to the main menu
echo.
set /p done= Enter your choice: 

if %done% == restart goto restart
if %done% == exit goto exit
if %done% == start goto start

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
title WinScripts - tweaks
echo.
echo. TWEAKS
echo.
echo. Type in "1" to increase JPEG quality to 100% for wallpapers
echo. Type in "2" to enable verbose messages
echo. Type in "3" to disable MRT updates
echo.
echo. Type in "d1" to remove JPEG quality increase
echo. Type in "d2" to disable verbose messages
echo. Typ3 in "d3" to enable MRT updates
echo.
echo. Type in "start" to go to the main menu
echo. Type in "restart" to restart your machine
echo. Type in "exit" to quit the program
echo.
set /p optionaltweaks= Enter your choice: 

if %optionaltweaks% == 1 goto 1
if %optionaltweaks% == 2 goto 2
if %optionaltweaks% == 3 goto 3
if %optionaltweaks% == d1 goto d1
if %optionaltweaks% == d2 goto d2
if %optionaltweaks% == d3 goto d3
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