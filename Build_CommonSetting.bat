REM �]�w�sĶ�ɩһݪ��@���ܼ�
@ECHO OFF
if %1 == "UnInit" goto UnInit
:Init
@ECHO Build-Init
set SettingsName=MSBuildSettings_User.targets
set CommonDir=D:\TestData\CommonProj

goto EndInit

:UnInit
@ECHO Build-UnInit
set SettingsName=
set CommonDir=

:EndInit