function A=bian_lianjie4(p,N,alph)
A=zeros(N);
p1=reshape(p,1,N*N)./sum(sum(p));   
pp=cumsum(p1);%���ۼƸ���
k=0;
while  k<N*(N-1)/2*alph           %���ö��ַ�ѡ��һ��������
     random_data=rand(1,1);
     aa=find(pp>=random_data);jj=aa(1); % �ڵ�jj��Ϊ�ö��ַ�ѡ��Ľڵ�
     j=ceil(jj/N);i=jj-(j-1)*N;             %�ѵ��±�������Ϊ˫�±������������ú���ind2sub(siz,IND)
    % [i,j=ind2sub(size(p),jj);
    if A(i,j)==0
        A(i,j)=1;A(j,i)=1;
        k=k+1;
    end   
end