clc, clear, hold on
m=100; n=100; num=100;%m��n�ֱ�Ϊˮƽ����ʹ�ֱ�����ĸ���;numΪѡ��ڵ�ĸ���
hh=10; gamma=0.15; %hhΪ���ӵ�ˮƽ����ʹ�ֱ����Ĳ���,gammaΪ��Ҫ�ڵ���� 
k0=8; %k0Ϊ��Ҫ�ڵ㰲ȫ�ȵ���ֵ
u=0:hh:(m-1)*hh; v=0:hh:(n-1)*hh; %��ƽ����ȡm��n��hh��hh�ĸ��ӵ�
xr=randi([1,m]); yr=randi([1,n]); %���ѡȡ��һ�����x��y���
label=[xr;yr];
xy=[u(xr),v(yr)]; %��ȡ��һ���������
for i=1:num-1   %ѡȡ�����num-1����
    flag=1; %ѭ��ѡ����Ʊ�����ʼ��
    while flag
      xr=randi([1,m]); yr=randi([1,n]);%���ѡ�¸����x��y�ı��  
      xt=u(xr); yt=v(yr); %��ȡѡȡ������һ������  
      tt=[xy;[xt,yt]];
      if all(pdist(tt)>10*sqrt(2))   %������е������������ָ����ֵ
          label=[label,[xr;yr]];
          xy=[xy; [xt,yt]]; flag=0; %ѡ��ɹ� 
      end
    end
end
dd0=dist(xy');  %��ѡȡ�����нڵ��֮������������ڽӾ��� 
dd=tril(dd0); dd=sparse(dd); %����Matlab��Ҫ�����������ϡ�����
[st,pred]=graphminspantree(dd); %����С������
[k1,k2]=find(st); %��st�з���Ԫ���б���б꣬����С���������߶˵�
z1=complex(xy(k1,1),xy(k1,2)); z2=complex(xy(k2,1),xy(k2,2));
z=[z1.'; z2.']; h=plot(z,'-P'); %ʹ�ø�����ͼ�ȽϷ���
set(h,'Color','k','LineWidth',1.3)
stw=full(st); %��ϡ�����ת��Ϊ��ͨ����
stw=stw+stw'; %��С�����������������ڽӾ���
dm=zeros(size(stw));  %��С��������0-1�ڽӾ���ĳ�ʼֵ
dm(find(stw))=1; %��stw�з���Ԫ�ػ���1��������С��������0-1�ڽӾ���
deg=sum(dm);   %����С���������ڵ�Ķ�
dd2=dd0; dd2(1:num+1:end)=inf;  %Ϊ��������Ȩ����С�ı���Ϊ��ӱߣ��Խ��߻���inf
rnum=randperm(num); %����1~num��һ��ȫ����
addnode=rnum(1:round(gamma*num)); %�����ӱߵĽڵ���
for k=addnode
    if deg(k)<k0
        tt=dm(:,k); %����ڽӾ���ĵ�k��
        tt(tt==1)=inf; %��tt�е�1�任������
        dd2(:,k)=dd2(:,k)+tt; %����ѡȡ�߶�Ӧ��Ԫ�ػ�������
        dd2(k,:)=dd2(k,:)+tt';
        [sd,ind]=sort(dd2(:,k)); %����ڵ�k�Ľڵ㰴�ӽ���Զ����
        knode=ind(1:min(k0-deg(k),length(ind))); %ѡȡk�ڵ��Ӧ�ļӱ߽ڵ�
        dm(k,knode)=1; dm(knode,k)=1; %�ӱ�     
    end
end
figure, hold on %���ڶ���ͼ��
[k1,k2]=find(dm);
z1=complex(xy(k1,1),xy(k1,2)); z2=complex(xy(k2,1),xy(k2,2));
z=[z1.'; z2.']; h=plot(z,'-P');
set(h,'Color','k','LineWidth',1.3)
