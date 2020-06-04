function wsratio %����Ҳ���Բ����庯�����Ѹ���ע��
N=1000; K=4; pp=[0.08:0.05:1]; %NΪ����ڵ�������KΪ����ڵ������ppΪ��������
for k=1:length(pp)
    p=pp(k);A=zeros(N);    %�ڽӾ����ʼ��
    for i=1:N      %�ò�ѭ�����������K���������ڽӾ���
       for j=i+1:i+K/2
           jj=(j<=N)*j+(j>N)*mod(j,N); %���j������N��Ҫȡ����N������
           A(i,jj)=1; A(jj,i)=1;
       end
    end
    for i=1:N    %�ò�ѭ�������������
       for j=i+1:i+K/2
           jj=(j<=N)*j+(j>N)*mod(j,N); 
           ChangeV=randi([1,N]); %�������������Ϊ��������������һ���ڵ�
           if rand<=p & A(i,ChangeV)==0 & i~=ChangeV  %����������
              A(i,jj) = 0; A(jj,i) = 0; %ɾ��ԭ��
              A(i,ChangeV)=1; A(ChangeV,i)=1;  %�����±�
           end
       end
    end
    deg=sum(A); L=A-diag(deg); %�������
    val=eigs(L,2,'la'); %��ǰ�����������ֵ
    lmin=val(2); %����ڶ�������ֵ
    lmax=eigs(L,1,'sa'); %����С����ֵ
    ratio(k)=abs(lmax/lmin);
end
[pp; ratio]  %��ʾ��������������ֵ֮�Ⱦ���ֵ֮��Ĺ�ϵ
plot(pp,ratio,'S-')
xlabel('\it p'), ylabel('\it \lambda_{max}/\lambda_{min}')
