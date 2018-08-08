function [rootIndex,Tree] = kd_build(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 胡力
% 2018/08/06 V0
% kd树创建
% X：搜索目标数据集[dim,num]
% root：kd树的根
% 2018/08/07 V1
% 由于mablab没有引用和指针的概念，导致出现引用失效的情况，致命bug
% 这里考虑使用cell实现整棵树，利用下标实现指针的效果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    'visited',0,....    搜索时是否访问标志)，0为未访问，1为访问过
    'index',-1 ...      对应原始坐标点的下标，也对应在整棵树上的位置，也即cell的下标
    );                  %节点结构体模板

num = size(X,2);    %数据集点数
r = 1;              %当前切分轴
X(5,:) = 1:num;
root = Node_template;
root.isRoot = 1;
root = cut_by_r(X,r,root);

rootIndex = root.index; %根节点索引

% 树Cell的初始化
CellNode = struct(...
    'isRoot',0,...      是否是根节点，0不是，1是
    'isLeaf',0,...      是否是叶子节点
    'isLeft',0,...      是否是左孩子
    'isRight',0,...     是否是右孩子 用于搜索时找兄弟结点
    'hasLeft',0,...     是否有左孩子
    'hasRight',0,...    是否有右孩子
    'parent',-1,...     父亲结点，用于搜索时回溯
    'val',-1,...        切分点坐标
    'left',-1,...       左节点
    'right',-1,...      右节点,是在Tree cell中的位置(index)
    'r',-1,...          切分维度;
    'visited',0,....    搜索时是否访问标志，0为未访问，1为访问过
    'index',-1 ...      对应原始坐标点的下标，也对应在整棵树上的位置，也即cell的下标
    ); 
Tree = cell(num,1);
for i = 1:num
    Tree{i} = CellNode;
end

%利用先序遍历给树的每个节点赋值
Tree = firstRound(root,Tree);


















