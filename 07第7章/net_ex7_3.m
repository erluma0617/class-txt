clc, clear
a=zeros(13); a(1,[2 3])=1; a(2,[3 4])=1;
a(3,4)=1; a(4,5)=1; a(5,[6 10])=1;
a(6,[7 8])=1; a(7,[8 9])=1; a(8,9)=1;
a(10,[11 12])=1; a(11,[12 13])=1; a(12,13)=1;
b=a'; b=sparse(b);
d=graphallshortestpaths(b,'Directed',0); %�����ж����֮�����̾���
dd=sum(d); %������
Cc=12./dd %�����һ���Ľӽ���ָ��
a=a+a'; %�����ڽӾ���
[vec,val]=eigs(a,1);
Ce=vec/sum(vec) %������������һ��
xlswrite('biao.xls',Cc); xlswrite('biao.xls',Ce',1,'A3')
subplot(121), bar(Cc), subplot(122), bar(Ce)
