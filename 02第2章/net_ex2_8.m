clc, clear, format rat
n=6; a=zeros(n);
a(1,[2 3 5])=[3 5 2]; %�����ڽӾ����������Ԫ��
a(2,[3 4])=[1 6]; a(3,6)=3; a(4,6)=4;
a=a+a'; %�����������ڽӾ���
Si=sum(a) %�����Ȩ
b=(a>0.5); %�����Ӧ����Ȩ�ڽӾ���
ki=sum(b); %������ڵ�Ķ�
Ui=Si./ki %������ڵ�ĵ�λȨ
SSi=repmat(Si,size(a,1),1); %��Si�����aͬά���ľ���
Yi=sum((a./SSi).^2) %������ڵ��Ȩ�ز�����
kr=minmax(ki); %��ȵ�ȡֵ����Сֵ�����ֵ
uk=[kr(1):kr(2)]; %ö�ٶȵ�ȡֵ
pinshu=hist(ki, uk) %���ȡֵ��Ƶ��
df=[uk; pinshu/n] %��ȵ�Ƶ�ʷֲ���
for i=1:length(pinshu)
    Svv(i)=sum(Si(ki==uk(i)))/pinshu(i); %������ڽڵ��Ȩ-�������
end
SSvv=[uk; Svv] %��ʾ���ڽڵ��Ȩ-�������
for i=1:n
    m=find(a(i,:));%�ҵ�i�з���Ԫ�ĵ�ַ
    ta=a(m,m); %��ȡ�ڵ�vi�������ھӽڵ������ɵ��ڽӾ���
    maxw=max(a(i,:)); %��ڵ�vi�����ߵ�Ȩֵ�е����ֵ
    if  length(m)==0 | length(m)==1
        c(i)=0; %�����ڵ��ֻ��1���ھӵĽڵ�ľ���ϵ������Ϊ0
    else
        s1=0; s2=0;
        for j=1:length(m)-1
            for k=j+1:length(m);
                s1=s1+a(i,m(j))*a(i,m(k))*a(m(j),m(k));
                s2=s2+a(i,m(j))*a(m(k),i);
            end
        end
        c(i)=s1/s2/maxw; %��ڵ�vi�ĸ�Ȩ����ϵ��
    end
end
c
