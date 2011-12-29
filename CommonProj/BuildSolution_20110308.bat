Rem parameters
Rem %1% Soluction Name
Rem %2% 設定檔的名稱
Rem %3% 建置RootDir
REM %4% 共用檔路徑

SET CrtSln=%1%
SET SettingsName=%2%
SET CrtDir=%CD%\
SET BuildRootDir=%3%
SET CommonDir=%4%

TITLE %CrtSln%
MSBuild %CommonDir%\VSSGet.proj /property:SlnName=%CrtSln% /property:SettingsName=%SettingsName% /property:SettingPath=%CD%\ /property:RootDir=%BuildRootDir%

copy MSBuildSettings_%CrtSln%.proj .\%CrtSln%\MSBuildSettings_%CrtSln%.proj
cd .\%CrtSln%
MSBuild MSBuildSettings_%CrtSln%.proj /nologo /t:build /property:SlnName=%CrtSln% /property:SettingsName=%SettingsName% /property:WorkPath=%CrtDir%

MSBuild MSBuildSettings_%CrtSln%.proj /nologo /t:ReleaseDLLs /property:SlnName=%CrtSln% /property:SettingsName=%SettingsName% /property:WorkPath=%CrtDir%
cd ..
