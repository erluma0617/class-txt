function A=bian_lianjie4(p,N,alph)
A=zeros(N);
p1=reshape(p,1,N*N)./sum(sum(p));   
pp=cumsum(p1);%求累计概率
k=0;
while  k<N*(N-1)/2*alph           %利用赌轮法选择一条边相连
     random_data=rand(1,1);
     aa=find(pp>=random_data);jj=aa(1); % 节点jj即为用赌轮法选择的节点
     j=ceil(jj/N);i=jj-(j-1)*N;             %把单下标索引变为双下标索引，或者用函数ind2sub(siz,IND)
    % [i,j=ind2sub(size(p),jj);
    if A(i,j)==0
        A(i,j)=1;A(j,i)=1;
        k=k+1;
    end   
end