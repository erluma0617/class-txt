function [dd,path,d,road]=refine_DS(A,s,t);
%�Ľ�������������AΪ�����ڽӾ���sΪԴ�ڵ㣬tΪĿ��ڵ�,ddΪ�Ľ�ǰ��·������, pathΪ�Ľ�ǰ��·����dΪ�Ľ���·�����ȣ�roadΪ�Ľ�������·����
[T,V,d,road]=myDS(A, s, t); dd=d; path=road;
if length(road)>=3  %δ�Ľ�ǰÿ��·������Ҫ����3���ڵ�
    t=0; cv=road(end-t);%��·�����ڵ㿪ʼ�����ǲ���ǰ��ڵ���ھӽڵ�
while cv~=s
     if sum(A(cv,road(1:end-t-2))) %cv��road�е�ĳ���ڵ�����
         bh=find(A(cv,road(1:end-t-2))==1,1); %��cv�ڽӽڵ�ĵ�ַ
         bv=find(road==cv); %��cv�ĵ�ַ
         road(bh+1:bv-1)=[]; %ɾ����·�����м�ڵ�
     end
     t=t+1; cv=road(end-t);
end
     d=length(road)-1;
end
