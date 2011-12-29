set SrcDir=X:\IT\TX4_Dlls\MATLAB_DLLs
xcopy %SrcDir%\*.dll /Y /U /D
xcopy %SrcDir%\*.pdb /Y /U /D
pause