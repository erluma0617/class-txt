clc, clear
w=1;alpha=0.165; beta=0.2;gama=10;
g=@(t,f)[-w*f(2)-f(3);w*f(1)+alpha*f(2);beta+f(3)*(f(1)-gama)];
chuzhi=rand(3,1); %��ʼֵ
[t,xyz]=ode45(g,[0,500],chuzhi); %����ֵ��
plot3(xyz(:,1),xyz(:,2),xyz(:,3)) %������ͼ
xlabel('\it x(t)'), ylabel('\it y(t)'), zlabel('\it z(t)','rotation',0)
box on %�Ӻ����ߣ���ͻ�������
