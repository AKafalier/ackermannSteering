function [totalMoment, force] = calculateStaticMoment(car, steer, wheel)
    tyreMu = 0.8;
    steeringRatio = wheel.steeringArm / steer.pinionRadius;
    wheel.scrubRadius = wheel.scrubRadius/1000;
    steer.steeringWheelRadius = steer.steeringWheelRadius/1000;

    % Statik momentin hesaplanması (Nm)
    % totalMoment birimi Newton-metre (Nm) cinsindendir
    totalMoment = -tyreMu * car.weight * car.cgPercentageFront * wheel.scrubRadius * cosd(wheel.kingpinInclination);
    
    % Kuvvetin hesaplanması (N)
    % Kuvvet, Moment / Steering Ratio formülü ile hesaplanır
    Tsw = -totalMoment / steeringRatio;  % Momentin direksiyon oranına bölünmesiyle
    force = Tsw / steer.steeringWheelRadius;  % Kuvvet N cinsinden hesaplanır

    % Kuvvetin kgf cinsine dönüştürülmesi
    force_kgf = force /9.81;  % N'den kgf'ye dönüşüm

    % Sonucu kgf cinsinden geri döndür
    force = force_kgf;
end
