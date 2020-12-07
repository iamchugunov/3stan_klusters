function [pattern] = make_pattern(config, pattern_lengths)
    N = length(pattern_lengths);
    freq = config.freq;
    dur = config.dur;
    for i = 1:N
        prev_T = 0;
        config.freq = freq(randi(length(freq)));
        config.dur = dur(randi(length(dur)));
        for j = 1:pattern_lengths(i)
           pattern{i}(:,j) =  make_impulse( config, prev_T );
           prev_T = pattern{i}(1,j);
        end
    end
end

