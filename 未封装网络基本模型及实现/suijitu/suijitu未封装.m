% function [p,A]=suijitu()
% function suijitu()
disp('���ͼ���ɲ���1��2,')
disp('1��ʾ�����ӵĸ���[0,1]�ھ���������Ƚϣ���p(i,j)>random_data,�����ӽڵ�i,j.ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph');
disp('2��ʾ�����ʴӴ�С�������Ӹ�������ǰ��Ľڵ�ԣ�ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph,����һ���Ľ�С�ĸ��ʶԱ��������');
pp=input('���������ͼ���ɲ���1��2:');
N=input('����ͼ�нڵ������ĿN��');
alph=input('����ͼ�бߵ�ƽ�����Ӷ�alph:  ');
beta=input('�����ߵ�ƽ�����ȵĲ���beta:  ');
% pp=1;
% N=100;
% alph=0.25;
% beta=0.5;
randData=rand(2,N)*1000;
x=randData(1,:);
y=randData(2,:);
p=lianjiegailv(x,y,alph,beta,N);

switch  pp
    case 1
         A=bian_lianjie1(p,N,alph);
    case 2
         relink=input('��������������ӵĸ���:');
         A=bian_lianjie2(p,N,alph,relink);
    otherwise
        disp('The number pp you input is wrong');
end
 disp(['�����ͼ�ı���Ϊ��',int2str(sum(sum(A)))]);
[C,aver_C]=Clustering_Coefficient(A);
[DeD,aver_DeD]=Degree_Distribution(A);
[D,aver_D]=Aver_Path_Length(A);   
 disp(['�����ͼ��ƽ��·������Ϊ��',num2str(aver_D)]);  %%������������������
 disp(['�����ͼ�ľ���ϵ��Ϊ��',num2str(aver_C)]);
 disp(['�����ͼ��ƽ����Ϊ��',num2str(aver_DeD)]); 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N 
    for j=i+1:N
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)]);
            hold on;
        end
    end
end
hold off

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% �ú���������ڵ����ӱߵĸ���
% function p=lianjiegailv(x,y,alph,beta,N)
% 
% plot(x,y,'r.','Markersize',18);
% hold on;
% d=zeros(N);
% for i=1:N
%     for j=1:N
%         d(i,j)=sqrt((x(i)-x(j))^2+((y(i)-y(j)))^2);
%     end
% end
% L=max(max(d));
% for i=1:N
%     for j=1:N
%         p(i,j)=alph*exp(-d(i,j)/beta/L);
%     end
%         p(i,i)=0;
% end
%  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % ���ɻ���1����[0,1]�ھ���������Ƚϣ���p(i,j)>random_data,�����ӽڵ�i,j.
% % ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph
% function D=bian_lianjie1(p,N,alph)   %  ����ֵDΪ�ڽӾ���
% D=zeros(N);num=0;
% for k=1:inf
%     for i=1:N
%         for j=1:N
%             random_data=rand(1,1);
%             if p(i,j)>=random_data&D(i,j)==0
%                 D(i,j)=1; D(j,i)=1;
%                 num=num+1;
%                 if num>=N*(N-1)/2*alph
%                    return ;
%                 end
%             end
%         end
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% ���ɻ���2�������ʴӴ�С�������Ӹ�������ǰ��Ľڵ�ԣ�ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph
% %% ��һ���Ľ�С����������������ʵ��һ���̶ȵ��������
% function D=bian_lianjie2(p,N,alph,relink)
% D=zeros(N);
% p1=reshape(tril(p),[1,N*N]);
% [p2,px]=sort(p1);
% M=ceil(N*(N-1)/2*alph);
% for i=1:M
%     [m,n]=ind2sub(size(p),px(i));  %���±�������Ϊ˫�±�����
%     D(m,n)=1;D(n,m)=1;
% end
% 
% [m,n]=find(tril(D));               %��һ���ĸ������������
% for i=1:length(m)
%     random_data1=rand(1,1);
%     if relink>random_data1
%          D(m(i),n(i))=0;D(n(i),m(i))=0;        
%          n1=n(find(m~=m(i)));
%          random_data2=randint(1,1,[1,length(n1)]);
%          nn=n1(random_data2);
%          D(m(i),nn)=1;D(nn,m(i))=1;
%     end
% end

      
        



