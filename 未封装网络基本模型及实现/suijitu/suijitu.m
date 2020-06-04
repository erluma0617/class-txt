% function [p,A]=suijitu()
function suijitu()
disp('随机图生成策略1或2,')
disp('1表示边连接的概率[0,1]内均匀随机数比较，若p(i,j)>random_data,则连接节点i,j.直至总共生成的边数为N*(N-1)/2*alph');
disp('2表示将概率从大到小排序，连接概率排在前面的节点对，直至总共生成的边数为N*(N-1)/2*alph,并以一定的较小的概率对边随机重连');
pp=input('请输入随机图生成策略1,2,3或4:');
N=input('网络图中节点的总数目N：');
alph=input('网络图中边的平均连接度alph:  ');
beta=input('表征边的平均长度的参数beta:  ');
% pp=1;
% N=100;
% alph=0.25;
% beta=0.5;
randData=rand(2,N)*1000;
x=randData(1,:);
y=randData(2,:);
p=lianjiegailv(x,y,alph,beta,N);

switch  pp
    case 1
        A=bian_lianjie1(p,N,alph);
    case 2
        relink=input('请输入边重新连接的概率:');
        A=bian_lianjie2(p,N,alph,relink);
    otherwise
        disp('The number pp you input is wrong');
end
[C,aver_C]=Clustering_Coefficient(A);
[DeD,aver_DeD]=Degree_Distribution(A);
[D,aver_D]=Aver_Path_Length(A);
disp(['该随机图的边数为：',int2str(sum(sum(A))/2)]);
disp(['该随机图的平均路径长度为：',num2str(aver_D)]);  %%输出该网络的特征参数
disp(['该随机图的聚类系数为：',num2str(aver_C)]);
disp(['该随机图的平均度为：',num2str(aver_DeD)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=i+1:N
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)]);
            hold on;
        end
    end
end
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 该函数求解两节点连接边的概率
function p=lianjiegailv(x,y,alph,beta,N)

plot(x,y,'r.','Markersize',18);
hold on;
d=zeros(N);
for i=1:N
    for j=1:N
        d(i,j)=sqrt((x(i)-x(j))^2+((y(i)-y(j)))^2);
    end
end
L=max(max(d));
for i=1:N
    for j=1:N
        p(i,j)=alph*exp(-d(i,j)/beta/L);
    end
    p(i,i)=0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 生成机制1：与[0,1]内均匀随机数比较，若p(i,j)>random_data,则连接节点i,j.
% 直至总共生成的边数为N*(N-1)/2*alph
function A=bian_lianjie1(p,N,alph)   %  返回值D为邻接矩阵
A=zeros(N);num=0;
for k=1:inf
    for i=1:N
        for j=1:N
            random_data=rand(1,1);
            if p(i,j)>=random_data&A(i,j)==0
                A(i,j)=1; A(j,i)=1;
                num=num+1;
                if num>=N*(N-1)/2*alph
                    return ;
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 生成机制2：将概率从大到小排序，连接概率排在前面的节点对，直至总共生成的边数为N*(N-1)/2*alph
%% 以一定的较小的随机随机重连，以实现一定程度的随机化。
function A=bian_lianjie2(p,N,alph,relink)
A=zeros(N);
p1=reshape(tril(p),[1,N*N]);
[p2,px]=sort(p1);
M=ceil(N*(N-1)/2*alph);
for i=1:M
    [m,n]=ind2sub(size(p),px(i));  %单下标索引换为双下标索引
    A(m,n)=1;A(n,m)=1;
end

[m,n]=find(tril(A));               %以一定的概率随机化重连
for i=1:length(m)
    random_data1=rand(1,1);
    if relink>random_data1
        A(m(i),n(i))=0;A(n(i),m(i))=0;
        n1=n(find(m~=m(i)));
        random_data2=randint(1,1,[1,length(n1)]);
        nn=n1(random_data2);
        A(m(i),nn)=1;A(nn,m(i))=1;
    end
end






