function dX = au_Rossler(t,X)
a = 0.165; b = 0.20; c = 10.0;
x=X(1); y=X(2); z=X(3);
Y=[X(4), X(7), X(10)
   X(5), X(8), X(11)
   X(6), X(9), X(12)]; %Y������������Ϊ�໥�����ĵ�λ����
dX=zeros(12,1); % Rossler�����ӵĳ�ʼ��
dX(1:3)=[-y-z;x+a*y; b+z*(x-c)];
Jaco=[0 -1 -1;
      1 a  0;
      z 0  x-c]; % Rossler�����ӵ�Jacobi����
dX(4:12) = Jaco*Y;
