%% ���ɻ���2�������ʴӴ�С�������Ӹ�������ǰ��Ľڵ�ԣ�ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph
%% ��һ���Ľ�С����������������ʵ��һ���̶ȵ��������   �����⣡��������������
function A=bian_lianjie2(p,N,alph,relink)
A=zeros(N);
p1=reshape(tril(p),[1,N*N]);
[p2,px]=sort(p1,'descend');
M=ceil(N*(N-1)/2*alph)
for k=1:M
    [m,n]=ind2sub(size(p),px(k));  %���±�������Ϊ˫�±�����
    A(m,n)=1;A(n,m)=1;
end
[m,n]=find(tril(A));               %��һ���ĸ������������
for i=1:length(m)
    p1=rand(1,1);
    if relink>p1                          %����������������ʴ������ɵ�������������������
         A(m(i),n(i))=0;A(n(i),m(i))=0;   %�ȶϿ�ԭ���ıߣ������ѡ��һ������֮����  
         A(m(i),m(i))=inf;
         n1=find(A(m(i),:)==0);      
         random_data=randint(1,1,[1,length(n1)]);
         nn=n1(random_data);
         A(m(i),nn)=1;A(nn,m(i))=1;
         A(m(i),m(i))=0;
    end
end