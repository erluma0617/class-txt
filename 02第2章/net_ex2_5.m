clc, clear, format rat
n=6; a=zeros(n);
a(1,[2 3 5])=1; a(2,[3 4])=1; %�����ڽӾ����������Ԫ��
a(3,6)=1; a(4,6)=1;
a=a+a'; %�����������ڽӾ���
d=sum(a)  %�����ڽӾ�����к�,�����ڵ�Ķ�
degrange=minmax(d); %���ȡֵ����Сֵ�����ֵ
ud=[degrange(1): degrange(2)] %��ʾ�ȵ�ȡֵ
pinshu=hist(d,ud); %���ȡֵ��Ƶ��
df=[ud; pinshu/n] %��ȵ�Ƶ�ʷֲ���
ave_degree=mean(d)  %����ƽ����
M=sum(d)/2;  %�����ܱ������ߵ������������е�ȵĺ͵�һ��
[i,j]=find(triu(a)); %��a����������Ԫ���еķ���Ԫ�����ڵ��б���б꣬��ÿ���ߵ������˵�
ki=d(i); kj=d(j); %��ȡ���бߵ����Ⱥ��յ��
kij=[ki' kj'];  kij=sort(kij,2); %���д�С��������
bpin=[]; %���϶ȷֲ��ĳ�ʼ��
for i=1:length(ud)
    for j=i:degrange(2)
        b(i,j)=0; kk=[];
        for k=1:size(kij,1)
            b(i,j)=b(i,j)+length(findstr(kij(k,:),[i,j]));
            if length(findstr(kij(k,:),[i,j]))
                kk=[kk,k]; %��¼�ҵ�������
            end
        end
        kij(kk,:)=[]; %ɾ�����ҵ�������
        bpin=[bpin, [i;j;b(i,j)/M]];
    end
end
bpin%��ʾ���϶ȷֲ�����1,2��Ϊ��ֵ����3��Ϊ�����Ƶ��
knni=d*a./d  %���������ƽ����ֵ
for i=1:length(ud)
    ind=(d==ud(i)); 
    knn(i)=sum(knni(ind))/pinshu(i);
end
knn=[ud;knn] %��ʾ�����ƽ����ֵ��ƽ��ֵ����һ���Ƕȵ�ȡֵ���ڶ����Ǽ���õ���ƽ��ֵ
r=mycorrelations(a)  %����Pearson���ϵ��
core=mycoreness(a)  %�������
