function B=degreeaddedge(A);
%�������A�Ǵ��ڹ������������ڽӾ���
%B�ǰ��ն����ȹ���ӱߺ󹹳ɵ�������ڽӾ���
B=A; 
while any(sum(B)<=1)
    deg=sum(B); %����ڵ�Ķ�
    p=(deg+1)/sum(deg+1);  %����ڵ�ļӱ߸���
    pp=cumsum(p);  %���ۻ�����
    k=find(deg<=1);
    for i=k
    ind=find(pp>=rand);jj=ind(1); %jjΪ�ö��ַ�ѡ��Ľڵ��ַ
      if jj~=i 
         B(i,jj)=1; B(jj,i)=1; 
      end
    end
end
