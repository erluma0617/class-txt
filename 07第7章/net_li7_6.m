clc, clear, n=34; b=zeros(n); %Zachary网络邻接矩阵初始化
b(1,[2:9,11:14,18,20,22,32])=1; %输入邻接矩阵上三角元素
b(2,[3,4,8,14,18,20,22,31])=1; b(3,[4,8:10,14,28,29,33])=1;
b(4,[8,13,14])=1; b(5,[7,11])=1; b(6,[7,11,17])=1; b(7,17)=1;
b(9,[31,33,34])=1; b(10,34)=1; b(14,34)=1; b(15,[33,34])=1;
b(16,[33,34])=1; b(19,[33,34])=1; b(20,34)=1; b(21,[33,34])=1;
b(23,[33,34])=1; b(24,[26,28,30,33,34])=1; b(25,[26,28,32])=1;
b(26,32)=1; b(27,[30,34])=1; b(28,34)=1; b(29,[32,34])=1; 
b(30,[33,34])=1; b(31,[33,34])=1; b(32,[33,34])=1; b(33,34)=1; 
b=b+b'; %写出完整的邻接矩阵
d=sum(b); %求各节点的度
m=sum(d)/2; %求边数
a=d/(2*m); %计算a值
e=b; e(e==1)=1/(2*m); %e矩阵的初始化
for i=1:n
    v{i}=find(b(i,:)); %求每个节点的邻居节点
end
Q=0;
for k=1:n-1
    DQ=2*(e-a'*a); %计算Q的增量
    mdq=max(max(DQ)); %计算增量的最大值
    fprintf('第%d次合并',k),[i,j]=find(DQ==mdq,1)
    Q=Q+mdq; e2=e;
    tp=sum(e([i,j],:)); %合并i,j行 
    e2(n+k,:)=tp;
    e2([1:end-1],n+k)=tp';
    e2([i,j],:)=0; e2(:,[i,j])=0; e=e2;
    v{n+k}=union(v{i},v{j});
    d(n+k)=length(v{n+k}); d(i)=0; d(j)=0;
    a=d/(2*m);
end
Q
