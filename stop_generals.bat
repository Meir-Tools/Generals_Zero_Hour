@echo off
wmic path Win32_VideoController get CurrentVerticalResolution , CurrentHorizontalResolution , VideoModeDescription &REM ref: https://superuser.com/questions/270718/get-display-resolution-from-windows-command-line
::###
set Prcss_name="generals.exe"
echo press any key to terminate %Prcss_name%
pause
taskkill /IM %Prcss_name% /F