function [config] = Config()

    % минимальное значение периода, сек
    config.T_min = 2e-6; 
    
    % сколько импульсов может быть пропущено
    config.number_of_skipped_imp = 10;
    
    % СКО случайного смещения периода (не шум), сек
    config.random_period_std = 0;
    
    % дискретный набор несущих частот, Гц
    config.freq = [1.09 1.5 5.48 9.8 16]*1e9;
    
    % дискретный набор периодов, сек
    config.dur = [50 100 500 20000 65000]*1e-9;
    
    % число отстроек от несущей
    config.freq_number_of_deviations = 6;
    
    % величина отстроек от несущей, в долях от несущей
    config.freq_deviation = 0.001;
    
    % число отстроек от длительности
    config.dur_number_of_deviations = 0;
    
    % величина отстроек от длительности, в долях
    config.dur_deviation = 0.01;
    
    
    % шумы наблюдения
    
    % время прихода, сек
    config.ToA_noise_std = 50e-9;
    
    % частота, Гц
    config.freq_noise_std = 1e3;
    
    % длительность, сек
    config.dur_noise_std = 10e-9;
    
    
    
    
    
    
end

