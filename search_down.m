function node = search_down(currentNode,target)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 从当前节点往下搜索到kd树的底部
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while currentNode.isLeaf == 0
    r = currentNode.r;
    if target(r)<currentNode.val(r)
        if currentNode.hasLeft == 1
            currentNode = currentNode.left;
        else
            break;
        end
    else
        if currentNode.hasRight == 1
            currentNode = currentNode.right;
        else
            break;
        end
    end
end
currentNode.visited = 1; 
node = currentNode;