%% ���ɻ���2�������ʴӴ�С�������Ӹ�������ǰ��Ľڵ�ԣ�ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph
%% ��һ���Ľ�С����������������ʵ��һ���̶ȵ��������
function A=bian_lianjie2(p,N,alph,relink)
A=zeros(N);
p1=reshape(tril(p),[1,N*N]);
[p2,px]=sort(p1);
M=ceil(N*(N-1)/2*alph);
for i=1:M
    [m,n]=ind2sub(size(p),px(i));  %���±�������Ϊ˫�±�����
    A(m,n)=1;A(n,m)=1;
end

[m,n]=find(tril(A));               %��һ���ĸ������������
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
