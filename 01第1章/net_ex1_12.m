clc, clear
a=zeros(6);
a(1,[2 4])=[8 7]; a(2,[3 4])=[9 5]
a(3,[4 6])=[2 5]; a(4,5)=9; a(5,[3 6])=[6 10];
a=sparse(a);  %ת����ϡ�����
[c,d]=graphmaxflow(a,1,6)  %�������
view(biograph(d,[],'ShowArrows','on','ShowWeights','on'))  %���������
