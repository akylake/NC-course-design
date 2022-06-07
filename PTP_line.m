function [ sts ] = PTP_line( start_x,start_y,end_x,end_y,step )
%start_x,start_y,end_x,end_y,step�ֱ�Ϊ��ʼ������
%���ȽϷ���ֱ�߲岹 
Ex = round( abs( start_x-end_x )/step );
Ey = round( abs( start_y-end_y )/step );
E = Ex+Ey;
%��ֱ�������������ԭ��
trans_x =abs( end_x-start_x );
trans_y =abs( end_y-start_y );
%�ж�ֱ�ߵ�����
if end_x>=start_x
    if end_y>=start_y
        quad = 1;
    else
        quad = 4;
    end
else
    if end_y>=start_y
        quad = 2;
    else 
        quad = 3;
    end
end
%��ʼ���ۼӺ���
F = zeros(E+1,1);
%��ʼ��·���洢����
sts = zeros(E+1,2);
%�ۼ�ѭ��
for i = 1:E
    if F(i)>=0
        F(i+1) = F(i)-trans_y;
        sts(i+1,2) = sts(i,2);
        sts(i+1,1) = sts(i,1)+step;
    else
        F(i+1) = F(i)+trans_x;
        sts(i+1,1) = sts(i,1);
        sts(i+1,2) = sts(i,2)+step;
    end
end
switch quad
    case 2
        sts(:,1) = -sts(:,1);
    case 3
        sts = -sts;
    case 4
        sts(:,2) = -sts(:,2);
end
sts(:,1) = sts(:,1)+start_x;
sts(:,2) = sts(:,2)+start_y;
plot (sts(:,1),sts(:,2),[start_x,end_x],[start_y,end_y]);
end

