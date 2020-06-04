function nweigval2
p1=0.05; N=100:2:1000; p2=0.1;
for i=1:length(N)
    lam1(i)=secondeig(N(i),2,p1);
end
subplot(121), plot(N,lam1), xlabel('\it N')
ylabel('\it \lambda_2','rotation',0)
for i=1:length(N)
    lam2(i)=secondeig(N(i),2,p2);
end
subplot(122), plot(N,lam2), xlabel('\it N')
ylabel('\it \lambda_2','rotation',0)
function lamda=secondeig(N,K,p)
A=zeros(N);    %�ڽӾ����ʼ��
for i=1:N      %�ò�ѭ�����������K���������ڽӾ���
   for j=i+1:i+K/2
       jj=(j<=N)*j+(j>N)*mod(j,N); %���j������N��Ҫȡ����N������
       A(i,jj)=1; A(jj,i)=1;
   end
end
B=rand(N); B=tril(B); %���������������ȡ�����ǲ���
C=zeros(N); C(B>=1-p)=1; C=C+C'; %B��Ӧ�²����ߵ������ڽӾ���
A=double(A|C); %���߼������㣬�����ӱ��Ժ���ڽӾ���
deg=sum(A); L=A-diag(deg); %�������
val=eigs(L,2,'la'); %��ǰ�����������ֵ
lamda=val(2); %����ڶ�������ֵ
