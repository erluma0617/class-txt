function mysierpinski2(x,y,L,n)
if nargin==0; x=0; y=0; L=100; n=6; end
%x,yΪ���������ĵ����꣬LΪ�����α߳���nΪ�ݹ����
axis off, hold on
if n==1
    x1=x-L/2; y1=y-L*tan(pi/6)/2;  %���������ζ��������
    x2=x+L/2; y2=y-L*tan(pi/6)/2;
    x3=x; y3=y+L*tan(pi/6)/2;
    plot([x1;x2],[y1;y2]); plot([x2;x3],[y2;y3]); plot([x3;x1],[y3;y1]) %�������εı�
else
    x01=x-L/4; y01=y-L*tan(pi/6)/4;  %����С���������ĵ�����
    x02=x+L/4; y02=y-L*tan(pi/6)/4;
    x03=x;  y03=y+L*tan(pi/6)/4;
    mysierpinski2(x01,y01,L/2,n-1)  %�ݹ����
    mysierpinski2(x02,y02,L/2,n-1)
    mysierpinski2(x03,y03,L/2,n-1)
end 
