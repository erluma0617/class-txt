%% 生成机制3：与[0,1]内均匀随机数比较，若p(i,j)>random_data,则连接节点i,j，
%% 但不要求总共的边数为N*(N-1)/2*alph
function A=bian_lianjie3(p,N,alph);     
A=zeros(N);
for i=1:N
    for j=1:N
         random_data=rand(1,1);
         if p(i,j)>=random_data&A(i,j)==0
            A(i,j)=1; A(j,i)=1;
         end
    end
end