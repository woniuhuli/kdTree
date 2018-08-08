function node = search_down(Tree,currentNode,target)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 从当前节点往下搜索到kd树的底部
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while Tree{currentNode}.isLeaf == 0
    r = Tree{currentNode}.r;
    if target(r)<Tree{currentNode}.val(r)
        if Tree{currentNode}.hasLeft == 1
            currentNode = Tree{Tree{currentNode}.left}.index;
        else
            currentNode = Tree{Tree{currentNode}.right}.index;
        end
    else
        if Tree{currentNode}.hasRight == 1
            currentNode = Tree{Tree{currentNode}.right}.index;
        else
            currentNode = Tree{Tree{currentNode}.left}.index;
        end
    end
end
node = currentNode;