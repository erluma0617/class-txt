function A=scale_free_net(N,gamma,m)
%Goh�������������ָ���ɵ����ޱ�����磬A����Ϊ�ڽӾ���
%�����ģN,�ޱ��ָ��gamma(gamma>2),mΪ�����ƽ���ȵ�һ��
alpha=1/(gamma-1);
p=[1:N].^(-alpha); %��Ȩֵ
p=p/sum(p);   %��һ��
cp=cumsum(p); %���ۻ���
A=zeros(N,N);t=0;
while t<m*N        %��Ȩ�ظ��ʼӱ�
    r1=rand; r2=rand; %����һ�������
    u=find(cp>=r1,1);v=find(cp>=r2,1); %�����ɱߵĶ�����
    if u~=v && A(u,v)==0
        A(u,v)=1; A(v,u)=1; t=t+1;
    end
end
