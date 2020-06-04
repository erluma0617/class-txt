clc, clear
m=5; m0=8; e0=15; p=0.3; q=0.2; r=0.25; s=0.05; u=0.2;
m1=3; m2=5; m3=4; m4=6; alpha=1;
p=[p,q,r,s,u]; n=m; %nΪ��������ĸ���
pp=cumsum(p); %���ۻ����ʷֲ�
for i=1:m
    A{i}=generategraph(m0,e0); 
end
num(1:m)=m0; %����������Ľڵ���
Tno=[]; Tuv=[]; %���裨5��ȫ������ֵ�ĳ�ʼ��
for i=1:1000
    ind=find(pp>=rand);  %����һ�����������pp�д��ڸ�������ĵ�ַ
    switch ind(1)
        case 1
            n=n+1; A{n}=generategraph(m0,e0); %����һ���¾�������
            num(n)=length(A{n});
        case 2
            rn=randperm(n); k=rn(1); %ѡ��һ����������
            A{k}=addnode(A{k},m1,alpha); %�ӽڵ�
num(k)=length(A{k});
        case 3
            rn=randperm(n); k=rn(1); %ѡ��һ����������
            A{k}=addedge(A{k},m2,alpha); %�ӱ�
        case 4
            rn=randperm(n); k=rn(1); %ѡ��һ����������
            A{k}=deleteedge(A{k},m3,alpha); %ɾ����
        otherwise
            [no,uv]=addlongedge(A,m4,alpha); %�ӳ��̱�
            Tno=[Tno,no];  %���̱ߵľ��������ţ�ÿ�ж�Ӧһ����
            Tuv=[Tuv,uv];  %���̱��ڶ�Ӧ�ľ�������Ľڵ���
    end
end
B=blkdiag(A{:}); %ƴ�ֿ�ԽǾ��󣬹���һ������ڽӾ���
num=[0,num];  %Ϊ���㷽�㣬���һ��0;�����һ��Ҫ���⴦�� 
cnum=cumsum(num); %��������ڵ���ۼ�ֵ
for i=1:length(Tno)
    u=cnum(Tno(1,i))+Tuv(1,i); %���̱ߵ�һ���˵��������������еĽڵ���
    v=cnum(Tno(2,i))+Tuv(2,i); %���̱ߵ���һ���˵��������������еĽڵ���
    B(u,v)=1; B(v,u)=1;
end
dp1=mydegree(B);  %��ȵ�Ƶ���ֲ���
Matlab_to_Pajek(B); %����Pajek��Ҫ������
B=degreeaddedge(B); %�Զ�Ϊ0��1�Ľڵ�����ӱ�
dp2=mydegree(B);  %��ȵ�Ƶ���ֲ���
Matlab_to_Pajek(B,2); %����Pajek��Ҫ������
B=Locworldconnect(B); %�Թ����ľ��������������
dp3=mydegree(B);  %��ȵ�Ƶ���ֲ���
Matlab_to_Pajek(B,3);
[h,p,st]=poisstest(dp3) 
[D,L]=myAPL(B) %DΪ����ֱ����LΪƽ��·������
[TC,c]=mycluster(B) %TCΪ��������ľ���ϵ����cΪ�����ڵ�ľ���ϵ��
r=mycorrelations(B)   %������ϵ��
core=mycoreness(B)    %����ڵ�ĺ���
figure,plot([1:length(B)],sum(B),'-*'),
xlabel('�ڵ���'), ylabel('�ڵ�ȵ�ֵ')
save checkdata2 dp1 dp2 dp3 core
