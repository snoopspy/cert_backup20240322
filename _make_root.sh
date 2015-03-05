# --------------------------------------------------------
# usage   : _make_root <common name>
# example : _make_root gilgil
# --------------------------------------------------------
if "%1"=="" goto usage
set COMMON_NAME=%1

if exist root goto exist_error

# --------------------------------------------------------
# make root folder
# --------------------------------------------------------
mkdir root

# --------------------------------------------------------
# make key file(root.key - cakey.pem)
# --------------------------------------------------------
openssl genrsa -out root\root.key 1024

# --------------------------------------------------------
# make csr file(root.csr)
# --------------------------------------------------------
openssl req -config openssl.cfg -new -subj "/C=KR/CN=%COMMON_NAME%" -key root\root.key -out root\root.csr

# --------------------------------------------------------
# make crt file(root.crt - cacert.pem)
# --------------------------------------------------------
openssl x509 -req -days 3650 -signkey root\root.key -in root\root.csr -out root\root.crt
goto eof

:usage
echo "usage   : _make_root <common name>"
echo "example : _make_root gilgil"
goto eof

:exist_error
echo root folder already exists

:eof
