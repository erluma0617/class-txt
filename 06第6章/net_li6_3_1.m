clc, clear
N=1000; gamma=2.4; m=4;
a=scale_free_net(1000,2.4,4);
deg=sum(a);  %����ڵ�Ķ�
degv=[min(deg):max(deg)]; %��ȵ�ȡֵ
pinshu=hist(deg,degv); %���ȡֵ��Ƶ��
ind=find(pinshu==0); %��Ƶ��Ϊ0�ĵ�ַ
degv(ind)=[]; pinshu(ind)=[]; %ɾ��Ƶ��Ϊ0����
loglog(degv,pinshu/N,'+-')
hold on, fx=@(x)0.1*x.^(-2.4);
x0=[1:degv(end)]; loglog(x0,fx(x0),'o-')
legend('�ȷֲ�','�ݺ���')
