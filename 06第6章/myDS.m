function [T,V,d,path]=myDS(A,s,t);
T=0; V=s; path=s; d=0; CV=s;
%����������AΪ�����ڽӾ���sΪԴ�ڵ㣬tΪĿ��ڵ�,TΪ��������,
%VΪ�����Ľڵ㣬pathΪӦ��DS���Եõ������·����dΪ·�����ȣ�CVΪ��ǰ�ڵ�
if s==t
    return
end
deg=sum(A); %����ڵ�Ķ�
flag=zeros(size(A)); %��¼���Ƿ񱻷��ʵı�־����
while A(CV,t)~=1
    [row,NV]=find(A(CV,:)==1); %���ҵ�ǰ�ڵ���ھӽڵ�
    cdeg=deg(NV); %��ȡ�����ھӽڵ�Ķ�
ind=find(cdeg==max(cdeg),1); %���Ҷ����ĵ�һ���ڵ�
L=length(V);
    while flag(CV,NV(ind))==1 %·���Ѿ����ʹ�
       NV(ind)=[]; %ɾ����ǰ���Ƚڵ�
       if length(NV)
           cdeg=deg(NV); %��ȡ��ѡ�ھӽڵ�Ķ�
           ind=find(cdeg==max(cdeg),1); %���Ҷ����ĵ�һ���ڵ� 
       else
          L=L-1;CV=V(L);
          [row,NV]=find(A(CV,:)==1); %��ȡ���ݽڵ���ھӽڵ�
          cdeg=deg(NV); %��ȡ�ھӽڵ�Ķ�
          ind=find(cdeg==max(cdeg),1, 'last'); %���Ҷ��������ڵ�
       end
    end
flag(CV,NV(ind))=1; flag(NV(ind),CV)=1; CV=NV(ind); 
V=[V,CV]; T=T+1; 
end
V=[V,t]; T=T+1;
LV=V; CV=s;%���������·��
while CV~=t
    no=find(LV==CV); d=d+1; 
    if length(no)==1
        CV=LV(d+1); path=[path,CV];
    else
        LV(no(1)+1:no(end))=[]; %ɾ���м���ظ��ڵ�
        CV=LV(d+1); path=[path,CV];
    end
end
