function T=myBFS(A,s,t);
% �����������BFS��AΪ�����ڽӾ���sΪԴ�ڵ㣬tΪĿ��ڵ�,TΪ����������
T=0; TV=s; U=s; %TVΪ��ǰ�ڵ㣬UΪ�ѷ��ʽڵ㼯��
if s==t
    T=0, return
end
while ~ismember(t,TV)
    T=T+1;
    n=length(TV);  %��ǰ�ڵ�ĸ���
    TV2=[]; %�µĵ�ǰ���ʼ��
    for i=1:n
        nodes=find(A(TV(i),:)==1);  %���ҵ�ǰ�ڵ���ھӽڵ�
        V=setdiff(nodes,U); TV2=[TV2,V]; U=[U,V];
    end
    TV=TV2; %�µĵ�ǰ�ڵ�
end
