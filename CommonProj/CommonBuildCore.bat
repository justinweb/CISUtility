@ECHO OFF
REM Arguments:
REM
@ECHO ON

set array.name=%1

REM Check variables
IF %CommonDir% EQU "" GOTO VariableNotFound
IF %SettingsName% EQU "" GOTO VariableNotFound
IF %BuildRootDir% EQU "" GOTO VariableNotFound

FOR /F "delims=_= tokens=1,2,3" %%a IN ('set %array.name%_') DO (call :BuildSLN %%c)
GOTO :BuildFinished_Core

:VariableNotFound
@ECHO VariableNotFound

:BuildFailed_Core
:BuildFinished_Core
REM call ..\Build_CommonSetting.bat UnInit
SET PolaCISResult=
GOTO :eof

REM subrutine最好放在最後面
:BuildSLN
call %CommonDir%\BuildSolution.bat %1 %SettingsName% %BuildRootDir% %CommonDir%
ECHO PoalCISResult=%PolaCISResult%
IF %PolaCISResult% NEQ 0 GOTO BuildFailed_Core