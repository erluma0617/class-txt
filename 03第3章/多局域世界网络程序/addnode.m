function b=addnode(a,m,alpha); 
%�������a��ʾԭ�����ڽӾ����������m��ʾ���ܵ�������
%alphaΪʽ��3.71���е������ӣ��������bΪ�������ڽӾ���
b=a; n=length(a); %nΪ��֪����Ľڵ���
if m>n
    return %�������ݲ�ƥ�䣬����
end
for i=1:m
    LP=(sum(b)+alpha)/sum(sum(b)+alpha); %������ڵ�����ø���
    pp=cumsum(LP);  %�����ۻ�����
    ind=find(pp>=rand); %����һ�����������pp��Ԫ�ش��ڸ�������ĵ�ַ,
    %��һ����ַ��Ϊ�ӱߵ�����һ���˵�
    b(n+1,ind(1))=1; b(ind(1),n+1)=1;
end
