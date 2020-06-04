%% 该函数求解两节点连接边的概率
function p=lianjiegailv(x,y,alph,beta,N)

plot(x,y,'r.','Markersize',18);
hold on;
d=zeros(N);
for i=1:N
    for j=1:N
        d(i,j)=sqrt((x(i)-x(j))^2+((y(i)-y(j)))^2);
    end
end
L=max(max(d));
for i=1:N
    for j=1:N
        p(i,j)=alph*exp(-d(i,j)/beta/L);
    end
        p(i,i)=0;
end