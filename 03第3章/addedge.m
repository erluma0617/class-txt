function b=addedge(a,m,alpha); 
%�������a��ʾԭ�����ڽӾ����������m��ʾ�ӱߴ�����
%alphaΪʽ��3.71���еĵ������ӣ��������bΪ�ӱ߲������������ڽӾ���
b=a; n=length(a); %nΪ��֪����Ľڵ���
for i=1:m
    deg=sum(b); %���㵱ǰ������ڵ�Ķ�
    LP=(deg+alpha)/sum(deg+alpha); %������ڵ�����Ӹ���
    pp=cumsum(LP);  %�����ۻ�����
    rnum=randperm(n);  %����1,2,��,n��ȫ����
    flag=1; %�ӱߵ�һ���˵��ŵĵ�ַ��Ĭ���ǵ�1������������
    while flag<=n & deg(rnum(flag))==n-1 %�ýڵ���������ﵽ���ֵ���޷��ӱ�
        flag=flag+1;
    end
    if flag==n+1, continue, end
    ind=find(pp>=rand); %����һ�����������pp��Ԫ�ش��ڸ�������ĵ�ַ,
    %��һ����ַ��Ϊ�ӱߵ�����һ���˵�
    if rnum(flag)~=ind(1) & b(rnum(flag),ind(1))==0 %�����˵㲻ͬ��ԭλ���ޱ�
        b(rnum(flag),ind(1))=1; b(ind(1),rnum(flag))=1;
    end   
end
