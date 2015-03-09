@echo off

rem --------------------------------------------------------
rem call _clear_site
rem --------------------------------------------------------
call _clear_site.bat

rem --------------------------------------------------------
rem initialize demoCA folder
rem --------------------------------------------------------
mkdir demoCA
mkdir demoCA\newcerts
mkdir demoCA\private

rem --------------------------------------------------------
rem copy root files
rem --------------------------------------------------------
copy root\root.key demoCA\private\cakey.pem
copy root\root.crt demoCA\cacert.pem

rem --------------------------------------------------------
rem make other files
rem --------------------------------------------------------
touch .\demoCA\index.txt
echo 01 > .\demoCA\serial

