function [TC,c]=mycluster(a);
%�������TC����������ľ���ϵ����cΪ�����ڵ�ľ���ϵ��������������ڽӾ���
n=length(a);
for i=1:n
    m=find(a(i,:));  %�ҵ�i�з���Ԫ�ĵ�ַ
    ta=a(m,m); %��ȡ�ڵ�vi�������ھӽڵ������ɵ��ڽӾ���
    Lta=tril(ta); %��ȡ�ھӽڵ��������ڽӾ����������Ԫ��
    if  length(m)==0 | length(m)==1
        c(i)=0;  %�����ڵ��ֻ��1���ھӵĽڵ�ľ���ϵ������Ϊ0
    else
        c(i)=sum(sum(Lta))/nchoosek(length(m),2); %��ڵ�vi�ľ���ϵ��
    end
end
TC=mean(c);  %����������ľ���ϵ��
