function A=WS_net(N,K,p);
A=zeros(N);    %�ڽӾ����ʼ��
for i=1:N      %�ò�ѭ�����������K���������ڽӾ���
   for j=i+1:i+K
       jj=(j<=N)*j+(j>N)*mod(j,N); %���j������N��Ҫȡ����N������
       A(i,jj)=1; A(jj,i)=1;
   end
end
for i= 1:N    %�ò�ѭ�������������
   for j=i+1:i+K
       jj=(j<=N)*j+(j>N)*mod(j,N); 
       ChangeV=randi([1,N]); %�������������Ϊ��������������һ���ڵ�
       if rand<=p & A(i,ChangeV)==0 & i~=ChangeV  %����������
          A(i,jj) = 0; A(jj,i) = 0; %ɾ��ԭ��
          A(i,ChangeV)=1; A(ChangeV,i)=1;  %�����±�
       end
   end
end
