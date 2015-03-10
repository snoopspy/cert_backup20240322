@echo off

rem --------------------------------------------------------
rem usage   : _make_site <common name> [<base file name>]
rem example : _make_site foo.com
rem --------------------------------------------------------
if "%1"=="" goto usage
set COMMON_NAME=%1
set BASE_FILE_NAME=%1
if "%2"=="" goto next
set BASE_FILE_NAME=%2

:next

rem --------------------------------------------------------
rem make key file(foo.com.key)
rem --------------------------------------------------------
openssl genrsa -out %BASE_FILE_NAME%.key 1024

rem --------------------------------------------------------
rem make csr file(foo.com.csr)
rem --------------------------------------------------------
openssl req -config openssl.cfg -new -subj "/C=KR/CN=%COMMON_NAME%" -key %BASE_FILE_NAME%.key -out %BASE_FILE_NAME%.csr
 
rem --------------------------------------------------------
rem make crt file(foo.com.crt)
rem --------------------------------------------------------
openssl ca -config openssl.cfg -batch -startdate 20140301000000Z -enddate 20240227000000Z -policy policy_anything -out %BASE_FILE_NAME%.crt -infiles %BASE_FILE_NAME%.csr

rem --------------------------------------------------------
rem make pkcs file(foo.com.pfx)
rem --------------------------------------------------------
openssl pkcs12 -keypbe PBE-SHA1-3DES -certpbe PBE-SHA1-3DES -export -in %BASE_FILE_NAME%.crt -inkey %BASE_FILE_NAME%.key -out %BASE_FILE_NAME%.pfx -name "%COMMON_NAME%" -passin pass: -passout pass:

rem --------------------------------------------------------
rem make key crt file(foo.com.pem)
rem --------------------------------------------------------
copy %BASE_FILE_NAME%.key + %BASE_FILE_NAME%.crt %BASE_FILE_NAME%.pem
rem del %BASE_FILE_NAME%.key // gilgil temp 2015.03.04
rem del %BASE_FILE_NAME%.csr // gilgil temp 2015.03.04
rem del %BASE_FILE_NAME%.crt // gilgil temp 2015.03.04
goto eof

:usage
echo "usage   : _make_site <common name> [<base file name>]"
echo "example : _make_site foo.com"

:eof
