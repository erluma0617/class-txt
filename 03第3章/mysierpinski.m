function mysierpinski(N)
if nargin==0; N=20000; end;
A=0; B=100; C=complex(50,sqrt(3)*50); %�ø�����ʾ��������������A��B��C������
P=10+20i;  %��ȡ�������ڵ�һ��
TP=[]; %�������ɵ�ĳ�ʼ�� 
gailv=randperm(N); %����1��N�����ȫ����
for k=gailv
       if k<N/3+1; 
           P=(P+A)/2; %�����µ�Ϊ��P��A���е� 
       elseif k<2*N/3+1 
           P=(P+B)/2; %�����µ�Ϊ��P��B���е�
       else 
           P=(P+C)/2; %�����µ�Ϊ��P��C���е�
       end 
       TP=[TP,P];  %TP�м����µ�
end 
plot(TP,'.','markersize',5)  %���������ɵ��µ�
