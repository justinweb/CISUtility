TITLE InitBuild
xcopy .\NecessaryComponent\*.* .\NewDLLs /Y /D
xcopy .\NecessaryComponent\MATLAB\*.* .\NewDLLs /Y /D
xcopy .\NecessaryComponent\NewExcelCOM\*.* .\NewDLLs\ExcelDLL\ /Y /D

pause