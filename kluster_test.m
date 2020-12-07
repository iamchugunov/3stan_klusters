[IMP] = form_data(imp, 10); % тут указываем какой длины ищем паттерны


minpts = 10;
tic
kD = pdist2(IMP,IMP,'euc','Smallest',minpts);
toc


epsilon = 0.05; 
tic
[out] = DBSCAN(IMP, epsilon, minpts);
toc