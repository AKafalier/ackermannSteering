function [dynamicForce, steeringMoment] = calculateDynamicMoment(car, wheel, steer)
    % Lateral kuvvete bağlı dinamik direksiyon momenti hesaplar

    % Direksiyon oranı
    velocity = 50;
    theta = 50;
    steeringRatio = wheel.steeringArm / steer.pinionRadius;
    
    % Direksiyon açısına göre dönüş yarıçapı
    R = car.wheelBase / (tand(theta / steeringRatio));
    R = R / 1000;  % m cinsine dönüştür

    % Hız km/saat cinsinden alındı, bunu m/s'ye çevir
    velocity = velocity / 3.6;  % km/h -> m/s

    % Yanal İvme (m/s^2) hesaplanması: ay = v^2 / R
    ay = power(velocity, 2) / R;

    % Lateral kuvvetin hesaplanması (N)
    F_dyn = car.mass * ay;  % N cinsinden

    % Direksiyon mili momenti (Nm)
    mS = F_dyn * wheel.steeringArm / 1000;  % Nm cinsine dönüştür

    % Direksiyon simidi momenti (Nm)
    mH = mS / (steeringRatio * steer.steeringEfficiency);  % Direksiyon verimi dahil

    % Direksiyon simidine uygulanan kuvvet (N)
    dynamicForce = mH / (steer.steeringWheelRadius * 9.81 / 1000);  % N cinsinden, direksiyon çapı ile kuvvet hesaplanır

    % Çıktı olarak direksiyon momentini de verelim
    steeringMoment = mH;
end
