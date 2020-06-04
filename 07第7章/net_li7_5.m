clc, clear, n=10; a=zeros(n); 
a(1,[2 3 5:7])=1; a(2,[3 5:7])=1; a(3,[4:6])=1;
a(4,[5 6])=1; a(5,[6 9 10])=1; a(6,[7:9])=1;
a(7,[8 9])=1; a(8,9)=1; a(9,10)=1; A0=a+a'; %���������ڽӾ���
a=a'; a=sparse(a); %���Matlab��������Ҫ����������
name=cellstr(int2str([1:n]')); %�������綥�����ַ�����ϸ������
h=view(biograph(a,name,'ShowArrows','off','ShowWeights','off'))
h.EdgeType='segmented'; %�ߵ�����Ϊ�߶�
h.LayoutType='equilibrium'; %���粼������Ϊƽ��ṹ
set(h.Edges,'LineWidth',1.5);
set(h.Nodes,'Fontsize',15);
set(h.Nodes,'shape','circle','Size',[10,15]); %�޸Ķ�����״
dolayout(h) %ˢ��ͼ��
for k=1:n
    A=k; B=find(A0(k,:)); %��k���ھӽڵ�
    while length(B)
        A=[A B(1)]; B(1)=[]; ind=[];
        for i=1:length(B)
          if sum(A0(B(i),A))<length(A) 
            ind=[ind,i]; %��¼��B�в���A�����нڵ������Ľڵ�
          end
        end
        B(ind)=[]; %ɾ��B�в���A�����нڵ������Ľڵ�
    end
    AA{k}=sort(A); %�ҵ���ÿһ��������������ϵ
end
celldisp(AA) %��ʾ��ÿ���ڵ㿪ʼ����ϵ
k=1;BB{1}=AA{1}; %����ȥ��AA�е��ظ���ϵ������������BB
for i=2:length(AA)
    for j=1:length(BB)
        if sum(ismember(AA{i},BB{j}))==length(AA{i})
            break %���AA{i}��BB��ĳ���Ӽ���������BB
        end
        if j==length(BB) %AA{i}����BB�е�ĳ���Ӽ�
            k=k+1; BB{k}=AA{i}; %AA{i}����BB
        end
    end
end
celldisp(BB) %��ʾû���ظ�����ϵ
for i=1:length(BB) 
    for j=1:length(BB)
        c(i,j)=sum(ismember(BB{i},BB{j})); %�����ص�����
    end
end
c %��ʾ�ص�����
d=zeros(size(c)); %4��ϵ�ڽӾ����ʼ��
for i=1:size(d,1)
    for j=1:size(d,2)
        d(i,j)=double((i~=j)&(c(i,j)>=3))+double((i==j)&(c(i,j)>=4));
    end
end
d
st=union(union(BB{1},BB{2}),BB{3}) %��ȡ������ŵĽڵ㼯
E=A0(st,st); %��ȡ������Žṹ���ڽӾ���
E=tril(E); E=sparse(E);
st=cellstr(int2str(st'));
h2=view(biograph(E,st,'ShowArrows','off','ShowWeights','off'))
h2.EdgeType='segmented'; %�ߵ�����Ϊ�߶�
h2.LayoutType='equilibrium'; %���粼������Ϊƽ��ṹ
dolayout(h2) %ˢ��ͼ��  
