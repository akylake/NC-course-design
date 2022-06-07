function [ sts ] = DDA_line( start_x,start_y,end_x,end_y,step,preset,left_shift )
%DDA_line DDA-ֱ�߲岹
%x1,y1Ϊ�������
%x2,y2Ϊ�յ�����
% stepΪ����
%��ֱ�������������ԭ��
trans_x =abs( end_x-start_x );
trans_y =abs( end_y-start_y );
%�ж�ֱ������ԭ��������
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
m = max(trans_x,trans_y);
%ȷ���Ĵ���λ��
m = log2(m/step);
if rem(m,1)
    n = ceil(m);
else
    n = m+1;
end
if left_shift
else
    n = n+1;
end

%�յ��б�Ĵ���
Ex = round( abs( start_x-end_x )/step );
Ey = round( abs( start_y-end_y )/step );
E = Ex+Ey;
%��ʼ���Ĵ���
Jvx = round(trans_x/step);
Jvy = round(trans_y/step);
switch preset
    case 1
        Jx = 0;Jy = 0;
    case 2
        Jx = 2^(n-1);Jy = 2^(n-1);
    case 3
        Jx = 2^n-1;Jy = 2^n-1;
end
sts = [0,0]; 
%�ۼ�ѭ��
i = 1;
while(E)
    Jx = Jx+Jvx;
    Jy = Jy+Jvy;
    if Jx>=2^n&&Jy>=2^n
        Jx = Jx-2^n;
        Jy = Jy-2^n;
        sts(i+1,:) = sts(i,:)+step;
        E = E-2;
    else
        if Jx>=2^n
            Jx = Jx-2^n;
            sts(i+1,1) = sts(i,1)+step;
            sts(i+1,2) = sts(i,2);
            E = E-1;
        else
            if Jy>=2^n
                Jy = Jy-2^n;
                sts(i+1,1) = sts(i,1);
                sts(i+1,2) = sts(i,2)+step;
                E = E-1;
            else
                continue
            end
        end
    end
    i = i+1;
end
%��ֱ�ߴ��ԭ����
switch quad
    case 2
        sts(:,1) = -sts(:,1);
    case 3
        sts = -sts;
    case 4
        sts(:,2) = -sts(:,2);
end
%���������ԭ���
sts(:,1) = sts(:,1)+start_x;
sts(:,2) = sts(:,2)+start_y;
end

