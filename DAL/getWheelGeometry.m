function wheel = getWheelGeometry()
    wheel.scrubRadius = 40;           % mm, Scrub radius (Kingpin ekseni ile lastik teması arasındaki yatay mesafe)
    wheel.steeringArm = 100;             % mm, Direksiyon kolu uzunluğu (Tie-rod bağlantısı)
    wheel.kingpinInclination = 3;       % derece, Kingpin Inclination açısı (Dönme ekseni eğimi)
    wheel.casterAngle = 0.1;              % derece, Caster açısı (Ön tekerlek dönüş açısı)
    wheel.radius = 300;                 % mm, Tekerlek yarıçapı (Jant + Lastik)
end
