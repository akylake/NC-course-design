function [ sts ] = DDA_quad( start_x,start_y,end_x,end_y,n,step,seq,preset,left_shift)
% �Բ�ͬ����˳��Բ�����в岹
%x1,y1Ϊ�������
%x2,y2Ϊ�յ�����
% nΪ�Ĵ���λ��
% stepΪ����
% seqΪ���޼�˳�����

%�յ��б�Ĵ�����ʼ��
Ex = round( abs( end_x-start_x )/step );
Ey = round( abs( end_y-start_y )/step );

switch seq %�Ĵ������������ж�
    case {1,3,6,8}
        sgn_jx = -1;sgn_jy = 1;
    case {2,4,5,7}
        sgn_jx = 1;sgn_jy = -1;
end

if left_shift
    n = n+1;
    sgn_jx = 2*sgn_jx;
    sgn_jy = 2*sgn_jy;
end
switch seq %������������ж�
    case {1,7}
        sgn_x=1;sgn_y=-1;
    case {2,8}
        sgn_x=1;sgn_y=1;
    case {3,5}
        sgn_x=-1;sgn_y=1;
    case {4,6}
        sgn_x=-1;sgn_y=-1;
end
%���Ĵ�����ֵ
Jvx = round(abs(start_y/step));
Jvy = round(abs(start_x/step));
bs = 2^n;
m=1;
%��㸳ֵ���ۼӼĴ�����ʼ��
sts(1,:) = [start_x,start_y];
switch preset
    case 1
        Jx = 0;Jy = 0;
    case 2
        Jx = bs/2;Jy = bs/2;
    case 3
        Jx = bs-1;Jy = bs-1;
end
%�ۼ�ѭ��
while (Ex>0||Ey>0)
    if Ex>0
        Jx = Jx+Jvx;
    end
    if Ey>0
        Jy = Jy+Jvy;
    end
    if Jx>=bs %Jx���
        if Jy>=bs %Jy���
            Jx = Jx-bs;
            Jy = Jy-bs;
            Jvx = Jvx+sgn_jx;
            Jvy = Jvy+sgn_jy;
            sts(m+1,:) = sts(m,:)+[sgn_x*step,sgn_y*step];
            Ex = Ex-1;
            Ey = Ey-1;
        else %Jyδ���
            Jx = Jx-bs;
            Jvy = Jvy+sgn_jy;
            sts(m+1,:) = sts(m,:)+[sgn_x*step,0];
            Ex = Ex-1;
        end
    else %Jxδ���
        if Jy>=bs %Jy���
            Jy = Jy-bs;
            Jvx = Jvx+sgn_jx;
            sts(m+1,:) = sts(m,:)+[0,sgn_y*step];
            Ey = Ey-1;
        else %Jyδ���
            continue
        end
    end
    m = m+1;
    %sts
end
%plot (sts(:,1),sts(:,2))
end

