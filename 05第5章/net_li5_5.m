clc, clear, m0=3; m=3; N=2000;
A=ones(m0); A(1:m0+1:m0^2)=0; %�Խ���Ԫ����0
for k=m0+1:N
    p=(sum(A)+1)/sum(sum(A)+1); %�������нڵ�����Ӹ���
    pp=cumsum(p); %���ۻ��ֲ�
    A(k,k)=0;   %�����µ�����֮ǰ���ڽӾ�������ά��
    ind=[]; %�½ڵ������ڵ�ĳ�ʼ����
    while length(ind)<m
        jj=find(pp>rand); jj=jj(1); %�ö��ַ�ѡ�����߽ڵ�ı��
        ind=union(ind,jj); %ʹ��union��֤ѡ��Ľڵ㲻�ظ�
    end
    A(k,ind)=1; A(ind,k)=1; %����ӱ��Ժ��µ��ڽӾ���
end
L=A-diag(sum(A));
val=eigs(L,2,'la'); lambda=val(2); lambda1=lambda;
dp=[0:0.01:0.05]; %ɾ���ڵ�ı���
for i=2:length(dp);
    B=A; nf=floor(N*dp(i));
    rint=randperm(N); %����һ�������������
    db=rint([1:nf]); %ɾ���ڵ�ı��
    B(db,:)=[]; B(:,db)=[];
    L=B-diag(sum(B)); 
    val=eigs(L,2,'la'); lambda1=[lambda1,val(2)];
end
lambda1, subplot(121), plot(dp,lambda1,'o-')
xlabel('ɾ������\itp'), ylabel('�ڶ�������ֵ\it\lambda_2')
deg=sum(A); [sd,ind2]=sort(deg,'descend'); %�ѶȰ��մӴ�С����
lambda2=lambda; st=[];
for i=2:length(dp)
    B=A; B2=tril(A); B2=sparse(B2);
    s=graphconncomp(B2,'Directed',0); %������ͨ��֧�ĸ���
    st=[st,s]; %��¼��Ӧ����ͨ��֧����
    nf2=floor(N*dp(i)); %����ɾ���Ľڵ���
    db=ind2(1:nf2); %ɾ���Ľڵ���
    B(db,:)=[]; B(:,db)=[];
    L=B-diag(sum(B));
    val=eigs(L,2,'la'); lambda2=[lambda2,val(2)];
end
lambda2, subplot(122), plot(dp,lambda2,'*-')
xlabel('ɾ������\itp'), ylabel('�ڶ�������ֵ\it\lambda_2')
st %��ʾ��ͨ��֧�ĸ���
