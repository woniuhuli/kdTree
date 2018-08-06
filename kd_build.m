function root = kd_build(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 胡力
% kd树创建
% X：搜索目标数据集[dim,num]
% root：kd树的根
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
    'visited',0....     搜索时是否访问标志)，0为未访问，1为访问过
    );                  %节点结构体模板

r = 1;              %当前切分点
root = Node_template;
root.isRoot = 1;
root = cut_by_r(X,r,root);
