function [node] = cut_by_r(X,r,currentNode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 根据第r维对X进行切分获得节点
% X：数据点集
% r：切分维度
% node：结构体
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Node_template = struct(...
    'isRoot',0,...      是否是根节点，0不是，1是
    'isLeaf',0,...      是否是叶子节点
    'isLeft',0,...      是否是左孩子
    'isRight',0,...     是否是右孩子 用于搜索时找兄弟结点
    'hasLeft',0,...     是否有左孩子
    'hasRight',0,...    是否有右孩子
    'parent',-1,...     父亲结点，用于搜索时回溯
    'val',-1,...        切分点坐标
    'left',-1,...       左节点(依然是结构体）
    'right',-1,...      右节点
    'leftSet',-1,...    分到右边的点集(矩阵),-1表示空集
    'rightSet',-1,...   分到左边的点集(矩阵)，-1表示空集 
    'r',-1,...          切分维度);
    'visited',0,....     搜索时是否访问标志)，0为未访问，1为访问过
    'index',-1 ...      下标
    );                  %节点结构体模板

dim = size(X,1)-1;    %数据点的维度
num = size(X,2);    %数据集点数
node = currentNode;
node.r = r;
if num == 1
    %数据集中只有一个点
    node.val = X(1:dim,1);
    node.isLeaf = 1;
    node.index = X(dim+1,:);
else
    X_sorted = sort_by_r(X,r);
    mid = ceil(num/2);
    node.val = X_sorted(1:dim,mid);
    node.index = X_sorted(dim+1,mid);
    if mid>1
        node.leftSet = X_sorted(:,1:ceil(num/2)-1);
    end
    if mid<num
        node.rightSet = X_sorted(:,ceil(num/2)+1:end);
    end
end
r = mod(r,dim)+1;
if node.leftSet ~= -1
    node.hasLeft = 1;
    node.left = Node_template;
    node.left.parent = node;
    node.left.isLeft = 1;
    node.left = cut_by_r(node.leftSet,r,node.left);
end
if node.rightSet ~= -1
    node.hasRight = 1;
    node.right = Node_template;
    node.right.parent = node;
    node.right.isRight = 1;
    node.right = cut_by_r(node.rightSet,r,node.right);
end


