function [D,L,dist]=myAPL(a); 
%��������ֱ��D��ƽ��·������L�������нڵ��֮�����̾���dist���������aΪ������ڽӾ���
a=tril(a);  %��ȡ�ڽӾ���������ǲ��֣�����Matlab�������Ҫ��
a=sparse(a); %ת����ϡ�����,Matlab�������Ҫ��
dist=graphallshortestpaths(a,'directed',false);
D=max(max(dist));  %��������ֱ��
Ldist=tril(dist);  %��ȡ��̾������������ǲ���
he=sum(nonzeros(Ldist));  %�����бߵĺ�
n=length(a);  %��ڵ����
L=he/nchoosek(n,2);  %��ƽ��·�����ȣ�����ʹ��Matlab�����������
