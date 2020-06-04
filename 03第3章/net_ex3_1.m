clc, clear, hold on
N=20; K=4; p=0.2; %NΪ����ڵ�������KΪ����ڵ������pΪ��������
t=0:2*pi/N:2*pi-2*pi/N;  %������������������ڵ�����Ĳ������̵ĽǶ�
x=100*sin(t); y=100*cos(t);
plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','markersize',6);
A=zeros(N);    %�ڽӾ����ʼ��
for i=1:N      %�ò�ѭ�����������K���������ڽӾ���
   for j=i+1:i+K/2
       jj=(j<=N)*j+(j>N)*mod(j,N); %���j������N��Ҫȡ����N������
       A(i,jj)=1; A(jj,i)=1;
   end
end
for i= 1:N    %�ò�ѭ�������������
   for j=i+1:i+K/2
       jj=(j<=N)*j+(j>N)*mod(j,N); 
       ChangeV=randi([1,N]); %�������������Ϊ��������������һ���ڵ�
       if rand<=p & A(i,ChangeV)==0 & i~=ChangeV  %����������
          A(i,jj) = 0; A(jj,i) = 0; %ɾ��ԭ��
          A(i,ChangeV)=1; A(ChangeV,i)=1;  %�����±�
       end
   end
end
for i=1:N-1 
    for j=i+1:N
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2); 
        end
    end
end
Matlab_to_Pajek(A)  %���ڽӾ���Aת��ΪPajek��ʽ�����ݣ����ﺯ��Matlab_to_Pajek�������Լ���д�ĺ��������������3.2��
