clc, clear
bins=0:3; %�������������
obsCounts=[112 20 11 7]; %������Ĺ۲�Ƶ��
n=sum(obsCounts); %������������
pHat = sum(bins.*obsCounts)/n/3; %����p�ļ�����Ȼ����ֵ
pd= makedist('bino','n',3,'p',pHat)  %�������ֲ�
[h,p,st]=chi2gof(bins,'cdf',pd,'ctrs',bins,'frequency',obsCounts,'nparams',1)
