clc, clear
p=0.6; q=0.1; r=0.3;
pf=[p,q,r]; pp=cumsum(pf);
m0=2; m=2; a=zeros(m0);
for i=1:2000
    ind=find(pp>=rand);  %����һ�����������pp�д��ڸ�������ĵ�ַ
    if ind(1)==1
        a=addedge(a,m,1);   %�����Զ��庯��
    elseif ind(1)==2
        a=deleteadd(a,m,1);   %�����Զ��庯��
    else
        a=addnode(a,m,1);   %�����Զ��庯��
    end
end
dp=mydegree(a);  %��ȵ�Ƶ���ֲ���
subplot(1,2,1), plot(dp(1,:),dp(2,:)/length(a),'-o')
xlabel('��'),ylabel('�ȵ�Ƶ��'),title('��������')
subplot(1,2,2), loglog(dp(1,:),dp(2,:)/length(a),'-*')
xlabel('��'),ylabel('�ȵ�Ƶ��'), title('��������')
