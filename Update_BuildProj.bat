set SrcDir=D:\TestData\Project_Build
set DstDir=D:\TestData\Project_Build_V5
xcopy %SrcDir%\*.txt %DstDir%\ /D /Y /S /EXCLUDE:Update_BuildProj_ExcludeFiles.txt
xcopy %SrcDir%\*.bat %DstDir%\ /D /Y /S /EXCLUDE:Update_BuildProj_ExcludeFiles.txt
xcopy %SrcDir%\*.proj %DstDir%\ /D /Y /S /EXCLUDE:Update_BuildProj_ExcludeFiles.txt
xcopy %SrcDir%\*.targets %DstDir%\ /D /Y /S /EXCLUDE:Update_BuildProj_ExcludeFiles.txt
pause