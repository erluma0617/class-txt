clc, clear
m0=input('������δ����ǰ������ڵ����m0: ');
m=input('������ÿ�������½ڵ�ʱ�����ɵı���m�� ');
N=input('�����������������ڵ�����N�� ');
disp('��ʼ����ʱm0���ڵ�����������1��ʾ���ǹ����㣻2��ʾ������ȫͼ��3��ʾ�������һЩ��');
se=input('��ѡ���ʼ�������1��2��3�� ');
if m>m0
    disp('�������m���Ϸ�'); return;
end
x=100*rand(1,m0); y=100*rand(1,m0);  %�����ʼ���ڻ�ͼ��m0���ڵ�����
if se==1
    A=zeros(m0);
elseif se==2
    A=ones(m0); A(1:m0+1:m0^2)=0; %�Խ���Ԫ����0
else
    A=zeros(m0); B=rand(m0); B=tril(B); %��ȡ������Ԫ��
    A(B<=0.1)=1; %���ո���0.1��������
    A=A+A';  %�����������ڽӾ���
end 
for k=m0+1:N
    x(k)=100*rand; y(k)=100*rand; %�������ڵ�ǰ�ڵ㻭ͼ������
    p=(sum(A)+1)/sum(sum(A)+1); %�������нڵ�����Ӹ���
    pp=cumsum(p); %���ۻ��ֲ�
    A(k,k)=0;   %�����µ�����֮ǰ���ڽӾ�������ά��
    ind=[]; %�½ڵ������ڵ�ĳ�ʼ����
    while length(ind)<m
        jj=find(pp>rand); jj=jj(1); %�ö��ַ�ѡ�����߽ڵ�ı��
        ind=union(ind,jj); %ʹ��union��֤ѡ��Ľڵ㲻�ظ�
    end
    A(k,ind)=1; A(ind,k)=1; %����ӱ��Ժ��µ��ڽӾ���
end
plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','markersize',8);
hold on, A2=tril(A); [i,j]=find(A2); %���ڽӾ���������Ԫ�صķ���Ԫ��
for k=1:length(i)
    plot([x(i(k)),x(j(k))],[y(i(k)),y(j(k))],'linewidth',1.2)
end
deg=sum(A)  %�����ڽӾ�����к�,�����ڵ�Ķ�
ave_degree=sum(deg)/N  %����ƽ����
figure, bar([1:N],deg); %�����ڵ�ȵ���״ͼ
title('����ͼ���ڵ�ȴ�С');
xlabel('$v_{i}$','Interpreter','Latex'), ylabel('$k$','Interpreter','Latex')
degrange=minmax(deg); %��ȵ�ȡֵ��Χ
pinshu=hist(deg,[degrange(1): degrange(2)]);%���ȡֵ��Ƶ��
df=pinshu/N; %��ȵ�Ƶ�ʷֲ�
figure, bar([degrange(1):degrange(2)],df,'r')  %���ȷֲ���״ͼ
title('����ͼ�Ķȷֲ�');
xlabel('$k$','Interpreter','Latex'), ylabel('$P$','Interpreter','Latex')
Matlab_to_Pajek(A,2)  %����Pajek���ݣ��ļ���ΪPajek_data2.net
