clear
a = arduino('COM6', 'MKR1000', 'LIbraries', 'Arduino/MKRMotorCarrier');
carrier = addon(a,'Arduino/MKRMotorCarrier');
dcmLeft = dcmotor(carrier,4);
dcmRight = dcmotor(carrier,3);
dcmRight.DutyCycle = 0.21;
dcmLeft.DutyCycle = 0.21;
start(dcmRight);start(dcmLeft);
pause((1/5.7)*112);
stop(dcmLeft);stop(dcmRight);