@ECHO OFF
REM Arguments:
REM
@ECHO ON

set array.name=%1

REM Check variables
IF %CommonDir% EQU "" GOTO VariableNotFound
IF %SettingsName% EQU "" GOTO VariableNotFound
IF %BuildRootDir% EQU "" GOTO VariableNotFound

FOR /F "delims=_=, tokens=1,2,3,4" %%a IN ('set %array.name%_') DO (
if defined exit goto :Build_Aborted
call :BuildSLN %%c %%d
)
GOTO :Build_Finished

:VariableNotFound
@ECHO VariableNotFound
GOTO Build_Finished

:Build_Aborted
@ECHO Build aborted
:Build_Finished
SET PolaCISResult=
GOTO :eof

REM subrutine最好放在最後面
:BuildSLN
call %CommonDir%\BuildSolution.bat %1 %SettingsName% %BuildRootDir% %CommonDir% %2
ECHO PoalCISResult=%PolaCISResult%
IF %PolaCISResult% NEQ 0 SET exit=1
