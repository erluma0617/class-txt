clc, clear
dv=[2  5  4  10  7  9]'; n=length(dv);
idv=2*max(dv)-dv; %��dv�������ͨ�������ǰ��մ�С�������е���Ŷ���
rv=tiedrank(idv)  %����Matlab���ȵ�����
a=[ones(n,1),log(rv)]; 
cs=a\log(dv)  %��������С���˷�������Իع�ĳ������һ����ϵ��
R=-cs(2)  %��ȡ��ָ��
