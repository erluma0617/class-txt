clc, clear, n=13;
a=zeros(n); a(1,[2 3])=1; a(2,[3 4])=1;
a(3,4)=1; a(4,5)=1; a(5,[6 10])=1;
a(6,[7 8])=1; a(7,[8 9])=1; a(8,9)=1;
a(10,[11 12])=1; a(11,[12 13])=1; a(12,13)=1;
a=a+a'; %�����������ڽӾ���
s=zeros(n,1); %������һ���ĳ�ʼֵ
q=ones(n,1)/n; %�����ĳ�ֵ 
while sum(abs(s-q))>0.0001
    s=q; %�ѵ�ǰֵ����
    q=q+a*q; q=q/sum(q); %��������һ��
end
q %��ʾ���յĵ���ֵ
B=diag(sum(a))-a-ones(n); %����B����
C=inv(B); %����C����
for i=1:n
    for j=1:n
        Q(i,j)=1/(C(i,i)+C(j,j)-2*C(i,j)); %������Ϣ��
    end
end
Cv=1./mean(1./Q,2) %������Ϣָ��
xlswrite('biao7.xls',[q Cv])
[sq,ind1]=sort(q,'descend'); %��ָ��ֵ�Ӵ�С����
[sCv,ind2]=sort(Cv,'descend');
[ind1 ind2] %�Ƚ�����ָ��ֵ�ļ�����
subplot(121), bar(q), subplot(122), bar(Cv)
