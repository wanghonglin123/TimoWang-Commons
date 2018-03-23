@echo off
set OPENSSL_CONF=./openssl.cnf
rem ------------------------------------------------------------------
echo 宝付密钥生成工具
rem ------------------------------------------------------------------
set /p name=请输入证书名称(回车默认 keyfile): 
if "%name%"=="" set name="keyfile"
set /p storepass=请输入私钥密码(回车默认 123456): 
if "%storepass%"=="" set storepass="123456"

rem ------------------------------------------------------------------
echo 生成私钥
rem ------------------------------------------------------------------
openssl.exe genrsa -out %name%_pri.key 1024

rem ------------------------------------------------------------------
echo 创建证书请求
rem ------------------------------------------------------------------
openssl.exe req -new -key %name%_pri.key -out %name%_pri.csr -days 3650 -subj "/CN=RootCA/OU=Baofoo/O=Baofoo/L=Shanghai/ST=Shanghai/C=CN"

rem ------------------------------------------------------------------
echo 创建数字证书
rem ------------------------------------------------------------------
openssl.exe req -new -x509 -key %name%_pri.key -out %name%_pub.cer -days 3650 -subj "/CN=RootCA/OU=Baofoo/O=Baofoo/L=Shanghai/ST=Shanghai/C=CN"
rem ------------------------------------------------------------------

echo 将私钥和证书合并成PFX文件
rem ------------------------------------------------------------------
openssl.exe pkcs12 -export -in %name%_pub.cer -inkey %name%_pri.key -out %name%_pri.pfx -passout pass:%storepass% -name "%name%_alias"

rem ------------------------------------------------------------------
echo 清除中间文件
rem ------------------------------------------------------------------
del %name%_pri.key
del %name%_pri.csr


