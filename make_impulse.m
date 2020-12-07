function [ imp ] = make_impulse( config, prev_T )
   
    % формируем случайным образом период 
    % период - разность времен между текущим и предыдущим импульсом
    delta = config.T_min * randi([1 config.number_of_skipped_imp]) + normrnd(0, config.random_period_std);
    
    % формирование времени прихода импульса
    ToA = prev_T + delta; 
    
    % формирование несущей импульса
    f0 = config.freq(randi(length(config.freq))); 
    freq = f0 * (1 + (-1)^randi([0 1]) * config.freq_deviation * randi([0 config.freq_number_of_deviations]));
    
    % формирование длительности импульса
    d0 = config.dur(randi(length(config.dur))); 
    dur = d0 * (1 + (-1)^randi([0 1]) * config.dur_deviation * randi([0 config.dur_number_of_deviations]));
    
    % импульс
    imp = [ToA; freq; dur; delta];
    
end
