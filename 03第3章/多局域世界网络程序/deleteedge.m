function b=deleteedge(a,m,alpha); 
%�������a��ʾԭ�����ڽӾ����������m��ʾɾ������������
%alphaΪʽ��3.73���е������ӣ��������bΪm�β������������ڽӾ���
b=a; n=length(a); %nΪ��֪����Ľڵ���
for i=1:m
    deg=sum(b); %���㵱ǰ������ڵ�Ķ�
    LP=(1-(deg+alpha)/sum(deg+alpha))/(n-1); %������ڵ��Ӧ�ߵ�ɾ������
    pp=cumsum(LP);  %�����ۻ�����
rnum=randperm(n); %����1,2,��,n��ȫ����
flag=1; %�̶��˵��ŵĵ�ַ��Ĭ���ǵ�1������������
    while flag<n & deg(rnum(flag))==0 %��ǰ�ڵ�Ϊ�����㣬ȡ��һ���ڵ�
        flag=flag+1;
    end
    if flag==n & deg(rnum(flag))==0
        continue %��ǰ�ڵ�Ϊ�����㣬ѭ��������һ��ȡֵ
    end
    ind=find(pp>=rand); %����һ�����������pp��Ԫ�ش��ڸ�������ĵ�ַ,
    %��һ����ַ��Ϊɾ���ߵ�����һ���˵�
    if b(rnum(flag),ind(1))==1
        b(rnum(flag),ind(1))=0; b(ind(1),rnum(flag))=0;  %ɾ��ԭ��
    end
end
