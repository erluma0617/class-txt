clc, clear
m=5; m0=8; e0=15; p=0.3; q=0.2; r=0.25; s=0.05; u=0.2;
m1=3; m2=5; m3=4; m4=6; alpha=0.5;
p=[p,q,r,s,u]; n=m; %������������ĳ�ʼ��
pp=cumsum(p); %���ۻ����ʷֲ�
for i=1:m
    A{i}=generategraph(m0,e0); 
end
num(1:m)=m0; %����������Ľڵ���
Tno=[]; Tuv=[]; %���裨5��ȫ������ֵ�ĳ�ʼ��
for i=1:2000
    ind=find(pp>=rand);  %����һ�����������pp�д��ڸ�������ĵ�ַ
    switch ind(1)
        case 1
            n=n+1; A{n}=generategraph(m0,e0);   %�����Զ��庯��
            num(n)=length(A{n});
        case 2
            rn=randperm(n); k=rn(1); %ѡ��һ����������
            A{k}=addnode(A{k},m1,alpha); num(k)=length(A{k});
        case 3
            rn=randperm(n); k=rn(1); %ѡ��һ����������
            A{k}=addedge(A{k},m2,alpha);
        case 4
            rn=randperm(n); k=rn(1); %ѡ��һ����������
            A{k}=deleteedge(A{k},m3,alpha);
        otherwise
            [no,uv]=addlongedge(A,m4,alpha);
            Tno=[Tno,no];  %���̱ߵľ��������ţ�ÿ�ж�Ӧһ����
            Tuv=[Tuv,uv];  %���̱��ڶ�Ӧ�ľ�������Ľڵ���
    end
end
B=blkdiag(A{:}); %ƴ�ֿ�ԽǾ��󣬹���һ������ڽӾ���
num=[0,num];  %Ϊ���㷽�㣬���һ��0 
cnum=cumsum(num); %��������ڵ���ۼ�ֵ
for i=1:length(Tno)
    u=cnum(Tno(1,i))+Tuv(1,i); %���̱ߵ�һ���˵��������������еĽڵ���
    v=cnum(Tno(2,i))+Tuv(2,i); %���̱ߵ���һ���˵��������������еĽڵ���
    B(u,v)=1; B(v,u)=1;
end
dp=mydegree(B);  %��ȵ�Ƶ���ֲ���
d=dp(1,:)';  %��ȡ�ȵ�ȡֵ,��ת����������
gd=(dp(2,:)/length(B))';  %��ȵ�Ƶ�ʷֲ�����ת����������
subplot(1,2,1), plot(d,gd,'-o')
xlabel('��'),ylabel('�ȵ�Ƶ��'),title('��������')
subplot(1,2,2), loglog(d,gd,'-*')
xlabel('��'),ylabel('�ȵ�Ƶ��'), title('��������')
Matlab_to_Pajek(B); %���ڽӾ���ת����Pajek����
