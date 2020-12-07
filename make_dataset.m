function [imp, pattern_info] = make_dataset(config, pattern, N)
    
    imp = zeros(4, N);
    
    prev_T = clock;
    prev_T = prev_T(6);
    
    M = length(pattern);
    for i = 1:M
        pattern_info(i).len = size(pattern{i},2);
        pattern_info(i).count = 0;
        pattern_info(i).positions = [];
    end
    
    
    i = 1;
    while i < N+1
       imp(:,i) =  make_impulse( config, prev_T );
       prev_T = imp(1,i);
       i = i + 1;
       
       if randi(100) == 100
           k = randi(M);
           pattern_signal = pattern{k};
           pattern_info(k).count = pattern_info(k).count + 1;
           pattern_info(k).positions(pattern_info(k).count) = i;
           for j = 1:size(pattern_signal,2)
               imp(:,i) = pattern_signal(:,j);
               imp(1,i) = imp(1,i) + prev_T;
               i = i + 1;
           end
           prev_T = imp(1,i-1); 
       end

    end

    imp(1,:) = imp(1,:) + normrnd(0, config.ToA_noise_std,[1, N]);
    imp(2,:) = imp(2,:) + normrnd(0, config.freq_noise_std,[1, N]);
    imp(3,:) = imp(3,:) + normrnd(0, config.dur_noise_std,[1, N]);
    imp(4,1) = 0;

    for i=2:N
        imp(4,i) = imp(1,i) - imp(1,i-1);
    end
    
end

