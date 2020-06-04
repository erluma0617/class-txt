function Matlab_to_Pajek(A,k)  
%Matlab�ڽӾ���Aת����Pajek���ݵĺ���
%k�ǵ�k��ת�������ɵ��ļ�������Pajek_datak.net,
%����������2������k,Ĭ���ļ���ΪPajek_data1.net
if nargin==1
    str='Pajek_data1.net';
else
    str=['Pajek_data',int2str(k),'.net'];
end
n=length(A); v=1:n;
fid=fopen(str,'w');  %�������ı��ļ�Pajek_data.net
fprintf(fid,'%s%d\n','*Vertices  ',n); %д���ַ���������
for i=1:n
   fprintf(fid,' %d  ',v(i));   %д��ڵ���
   fprintf(fid,'"%d"\n',v(i));  %д��˫���Žڵ��ַ���������
end
fprintf(fid,'%s\n%s\n','*Arcs','*Edges'); %д�������ַ��������Ի���
A=tril(A);  %��ȡ�ڽӾ����������Ԫ��
[u,v]=find(A); n=length(u); %�ҷ���Ԫ�أ����������
for i=1:n
    fprintf(fid,'  %d  %d  1\n',u(i),v(i));  %������д����Ϣ������
end
fclose(fid);
