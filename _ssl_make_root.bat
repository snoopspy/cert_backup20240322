@echo off

rem --------------------------------------------------------
rem usage   : _ssl_make_root <common name>
rem example : _ssl_make_root gilgil
rem --------------------------------------------------------
set COMMON_NAME=%1

if exist root goto demo_ca
mkdir root

rem --------------------------------------------------------
rem make key file(root.key - cakey.pem)
rem --------------------------------------------------------
openssl genrsa -out root\root.key 1024

rem --------------------------------------------------------
rem make csr file(root.csr)
rem --------------------------------------------------------
openssl req -new -subj "/C=KR/CN=%COMMON_NAME%" -key root\root.key -out root\root.csr

rem --------------------------------------------------------
rem make crt file(root.crt - cacert.pem)
rem --------------------------------------------------------
openssl x509 -req -days 3650 -signkey root\root.key -in root\root.csr -out root\root.crt

:demo_ca
rem --------------------------------------------------------
rem initialize demoCA folder
rem --------------------------------------------------------
mkdir demoCA
mkdir demoCA\newcerts
mkdir demoCA\private
copy  root\root.key demoCA\private\cakey.pem
copy  root\root.crt demoCA\cacert.pem

rem --------------------------------------------------------
rem make default files
rem --------------------------------------------------------
touch .\demoCA\index.txt
echo 01 > .\demoCA\serial
