clc, clear
alpha=0.25; beta=0.3;
m=15; n=10; s=10; %��������ڵ��ݺ��������ˮƽ�ʹ�ֱ���
u=0:s:(m-1)*s; v=0:s:(n-1)*s;
[u,v]=meshgrid(u,v); %��������ڵ�ĺ������������
u=u(:); v=v(:);  %ת����������
hold on, plot(u,v,'*')  %��m��n����
uv=[u';v'];  %����m��n���������
d=dist(uv);  %��m��n����֮��������������
L=max(max(d)); %��������
gailv=alpha*exp(-d/(beta*L)); %������ʾ���
gailv=tril(gailv);  %��ȡ���ʾ����������Ԫ��
gailv(1:m*n+1:end)=0; %���ʾ���ĶԽ���Ԫ����0
randnum=rand(m*n); %���ɷ���[0,1]�Ͼ��ȷֲ��������150��150����
[i,j]=find(randnum<=gailv) ;  %�ڵ�i��j֮������
a=zeros(m*n); %�ڽӾ����ʼ��
for k=1:length(i)
    a(i(k),j(k))=1; a(j(k),i(k))=1;  %�����ڽӾ���
    plot([u(i(k)),u(j(k))],[v(i(k)),v(j(k))]); %�ڵ�i��j֮�仭��
end
deg=sum(a); %�������нڵ�Ķ�
dminmax=minmax(deg)  %��ȵ���Сֵ�����ֵ
pinshu=hist(deg,[dminmax(1):dminmax(2)]); %�����ȡֵ��Ƶ��
figure, loglog([dminmax(1):dminmax(2)],pinshu,'.-') %��������ϵ��ͼ
xlabel('��'), ylabel('�ȵ�Ƶ��')
Matlab_to_Pajek(a)  %����Pajek���ݣ��ļ���ΪPajek_data1.net
