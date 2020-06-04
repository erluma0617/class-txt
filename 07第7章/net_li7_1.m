clc, clear, a=zeros(34); %Zachary网络邻接矩阵初始化
a(1,[2:9,11:14,18,20,22,32])=1; %输入邻接矩阵上三角元素
a(2,[3,4,8,14,18,20,22,31])=1;
a(3,[4,8:10,14,28,29,33])=1;
a(4,[8,13,14])=1; a(5,[7,11])=1;
a(6,[7,11,17])=1; a(7,17)=1;
a(9,[31,33,34])=1; a(10,34)=1;
a(14,34)=1; a(15,[33,34])=1;
a(16,[33,34])=1; a(19,[33,34])=1;
a(20,34)=1; a(21,[33,34])=1;
a(23,[33,34])=1; a(24,[26,28,30,33,34])=1;
a(25,[26,28,32])=1; a(26,32)=1;
a(27,[30,34])=1; a(28,34)=1;
a(29,[32,34])=1; a(30,[33,34])=1;
a(31,[33,34])=1; a(32,[33,34])=1; 
a(33,34)=1; a=a'; a=sparse(a); %变成Matlab工具箱需要的数据类型
name=cellstr(int2str([1:34]')); %构造网络顶点标号字符串的细胞数组
h=view(biograph(a,name,'ShowArrows','off','ShowWeights','off'))
h.EdgeType='segmented'; %边的连接为线段
h.LayoutType='equilibrium'; %网络布局类型为平衡结构
bh1=[1:8,11:14,17,18,20,22]; bh2=setdiff([1:34],bh1);
set(h.Nodes(bh2),'shape','circle'); %修改顶点形状
set(h.Edges,'LineColor',[0 0 0]); %为了将来打印清楚，边画成黑色
set(h.Edges,'LineWidth',1.5);  %线型宽度设置为1.5
dolayout(h) %刷新图形
