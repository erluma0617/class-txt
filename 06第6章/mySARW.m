function [T,TV]=mySARW(A,s,t)
%���ظ����ʽڵ���������������AΪ�����ڽӾ���
%sΪԴ�ڵ㣬tΪĿ��ڵ�,TΪ����������TVΪȫ���ѷ��ʵĽڵ�
T=0; TV=s; V=s; %VΪ��ǰ�ڵ�
if s==t
    return
end
while A(V,t)~=1
    nodes1=find(A(V,:)==1);  %���ҵ�ǰ�ڵ���ھӽڵ�
    nodes2=setdiff(nodes1,TV); %��δ���ʹ����ھӽڵ�
    if length(nodes2)>=1 
        r=rand(1,length(nodes2)); %����һ��[0,1]�ϵ��������
        [sr,ind]=sort(r); %���մ�С��������
        next_node=nodes2(ind(1)); %������һ���ڵ�
    else  %�ھӽڵ�ȫ��������
        r=rand(1,length(nodes1));
        [sr,ind]=sort(r);
        next_node=nodes1(ind(1));
    end
    TV=[TV next_node];
    V=next_node;
    T=T+1;
end
T=T+1; TV=[TV,t];
