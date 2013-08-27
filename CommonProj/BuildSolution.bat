Rem parameters
Rem %1% Soluction Name
Rem %2% 設定檔的名稱
Rem %3% 建置RootDir
REM %4% 共用檔路徑
REM %5% 要使用的版本控制方式(VSS or GIT)

SET CrtSln=%1%
SET SettingsName=%2%
SET CrtDir=%CD%\
SET BuildRootDir=%3%
SET CommonDir=%4%
SET VSMode=%5%
SET SVNURL=https://kgi00525_191030.tw.kgi.com/svn/warrants/Source/ST/4_程式開發相關/Source

@ECHO [%CrtSln%]Building ...  >> %CrtDir%BuildResult.txt
@ECHO [%CrtSln%]Use VSMode=%VSMode% >> %CrtDir%BuildResult.txt

TITLE %CrtSln%
IF VSS==%VSMode% goto VSMode_VSS
IF SVN==%VSMode% goto VSMode_SVN
IF GIT==%VSMode% goto VSMode_GIT
GOTO BuildFailed

:VSMode_VSS
MSBuild %CommonDir%\VSSGet.proj /property:SlnName=%CrtSln% /property:SettingsName=%SettingsName% /property:SettingPath=%CD%\ /property:RootDir=%BuildRootDir%
IF %ERRORLEVEL% NEQ 0 GOTO BuildFailed
GOTO BuildAFVSS

:VSMode_GIT
GOTO BuildAFVSS

:VSMode_SVN
svn checkout %SVNURL%/%CrtSln% %BuildRootDir%/%CrtSln%
IF %ERRORLEVEL% NEQ 0 GOTO SVNFailed
GOTO BuildAFVSS

:BuildAFVSS
copy MSBuildSettings_%CrtSln%.proj .\%CrtSln%\MSBuildSettings_%CrtSln%.proj
cd .\%CrtSln%
MSBuild MSBuildSettings_%CrtSln%.proj /nologo /t:build /property:SlnName=%CrtSln% /property:SettingsName=%SettingsName% /property:WorkPath=%CrtDir%
IF %ERRORLEVEL% NEQ 0 GOTO BuildFailed

MSBuild MSBuildSettings_%CrtSln%.proj /nologo /t:ReleaseDLLs /property:SlnName=%CrtSln% /property:SettingsName=%SettingsName% /property:WorkPath=%CrtDir%
IF %ERRORLEVEL% NEQ 0 GOTO BuildFailed
@ECHO [%CrtSln%]Build Successed >> %CrtDir%BuildResult.txt
cd ..
SET PolaCISResult=%ERRORLEVEL%
GOTO BuildEnd

:SVNFailed
@ECHO [%CrtSln%] SVN Checkout failed xxxxxxxxxxxxx >> %CrtDir%BuildResult.txt
GOTO BuildEnd

:BuildFailed
REM Pass the error code out
SET PolaCISResult=%ERRORLEVEL%
IF %CrtDir% NEQ %CD%\ cd ..

@ECHO [%CrtSln%]Build xxxx Failed xxxx >> %CrtDir%BuildResult.txt

:BuildEnd



