function mysierpinski_n(x,y,L,n,N);
if nargin==0
x=10; y=20; %(x,y)Ϊ��ʼ�㣬ȡΪ��n�����ڵ�����һ��
L=100; n=3; N=20000; %LΪ��n���ε����ĵ�����ľ��룬NΪ�����ܵ���
end
t=pi/2:2*pi/n:2*pi+pi/2;   %��n���ζ��㸴����ʾ�ķ���
Pxy=L*complex(cos(t),sin(t)); %��n����n���������꣬������n+1���㣬��β������ͬ
P=complex(x,y);  %�����������ڵ�һ��
TP=[]; %�������ɵ�ĳ�ʼ�� 
gailv=randperm(N); %����1��N�����ȫ����
biaohao=zeros(size(gailv)); %N�����������Ӧ��1��n�ı�ŵĳ�ʼֵ
for k=1:n-1
    ind=(gailv>=(k-1)*N/n & gailv<k*N/n);
    biaohao(ind)=k;
end
ind=(gailv>=(n-1)*N/n); biaohao(ind)=n;
for k=biaohao
    P=0.5*(P+Pxy(k)); TP=[TP,P];
end
hold on, plot(TP,'.','markersize',5)  %���������ɵ��µ�
