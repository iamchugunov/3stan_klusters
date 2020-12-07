function [out] = DBSCAN(IMP, epsilon, minpts)
    out = [];
    labels = dbscan(IMP, epsilon, minpts);
    if max(labels) > 0
        for i = 1:max(labels)
            positions = find(labels==i);
            out(i).count = length(positions);
            out(i).positions = positions';
        end
    end
end

