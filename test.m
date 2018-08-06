clear;clc;close all;


%% ²âÊÔkdÊ÷´úÂë
X = randn(4,20);
root = kd_build(X);
target = randn(4,1);
nearest = kd_search(root,target);
dist = zeros(20,1);
for i = 1:20
    dist(i) = norm(X(:,i)-target);
end
[~,index] = min(dist);
nearest1 = X(:,index);
a = find(nearest ~= nearest1);




