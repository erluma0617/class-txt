clc, clear
N=200; K=10; p=0.0101; %NΪ�ڵ�����,KΪ����ڵ����,pΪ������ӱ߸���
lambda=[];
for k=1:500
A=zeros(N);    %�ڽӾ����ʼ��
for i=1:N      %�ò�ѭ�����������K���������ڽӾ���
   for j=i+1:i+K/2
       jj=(j<=N)*j+(j>N)*mod(j,N); %���j������N��Ҫȡ����N������
       A(i,jj)=1; A(jj,i)=1;
   end
end
B=rand(N); B=tril(B); %���������������ȡ�����ǲ���
C=zeros(N); C(B>=1-p)=1; C=C+C'; %C��Ӧ�²����ߵ������ڽӾ���
A2=double(A|C); %���߼������㣬�����ӱ��Ժ���ڽӾ���
deg2=sum(A2); L2=A2-diag(deg2);
val=eigs(L2,2,'la'); lambda=[lambda,val(2)];
end
fw=minmax(lambda) %��ڶ�������ֵ�ķ�Χ
