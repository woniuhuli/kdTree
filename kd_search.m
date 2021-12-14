function [nearest,nearestIndex] = kd_search(rootIndex,Tree,target, k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 2018/8/6
% kd�������ڽ�����
% rootIndex�����ݵ㼯������kd���ĸ��ڵ��±�(����cell�е�λ�ã�
% target��Ŀ�������
% Tree��kd����cell����
% nearst���㼯�о���Ŀ�������ĵ��±�
% nearst���㼯�о���Ŀ�������ĵ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
currentNode = rootIndex; %��ǰ�ڵ��±꣬�Ӹ��ڵ㿪ʼ����
currentNode = search_down(Tree,currentNode,target);% ��currentNode�����������ײ�
Tree{currentNode}.visited = 1;
    
currentNearest = Tree{currentNode}.val;                    % ��ǰ�����
currentNearestDist = norm(currentNearest-target);    % ��ǰ�������
currentNearestIndex = currentNode;

kNearestCandidate = [currentNearestDist, currentNearest', currentNearestIndex];

while Tree{currentNode}.isRoot == 0
    isLeft = Tree{currentNode}.isLeft;     %��ǰ�ڵ������ӱ�־
    currentNode = Tree{Tree{currentNode}.parent}.index;
    if Tree{currentNode}.visited == 0
        Tree{currentNode}.visited = 1;%���Ϊ�ѷ���
        temp = norm(Tree{currentNode}.val-target);
        if temp<kNearestCandidate(end,1) || size(kNearestCandidate, 1)<k
            currentNearest = Tree{currentNode}.val;
            currentNearestDist = temp;
            currentNearestIndex = currentNode;
            % ���룬����ĩλ&��β��̭
            kNearestCandidate = [kNearestCandidate; currentNearestDist, currentNearest', currentNearestIndex];
            kNearestCandidate = sortrows(kNearestCandidate);
            if size(kNearestCandidate)>=k
                kNearestCandidate(k+1:end,:) = [];
            end
        end
        temp = abs(Tree{currentNode}.val(Tree{currentNode}.r)-target(Tree{currentNode}.r));   %�뵱ǰ�ָ��ߵľ���
        if temp<kNearestCandidate(end,1) || size(kNearestCandidate, 1)<k
            %��ǰ�ָ��߾���С�ڵ�ǰ��С���룬�ڷָ�����һ�߿����и����㣬��������һ�߼�������
            if isLeft == 1
                if Tree{currentNode}.hasRight == 1 %��ǰ�ڵ�����ӣ��ҵ�ǰ�ڵ����Һ��ӣ��������Һ���
                    currentNode = Tree{Tree{currentNode}.right}.index;
                    currentNode = search_down(Tree,currentNode,target); 
                    Tree{currentNode}.visited = 1;%���Ϊ�ѷ���
                    temp = norm(target - Tree{currentNode}.val);
                    if temp<kNearestCandidate(end,1) || size(kNearestCandidate, 1)<k
                        currentNearest = Tree{currentNode}.val;
                        currentNearestDist = temp;
                        currentNearestIndex = currentNode;
                        kNearestCandidate = [kNearestCandidate; currentNearestDist, currentNearest', currentNearestIndex];
                        kNearestCandidate = sortrows(kNearestCandidate);
                        if size(kNearestCandidate)>=k
                            kNearestCandidate(k+1:end,:) = [];
                        end
                    end
                end
            else
                if Tree{currentNode}.hasLeft == 1  %��ǰ�ڵ����Һ��ӣ��Ҹ��׽ڵ������ӣ����������׽ڵ������
                    currentNode = Tree{Tree{currentNode}.left}.index;
                    currentNode = search_down(Tree,currentNode,target);
                    Tree{currentNode}.visited = 1;%���Ϊ�ѷ���
                    temp = norm(target - Tree{currentNode}.val);
                    if temp<kNearestCandidate(end,1) || size(kNearestCandidate, 1)<k
                        currentNearest = Tree{currentNode}.val;
                        currentNearestDist = temp;
                        currentNearestIndex = currentNode;
                        kNearestCandidate = [kNearestCandidate; currentNearestDist, currentNearest', currentNearestIndex];
                        kNearestCandidate = sortrows(kNearestCandidate);
                        if size(kNearestCandidate)>=k
                            kNearestCandidate(k+1:end,:) = [];
                        end
                    end
                end
            end
        end
    end
end
nearest = kNearestCandidate(:,2:end-1);
nearestIndex = kNearestCandidate(:,end);
            
        
            
        
