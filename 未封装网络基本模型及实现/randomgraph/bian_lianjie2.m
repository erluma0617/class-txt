%% 生成机制2：将概率从大到小排序，连接概率排在前面的节点对，直至总共生成的边数为N*(N-1)/2*alph
%% 以一定的较小的随机随机重连，以实现一定程度的随机化。   有问题！！！！！！！！
function A=bian_lianjie2(p,N,alph,relink)
A=zeros(N);
p1=reshape(tril(p),[1,N*N]);
[p2,px]=sort(p1,'descend');
M=ceil(N*(N-1)/2*alph)
for k=1:M
    [m,n]=ind2sub(size(p),px(k));  %单下标索引换为双下标索引
    A(m,n)=1;A(n,m)=1;
end
[m,n]=find(tril(A));               %以一定的概率随机化重连
for i=1:length(m)
    p1=rand(1,1);
    if relink>p1                          %若给定的随机化概率大于生成的随机数，则进行重连。
         A(m(i),n(i))=0;A(n(i),m(i))=0;   %先断开原来的边，再随机选择一条边与之相连  
         A(m(i),m(i))=inf;
         n1=find(A(m(i),:)==0);      
         random_data=randint(1,1,[1,length(n1)]);
         nn=n1(random_data);
         A(m(i),nn)=1;A(nn,m(i))=1;
         A(m(i),m(i))=0;
    end
end