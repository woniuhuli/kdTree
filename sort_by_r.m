function X_sorted = sort_by_r(X,r)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���ݵ㼯����rά������
% X�����ݵ㼯[dim,num]
% r������ά��
% X_sorted�������㼯
% ��ð������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% num = size(X,2);
% for i = 1:num-1
%     for j = 1:num-i
%         if X(r,j+1)<X(r,j)
%             X(:,[j,j+1]) = X(:,[j+1,j]);
%         end
%     end
% end
% X_sorted = X;
X_sorted = sortrows(X',r)';