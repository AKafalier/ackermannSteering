function car = getCarGeometry()
    car.trackWidthFront = 1100;       % mm, Ön iz genişliği
    car.trackWidthRear = 1100;        % mm, Arka iz genişliği
    car.wheelBase = 1800;             % mm, Dingil mesafesi
    car.mass = 350;                   % kg, Aracın kütlesi
    car.weight = car.mass * 9.81;     % N, Aracın ağırlığı
    car.cgPercentageFront = 0.4;      % %, Ağırlık dağılımı (ön)
end
