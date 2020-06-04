clc, clear
m0=[3 5 7]; m=m0; N=500; hold on
for i=1:length(m0)
   lambda=[]; NN=[10:10:1000];
    for j=1:length(NN)
        A=ones(m0(i)); A(1:m0(i)+1:m0(i)^2)=0; %�Խ���Ԫ����0
        for k=m0(i)+1:NN(j)
        p=(sum(A)+1)/sum(sum(A)+1); %�������нڵ�����Ӹ���
        pp=cumsum(p); %���ۻ��ֲ�
        A(k,k)=0;   %�����µ�����֮ǰ���ڽӾ�������ά��
        ind=[]; %�½ڵ������ڵ�ĳ�ʼ����
        while length(ind)<m(i)
        jj=find(pp>rand); jj=jj(1); %�ö��ַ�ѡ�����߽ڵ�ı��
        ind=union(ind,jj); %ʹ��union��֤ѡ��Ľڵ㲻�ظ�
        end
        A(k,ind)=1; A(ind,k)=1; %����ӱ��Ժ��µ��ڽӾ���
        end
        L=A-diag(sum(A)); val=eigs(L,2,'la'); 
        lambda=[lambda,val(2)];
    end
    plot(NN,lambda), lambda  %��������ʾ����ֵ
end
xlabel('\it N'), ylabel('\it \lambda_2','rotation',0)
text(400,-1.5,'\it m=3'), text(400,-3.4,'\it m=5')
text(400,-5.1,'\it m=7')
