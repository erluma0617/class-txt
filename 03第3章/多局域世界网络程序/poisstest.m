function [h,p,st]=poisstest(dp); %�Զ���ȵ�poisson�ֲ��ķǲ������麯��
bins = dp(1,:);  %��ȡ�ȵ�ȡֵ
obsCounts=dp(2,:);  %��ȡ�ȵ�Ƶ��
n=sum(obsCounts);  %����ڵ������
lambdaHat=sum(bins.*obsCounts)/n;  %���ƶȵľ�ֵ
expCounts = n*poisspdf(bins,lambdaHat); %����������Ƶ�� 
[h,p,st]=chi2gof(bins,'ctrs',bins,'frequency',obsCounts,'expected',expCounts,'nparams',1) %����Matlab�ķǲ��������chi2��ϼ��鷨