function nearest = kd_search(kdTree,target)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 胡力
% 2018/8/6
% kd树的最邻近搜索
% kdTree：数据点集建立的kd树的根节点
% target：目标点坐标
% nearst：点集中距离目标点最近的点坐标
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
currentNode = kdTree;

currentNode = search_down(currentNode,target);% 从currentNode向下搜索到底部

currentNearest = currentNode.val;                    % 当前最近点
currentNearestDist = norm(currentNearest-target);    % 当前最近距离
   
while currentNode.isRoot == 0
    isLeft = currentNode.isLeft;     %当前节点是左孩子标志
    currentNode = currentNode.parent;
    if currentNode.visited == 0
        currentNode.visited = 1;
        temp = norm(currentNode.val-target);
        if temp<currentNearestDist
            currentNearest = currentNode.val;
            currentNearestDist = temp;
        end
        temp = abs(currentNode.val(currentNode.r)-target(currentNode.r));   %与当前分割线的距离
        if temp<currentNearestDist 
            %当前分割线距离小于当前最小距离，在分割线另一边可能有更近点，跳到另外一边继续搜索
            if isLeft == 1
                if currentNode.hasRight == 1 %当前节点是左孩子，且父亲节点有右孩子，则搜索父亲节点的右孩子
                    currentNode = currentNode.right;
                    currentNode = search_down(currentNode,target);                
                    temp = norm(target - currentNode.val);
                    if temp < currentNearestDist
                        currentNearest = currentNode.val;
                    end
                end
            else
                if currentNode.hasLeft == 1  %当前节点是右孩子，且父亲节点有左孩子，则搜索父亲节点的左孩子
                    currentNode = currentNode.left;
                    currentNode = search_down(currentNode,target);
                    temp = norm(target - currentNode.val);
                    if temp < currentNearestDist
                        currentNearest = currentNode.val;
                    end
                end
            end
        end
    end
end
nearest = currentNearest;
            
        
            
        
