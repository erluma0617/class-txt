function dp=mydegree(a);
%����ֵdp�Ƕȵ�Ƶ���ֲ������ĵ�һ���Ƕȵ�ȡֵ���ڶ����Ƕ�Ӧ�ȵ�Ƶ��
%�������aΪ�ڽӾ���
N=length(a);  %����ڵ�ĸ���
deg=sum(a);  %����ڵ�Ķ�
degrange=minmax(deg); %��ȵ�ȡֵ��Χ
pinshu=hist(deg,[degrange(1): degrange(2)]);%���ȡֵ��Ƶ��
ind=find(pinshu==0); %��Ƶ��Ϊ0�ĵ�ַ
dp=[[degrange(1):degrange(2)]; pinshu];  %����Ƶ���ֲ���
dp(:,ind)=[]; %ɾ��Ƶ��Ϊ0����
df=dp(2,:)/N; %��ȵ�Ƶ�ʷֲ�
figure, bar(dp(1,:),df,'r')  %���ȵ�Ƶ�ʷֲ���״ͼ
title('����ͼ�Ķȷֲ�');
xlabel('$k$','Interpreter','Latex'), ylabel('$P$','Interpreter','Latex')
