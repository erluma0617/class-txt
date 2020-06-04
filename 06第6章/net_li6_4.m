clc; clear; N=200; m=8;
Dm=zeros(1,10);  Ds=zeros(1,10);  Dg=zeros(1,10);
for t=1:10
    gamma=[2.01,2.05,2.1,2.2,2.5,3,4,6,8,10];
    A=scale_free_net(N,gamma(t),m);
    AA=tril(A); AA=sparse(AA); %����Matlabͼ�۹�������Ҫ��ϡ�����
    d1=0; d2=0;
    for i=1:N-1
        for j=i+1:N
            [dd,path,d,road]=refine_DS(A,i,j);
            d1=d1+dd; d2=d2+d;
        end
    end
    Dm(t)=2*d1/(N*(N-1));
    Dg(t)=2*d2/(N*(N-1));
    d3=graphallshortestpaths(AA,'Directed',0); %����Matlab����������̾���
    Ds(t)=sum(sum(tril(d3)))*2/(N*(N-1)); %��ƽ������
end
plot(gamma,Dm,'rs-',gamma,Dg,'b^-',gamma,Ds,'ko-')
legend('HDS����','�Ľ�HDS����','Floyd�㷨', 'Location', 'northwest')
xlabel('\gamma'), ylabel('ƽ��·������')
