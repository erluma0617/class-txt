function net_ex9_6_2
clc, global A B, load AB %����ȫ�ֱ���������������
fxy=@(xy)sum(xy); %���������Ŀ�꺯��
Aeq=[ones(1,3),zeros(1,3);zeros(1,3),ones(1,3)],beq=ones(2,1) %�Ⱥ�Լ��
[xy,f]=fmincon(fxy,rand(6,1),[],[],Aeq,beq,zeros(6,1),ones(6,1),@erci);
x=xy(1:3), y=xy(4:6) %�ֱ���ʾ�׶Ӻ��ҶӵĻ�ϲ���
v1=x'*A*y, v2=x'*B*y %����ӵ�ƽ���÷�
function [c,ceq]=erci(xy); %d���������Լ������
global A B
for i=1:3
    c(i)=A(i,:)*xy(4:6)-xy(1:3)'*A*xy(4:6); %��������Բ���ʽԼ��
    c(3+i)= B(:,i)'*xy(1:3)-xy(1:3)'*B*xy(4:6);
end
ceq=[]; %��������Ե�ʽԼ��
