clc, clear, n=9;
a=zeros(n); a(1,[2 3])=1; a(2,3)=1; a(3,[4 6])=1;
a(4,5)=1; a(5,[7 8 9])=1; a(6,7)=1; a(8,9)=1;
A=a+a'; %�����汸��
a=a'; a=sparse(a); 
d=graphallshortestpaths(a,'Directed',0); %����̾���
rhi=(n-1)./sum(sum(d)) %�����ʼ�������۶�
for t=1:n
    b=zeros(n); [i,j]=find(a); %�����бߵı��
    ind=find(A(t,:)); %�Ҷ���t���ھӽڵ�
    for k=1:length(ind)
        i(i==ind(k))=t; j(j==ind(k))=t; %��t�ھӽڵ�ı���滻Ϊt
    end
    for k=1:length(i)
        b(i(k),j(k))=1; %����t�ھӽڵ�����ӱ����t������
    end
    b(t,t)=0; 
    b=b+b'; b(:,ind)=[]; b(ind,:)=[]; %��t���ھӽڵ�ɾ��
    b=tril(b); b=sparse(b);
    dd=graphallshortestpaths(b,'Directed',0);
    rh(t)=(length(b)-1)/sum(sum(dd));
end
IMC=1-rhi./rh %�����ж�������۶�
bar(IMC)
