% % Öncelikle denklemi tanımladım
f = @(x) x.^3 + 5*x -15; 

% Kullanıcıdan alt ve üst sınır noktasını (x0) ve (x1), 
% minimum hatayı ve iterasyon sayısını almak için
x0 = input('Alt sınır noktasını giriniz (x0): '); 
x1 = input('Üst sınır noktasını giriniz (x1): '); 
tolerans = input('Minimum hata toleransını giriniz: '); 
yineleme = input('Maksimum yineleme sayısını giriniz: ');

deger_x = x0:0.1:x1; % x ekseni için 
deger_y = f(deger_x);% y ekseni için

figure
plot(deger_x, deger_y, 'b'); 
title('Denklemin Grafiği: x^3 + 5x -15') 
grid on

% Kök var mı kontrol etmek için
if(f(x0) * f(x1) > 0) 
    disp("Bu Aralıkta kök yok.");
    return 
end

i = 0;
hatalar = zeros(1, yineleme); 
while(i < yineleme)
    x_kok = x1 - (f(x1) * (x0 - x1)) / (f(x0) - f(x1));
    hata = abs((x0 - x_kok) / x0) * 100; 
    hatalar(i + 1) = hata;
    
    % Duruma göre sınırların değişimi
    if(f(x_kok) < 0)
        x0 = x_kok; %alt sınır değeri bu yeni tahmin değeriyle güncellenir.
    elseif (f(x_kok) == 0)
        break;
    else
        x1 = x_kok; %üst sınır değeri bu yeni tahmin değeriyle güncellenir.
    end
    i = i + 1;
    fprintf('Yineleme= %d, Kök = %f, Hata = %f\n', i, x_kok, hata);
    if i == yineleme

        % Tahmini kökün konumu grafiğini çizmek için
        figure
        plot(deger_x, deger_y, x_kok, f(x_kok), 'o'); 
        title('Tahmin Grafiği: x^3 + 5x -15')
        grid on

        % Hataları göstermek için bir grafik çizimi
        figure
        plot(1:i, hatalar(1:i), '-o'); 
        title('Yinelemelere Göre Hata Grafiği')
        xlabel('Yineleme');
        ylabel('Hata');
        grid on
    end
    
    pause(1); %Programın bir saniye beklemesini sağlar. 
end

