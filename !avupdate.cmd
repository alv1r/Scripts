@echo off
echo Script for update free AV scaning engines
rem Depends on wget. https://eternallybored.org/misc/wget/
rem put in the same folder with this script
rem and AVZ https://www.z-oleg.com/secur/avz/download.php
rem extract in avz4 folder near the script

if exist "%~dp0wget.exe" (
  echo Start downloading
) else (
  certutil.exe -urlcache -split -f https://eternallybored.org/misc/wget/1.21.2/32/wget.exe
)
del /q "%~dp0cureit.exe"
wget http://download.geo.drweb.com/pub/drweb/cureit/cureit.exe
del /q "%~dp0KVRT.exe"
wget http://devbuilds.kaspersky-labs.com/devbuilds/KVRT/latest/full/KVRT.exe
del /q "%~dp0ransomhide.exe"
wget http://softget.net/freeware/projects/RansomHide/ransomhide.exe
REM del /q "%~dp0ComboFix.exe"
REM wget http://www.forospyware.com/sUBs/ComboFix.exe
del /q "%~dp0EmsisoftEmergencyKit.exe"
wget http://download.emsisoft.com/EmsisoftEmergencyKit.exe
cd .\avz4
avz.exe HiddenMode=3 Script=Base\aupd
