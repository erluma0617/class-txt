% ���ɻ���1����[0,1]�ھ���������Ƚϣ���p(i,j)>random_data,�����ӽڵ�i,j.
% ֱ���ܹ����ɵı���ΪN*(N-1)/2*alph
function A=bian_lianjie1(p,N,alph)   %  ����ֵAΪ�ڽӾ���
A=zeros(N);num=0;
for k=1:inf
    for i=1:N
        for j=1:N
            random_data=rand(1,1);
            if p(i,j)>=random_data&A(i,j)==0
                A(i,j)=1; A(j,i)=1;
                num=num+1;
                if num>=N*(N-1)/2*alph
                   return ;
                end
            end
        end
    end
end