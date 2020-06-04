clc, clear, hold on
N=100; K=4; p=0.15; %NΪ����ڵ�����,KΪ����ڵ����,pΪ������ӱ߸���
t=0:2*pi/N:2*pi-2*pi/N;  %������������������ڵ�����Ĳ������̵ĽǶ�
x=100*sin(t); y=100*cos(t);
plot(x,y,'ko','MarkerEdgeColor','k','MarkerFaceColor','r','markersize',6);
A=zeros(N);    %�ڽӾ����ʼ��
for i=1:N      %�ò�ѭ�����������K���������ڽӾ���
   for j=i+1:i+K/2
       jj=(j<=N)*j+(j>N)*mod(j,N); %���j������N��ȡ����N������
       A(i,jj)=1; A(jj,i)=1;
   end
end
B=rand(N); B=tril(B); %���������������ȡ�����ǲ���
C=zeros(N); C(B>=1-p)=1; C=C+C'; %C��Ӧ�²����ߵ������ڽӾ���
A=A|C; %���߼������㣬�����ӱ��Ժ���ڽӾ���
for i=1:N-1 
    for j=i+1:N
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2); 
        end
    end
end
Matlab_to_Pajek(A)  %����Pajek���ݣ��ļ���ΪPajek_data1.net
