function [ackermanAngleInner, ackermanAngleOuter, R] = calculateAckermanAngle(car, steer, wheel)
    % Ackerman dönüş açısını hesaplar (iç ve dış tekerlekler), ters Ackerman destekli
    steeringRatio = wheel.steeringArm / steer.pinionRadius;
    maxSteeringAngle = (steer.lockToLock / 2); % Maksimum direksiyon açısı (radyan)

    % Direksiyon açısıyla tekerlek dönüş yarıçapı (R) hesaplanıyor
    R = car.wheelBase / (tand(maxSteeringAngle / steeringRatio));

    % Ters Ackerman etkisi eklenmiş iç ve dış tekerlek açısı hesaplama
    thetaInner = atan(car.wheelBase / (R - (car.trackWidthFront / 2)));
    thetaOuter = atan(car.wheelBase / (R + (car.trackWidthFront / 2)));

    % Sonucu dereceye çevir
    ackermanAngleInner = rad2deg(thetaInner);
    ackermanAngleOuter = rad2deg(thetaOuter);
end
