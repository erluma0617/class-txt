% 生成机制1：与[0,1]内均匀随机数比较，若p(i,j)>random_data,则连接节点i,j.
% 直至总共生成的边数为N*(N-1)/2*alph
function A=bian_lianjie1(p,N,alph)   %  返回值A为邻接矩阵
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