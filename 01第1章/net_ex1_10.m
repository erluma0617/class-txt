clc, clear
a=zeros(9);
a(1,[2:9])=[2 1 3 4 4 2 5 4];
a(2,[3 9])=[4 1]; a(3,4)=1; a(4,5)=1;
a(5,6)=5; a(6,7)=2; a(7,8)=3; a(8,9)=5;
a=a';  %ת��Matlab��Ҫ��������Ԫ��
a=sparse(a);  %ת��Ϊϡ�����
b=graphminspantree(a)
L=sum(sum(b))  %����С��������Ȩ��
view(biograph(b,[],'ShowArrows','off','ShowWeights','on'))  %����С������
