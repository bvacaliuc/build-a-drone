set R2018B="C:\ProgramData\MATLAB\SupportPackages\R2018b"
set LIBRARIES="C:\ProgramData\MATLAB\SupportPackages\R2018b\3P.instrset\arduinoide.instrset\arduino-1.8.1\libraries"
set TEMP=_temp_matlab_R2018b_win64

if NOT EXIST %R2018B% (
    %TEMP%\setup.exe
)
if EXIST %LIBRARIES% (
    xcopy /s/e/v MKRMotorCarrier %LIBRARIES%\MKRMotorCarrier
)
:end
pause
