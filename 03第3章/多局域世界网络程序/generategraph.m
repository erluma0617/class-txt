function a=generategraph(m0,e0); %����m0���ڵ㣬e0���ߵ�������ڽӾ���a
if e0>m0*(m0-1)/2
    fprintf('��������m0,e0��ƥ��\n'); return
end
a=zeros(m0); %�ڽӾ����ʼ��
ra=rand(m0); %����m0�׵��������
ra=tril(ra); %��ȡ�����ǲ���Ԫ��
ra([1:m0+1:end])=0; %�Խ���Ԫ����0
[sra,ind]=sort(nonzeros(ra),'descend'); %�Ѿ���ra�еķ���Ԫ�ذ��մӴ�С����
p=sra(e0);  %��ȡ�����ĵ�e0��Ԫ��
a(ra>=p)=1; %����e0���ߵ��ڽӾ����������Ԫ��
a=a+a';  %�����������ڽӾ���
