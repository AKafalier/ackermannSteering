% Ana program (Main Script)
clc; clear;

% **Gerekli Dizinleri Ekle**
addpath('AckermanAnalyzer\App')
addpath('AckermanAnalyzer\BLL')
addpath('AckermanAnalyzer\DAL')
addpath('AckermanAnalyzer\Presentation')

% **DAL: Verileri Al**
car = getCarGeometry();
steer = getSteeringGeometry();
wheel = getWheelGeometry();

% **BLL: Hesaplamaları Yap**
[ackermanAngleInner, ackermanAngleOuter, R] = calculateAckermanAngle(car, steer, wheel);
steeringRatio = wheel.steeringArm / steer.pinionRadius;
[staticMoment, staticForce] = calculateStaticMoment(car,steer,wheel);
% dynamicForce = calculateDynamicMoment(car,wheel,steer);

% **PL: Sonuçları Göster**
fprintf('Steering Ratio: %.2f\n', steeringRatio);
fprintf('Ackerman Angle Outer (degree): %.4f\n', ackermanAngleInner);
fprintf('Ackerman Angle Inner (degree): %.4f\n', ackermanAngleOuter);   
fprintf('Turning Radius (mm): %.4f\n', R);
fprintf('Static Moment: %.4f Nmm\n', staticMoment);
fprintf('Static Force: %.4f Kg\n', staticForce);
% fprintf('Dynamic Force: %.4f Kg\n', dynamicForce);
