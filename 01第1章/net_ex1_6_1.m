clc, clear
ni=[112 20 11 7]; n=sum(ni);
fi=[0:3];
phat=dot(ni,fi)/n/3  %����p�ļ�����Ȼ����ֵ
ph=binopdf([0:3],3,phat)  %�������۸���
ei=n*ph  %��������Ƶ��
eih=[ei(1:end-2),sum(ei(end-1:end))]  %����ϲ�������Ƶ��ֵ
nih=[ni(1:2), sum(ni(3:4))];
chistat=sum((eih-nih).^2./eih)
bd=chi2inv(0.95,1)  %����chi2������ٽ�ֵ
