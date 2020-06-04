clc, clear
a=0:0.01:1.6; n=500; S=[];
for j=1:length(a)
    x=0.2; y=0.3; %x,y�ĳ�ֵ
    for i=1:n
        x2=1-a(j)*x^2+y; y=0.3*x; x=x2; %���Ƚ������е���
    end
    if x(end)>-100 & x(end)<100 %������ɢ���ټ���ָ��
        x=0.2; y=0.3;
        JJ=eye(2);
        for i=1:n
            x2=1-a(j)*x^2+y; y=0.3*x; x=x2;
            J=[-2*a(j)*x, 1; 0.3, 0];
            JJ=JJ*J;
        end
        L=eigs(JJ,1); %��ģ��������ֵ
        S=[S,[a(j);log(abs(L))/n]]; %��aֵ��ָ��ֵ����
    end
end
plot(S(1,:),S(2,:),'.-') %����a��Ӧ�����Lyapunovָ��
hold on, plot([a(1),a(end)],[0,0],'k')
xlabel('\it a'), ylabel('���Lyapunovָ��')
