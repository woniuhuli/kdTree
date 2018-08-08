clear;clc;close all;


%% ²âÊÔkdÊ÷´úÂë
e = 0;
for sim = 1:1e3
    X = randn(4,20);
    [rootIndex,Tree] = kd_build(X);
    target = randn(4,1);
    [nearest,index] = kd_search(rootIndex,Tree,target);
    dist = zeros(20,1);
    for i = 1:20
        dist(i) = norm(X(:,i)-target);
    end
    [~,index1] = min(dist);
    if index ~= index1
        e = e+1;
    end
end



