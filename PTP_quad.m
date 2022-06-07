function [ sts ] = PTP_quad( start_x,start_y,end_x,end_y,step,seq )
%PTP_quad ʹ�����ȽϷ��Ը������޵�Բ�����в岹
%x1,y1Ϊ�������
%x2,y2Ϊ�յ�����
% stepΪ����
% seqΪ���޼�˳�����
r = sqrt((end_x)^2+(end_y^2));
%�յ��б�Ĵ�����ʼ��
Ex = round( abs( end_x-start_x )/step );
Ey = round( abs( end_y-start_y )/step );
E = Ex+Ey;
%������������ж�
switch seq 
    case {1,7}
        sgn_x=1;sgn_y=-1;
    case {2,8}
        sgn_x=1;sgn_y=1;
    case {3,5}
        sgn_x=-1;sgn_y=1;
    case {4,6}
        sgn_x=-1;sgn_y=-1;
end
% F = zeros(E+1,1);
sts = [start_x,start_y];
%�岹�ж�ѭ��
for i = 1:E
    %�жϵ�ǰ�����Բ��λ��
    if (sqrt( (sts(i,1))^2+(sts(i,2)^2)))>=r
        switch seq
            case {2,4,5,7}
                sts(i+1,2) = sts(i,2);
                sts(i+1,1) = sts(i,1)+sgn_x*step;
            case {1,3,6,8}
                sts(i+1,1) = sts(i,1);
                sts(i+1,2) = sts(i,2)+sgn_y*step;
        end
    else
        switch seq
            case {2,4,5,7}
                sts(i+1,1) = sts(i,1);
                sts(i+1,2) = sts(i,2)+sgn_y*step;
            case {1,3,6,8}
                sts(i+1,2) = sts(i,2);
                sts(i+1,1) = sts(i,1)+sgn_x*step;
        end
    end
end 

end

