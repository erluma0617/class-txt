function B=Locworldconnect(A);
C=tril(A); C=sparse(C);%����Matlab��������Ҫ���ڽӾ���������Ԫ��ϡ�����
[num,label]=graphconncomp(C,'directed',0);%����ͨ��֧����ÿ���ڵ�ķ�֧���
if num==1
    B==A; return %һ����ͨ��֧ʱ������
end
for i=1:num
    n{i}=find(label==i);  %���i����ͨ��֧�еĽڵ���
end
B=A; deg=sum(A);  %������ڵ�Ķ�
for i=1:num
    p1=(deg(n{i})+1)/sum(deg(n{i})+1);   %��ȡ��i����֧���ڵ�Ķ�
    pp1=cumsum(p1); %���ۻ�����
    ii=(i+1)*(i+1<=num)+mod(i+1,num)*(i+1>num); %i+1��֧��ŵ�ת��
    p2=(deg(n{ii})+1)/sum(deg(n{ii})+1); %��ȡ��i+1��֧�ڵ�Ķ�
    pp2=cumsum(p2);  %���ۻ�����
    ind1=find(pp1>=rand);  %����һ�����������pp1�д��ڵ��ڸ�������ĵ�ַ
    ind2=find(pp2>=rand);  %����һ�����������pp2�д��ڵ��ڸ�������ĵ�ַ
    B(n{i}(ind1(1)),n{ii}(ind2(1)))=1; %������������֮������  
    B(n{ii}(ind2(1)),n{i}(ind1(1)))=1; 
end
