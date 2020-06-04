function myhierarchy(a,b,x,y,L,d,n)
%��a,b��Ϊͼ�ε�����,��x,y��Ϊÿһ�������,����ʱҪ��a=x,b=y
%LΪ�����α߳���dΪģ��֮��ľ��룬d>L��nΪ�ݹ����
hold on
mc=a+b*i; %����ͼ�ε�����
if n==1
    A=(x-L/2)+(y-L*tan(pi/6)/2)*i;  %���������ζ��������
    B=(x+L/2)+(y-L*tan(pi/6)/2)*i;
    C=x+(y+L*tan(pi/6))*i;
    ZX=(A+B+C)/3; %����ȱ����������������
    plot([ZX,C,B,A,mc],'.')
    plot([C,B,A,C])  %�������ε�������
    plot([ZX,A,mc]), plot([ZX,B,mc]), plot([ZX,C,mc]) %�����ĵ�����ı�
else
    xy=x+y*i;
    x01=x-d/2; y01=y-d*tan(pi/6)/2;  %�������������ĵ�����
    x02=x+d/2; y02=y-d*tan(pi/6)/2;
    x03=x;  y03=y+d*tan(pi/6);
    A0=x01+y01*i; B0=x02+y02*i; C0=x03+y03*i;
    plot([A0,B0,C0,A0])
    A1=(x01-L/2)+(y01-L*tan(pi/6)/2)*i;  %���������ζ��������
    B1=(x01+L/2)+(y01-L*tan(pi/6)/2)*i;
    C1=x01+(y01+L*tan(pi/6))*i;
    plot([xy,A1]), plot([xy,B1]), plot([xy,C1])
    A2=(x02-L/2)+(y02-L*tan(pi/6)/2)*i;  %���������ζ��������
    B2=(x02+L/2)+(y02-L*tan(pi/6)/2)*i;
    C2=x02+(y02+L*tan(pi/6))*i;
    plot([xy,A2]), plot([xy,B2]), plot([xy,C2])
    A3=(x03-L/2)+(y03-L*tan(pi/6)/2)*i;  %���������ζ��������
    B3=(x03+L/2)+(y03-L*tan(pi/6)/2)*i;
    C3=x03+(y03+L*tan(pi/6))*i;
    plot([xy,A3]), plot([xy,B3]), plot([xy,C3])
    myhierarchy(a,b,x,y,L,d/n,n-1)  %�ݹ����
    myhierarchy(a,b,x01,y01,L,d/n,n-1)  
    myhierarchy(a,b,x02,y02,L,d/n,n-1)
    myhierarchy(a,b,x03,y03,L,d/n,n-1)
end
