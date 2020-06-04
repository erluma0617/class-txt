function nweigval %Ϊ�˵��������Զ���ĺ��������ﶨ��������
p=0:0.1:1;
for i=1:length(p)
    lam1(i)=secondeig(100,2,p(i)); %���������Զ���ĺ���
end
subplot(121), plot(p,lam1), xlabel('\it p')
ylabel('\it \lambda_2','rotation',0)
for i=1:length(p)
    lam2(i)=secondeig(400,2,p(i));
end
subplot(122), plot(p,lam2), xlabel('\it p')
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
val=eig(L); sv=sort(val,'descend'); %������ֵ���մӴ�С����
lamda=sv(2); %����ڶ�������ֵ
