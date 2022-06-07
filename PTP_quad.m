function [ sts ] = PTP_quad( start_x,start_y,end_x,end_y,step,seq )
%PTP_quad 使用逐点比较法对各个象限的圆弧进行插补
%x1,y1为起点坐标
%x2,y2为终点坐标
% step为步长
% seq为象限及顺逆代号
r = sqrt((end_x)^2+(end_y^2));
%终点判别寄存器初始化
Ex = round( abs( end_x-start_x )/step );
Ey = round( abs( end_y-start_y )/step );
E = Ex+Ey;
%进给方向符号判断
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
%插补判断循环
for i = 1:E
    %判断当前点相对圆的位置
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

