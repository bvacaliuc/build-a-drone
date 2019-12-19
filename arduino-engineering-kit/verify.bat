@echo off
set R2018B="C:\ProgramData\MATLAB\SupportPackages\R2018b"
set LIBRARIES="C:\ProgramData\MATLAB\SupportPackages\R2018b\3P.instrset\arduinoide.instrset\arduino-1.8.1\libraries"
set MODULES=MKRMotorCarrier MWArduino Servo Stepper

if not EXIST %R2018B% goto do_setup
if not EXIST %LIBRARIES% goto do_libraries
for %%d in (%MODULES%) do (
    if not EXIST %LIBRARIES%\%%d goto do_libraries
)
echo "*** OK ***"
goto end
:do_setup
echo "*** PLEASE run setup.bat again ***"
goto end
:do_libraries
echo "*** PLEASE run setup.m in Matlab again, following all instructions. ***"
goto end
:end
pause
