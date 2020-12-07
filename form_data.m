function [out] = form_data(imp, N_signal)
    % нормировка и приведение к нужному виду
    % N_signal - размер паттерна, который мы ищем
    
    vector_max = [max(imp(1,:)); %вектор нормировки
    max(imp(2,:));
    max(imp(3,:));
    max(imp(4,:));];
    

    %нормировка данных
    imp_norm(1,:) = imp(1,:)./vector_max(1);
    imp_norm(2,:) = imp(2,:)./vector_max(2);
    imp_norm(3,:) = imp(3,:)./vector_max(3);
    imp_norm(4,:) = imp(4,:)./vector_max(4);


    imp_norm = imp_norm';

    %imp_norm = imp_norm(:,2:3);
    imp_norm = imp_norm(:,2:4); %с учетом периода


    for i = 1:(length(imp)-N_signal+1)
        iii = [];
        for j = 1:N_signal
            iii = [iii imp_norm((i-1) + j,:)];
        end
        out(i,:) = iii;
    end

    %предобработка перед кластеризацией (удаление начального значения периода в
    %строках
    out(:,3) = [];
    
end

