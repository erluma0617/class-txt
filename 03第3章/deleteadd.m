function b=deleteadd(a,m,alpha); 
%�������a��ʾԭ�����ڽӾ����������m��ʾ��������������
%alphaΪʽ��3.71���е������ӣ��������bΪm�����²������������ڽӾ���
b=a; n=length(a); %nΪ��֪����Ľڵ���
for i=1:m
    deg=sum(b); %���㵱ǰ������ڵ�Ķ�
    LP=(deg+alpha)/sum(deg+alpha); %������ڵ�����Ӹ���
    pp=cumsum(LP);  %�����ۻ�����
    rnum=randperm(n); %����1,2,��,n��ȫ����
    flag=1; %�̶��˵��ŵĵ�ַ��Ĭ���ǵ�1������������
    while flag<n & deg(rnum(flag))==0 %��ǰ�ڵ�Ϊ�����㣬ȡ��һ���ڵ�
        flag=flag+1;
    end
    if flag==n & deg(rnum(flag))==0
        continue %��ǰ�ڵ�Ϊ�����㣬ѭ��������һ��ȡֵ
    end
    ind1=find(b(:,rnum(flag))); %�ҹ̶��˵�i���ھӽڵ�
    rnum2=randperm(length(ind1)); %����ȫ����
    cnode=ind1(rnum2(1)); %cnodeΪ����ɾ���ߵ�����һ���˵�
    ind2=find(pp>=rand); %����һ�����������pp��Ԫ�ش��ڸ�������ĵ�ַ,
    %��һ����ַ��Ϊ�ӱߵ�����һ���˵�j'
    if rnum(flag)~=ind2(1) & b(rnum(flag),ind2(1))==0
        b(rnum(flag),cnode)=0; b(cnode,rnum(flag))=0;  %ɾ��ԭ��
        b(rnum(flag),ind2(1))=1; b(ind2(1),rnum(flag))=1; %����±�
    end
end
