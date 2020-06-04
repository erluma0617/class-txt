clc, clear
sigma=10; rho=28; beta=8/3;
g=@(t,f)[sigma*(f(2)-f(1)); rho*f(1)-f(2)-f(1)*f(3); f(1)*f(2)-beta*f(3)]; %����΢�ַ�������Ҷ���
chuzhi=rand(3,1); %��ʼֵ
[t,xyz]=ode45(g,[0,100],chuzhi); %����ֵ��
plot3(xyz(:,1),xyz(:,2),xyz(:,3)) %��ͼ5.2
xlabel('\it x(t)'), ylabel('\it y(t)'), zlabel('\it z(t)','rotation',0)
box on %�Ӻ����ߣ���ͻ�������
so=ode45(g,[0,100],chuzhi+0.00001) %��ֵ�仯��������ֵ��
xyz2=deval(so,t); %�����Ӧ��x,y,z��ֵ
figure(2), plot(t,xyz(:,1)-xyz2(1,:)','.-') %��x�Ĳ��ͼ5.3��ע��xyz���ж�Ӧx,y,z����ֵ�⣬xyz2���ж�Ӧx,y,z����ֵ��
xlabel('\it t'), ylabel('\it x_1(t)-x_2(t)','rotation',0)
