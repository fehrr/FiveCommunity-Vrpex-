@echo off

echo ===-------------------------------------===
echo     	[FIVE COMMUNITY]
echo ===-------------------------------------===

echo Limpando cache...
rd /s /q "cache"

timeout 1

start .\build\FXServer.exe +exec server.cfg +set onesync_enableInfinity 1 +set sv_enforceGameBuild 3095

exit
