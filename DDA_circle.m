function sts = DDA_circle( start_x,start_y,end_x,end_y,center_x,center_y,step,sn,preset,left_shift)
%DDA_circle DDA_quad法-圆弧插补
% 顺一二三四为1234，逆一二三四为5678
r1 = sqrt( (start_x-center_x)^2+(start_y-center_y)^2 );
r2 = sqrt( (end_x-center_x)^2+(end_y-center_y)^2 );
if r1/r2<1.05&&r1/r2>0.95
    r = (r1+r2)/2;
else
    disp('Error');
    return;
end
%计算所需寄存器位数
n = ceil(log2(r/step));
%将圆心移至原点
x1 = start_x-center_x;
y1 = start_y-center_y;
x2 = end_x-center_x;
y2 = end_y-center_y;
% Ex1 = round( abs( start_x-r )/step);
% Ex2 = round ( abs( ( round( abs( start_x-r )/step )*step-( r-x1 )+ ( r-x2 ) )/step ) );
% Ex = Ex1+Ex2;
% Ey = round( abs( start_y-end_y )/step );
%对象限进行分割
seq = Division(x1,y1,x2,y2,sn); 
%初始化路径存储矩阵
sts = [x1,y1];
%按分割后的象限依次进行圆弧插补
for i =1:length(seq)
    switch i
        case length(seq) == 1 %单象限的插补
            sts = DDA_quad( x1,y1,x2,y2,n,step,seq(i),preset,left_shift);
        case 1  %起点所在象限的插补
            switch seq(i)
                case 1
                    sx_2=r;sy_2=0;
                case 2
                    sx_2=0;sy_2=r;
                case 3
                    sx_2=-r;sy_2=0;
                case 4
                    sx_2=0;sy_2=-r;
                case 5
                    sx_2=0;sy_2=r;
                case 6
                    sx_2=-r;sy_2=0;
                case 7
                    sx_2=0;sy_2=-r;
                case 8
                    sx_2=r;sy_2=0;
            end
            sts = [sts;DDA_quad( x1,y1,sx_2,sy_2,n,step,seq(i),preset,left_shift)];
        case length(seq) %终点所在象限的插补
            sx_1 = sts(size(sts,1),1);
            sy_1 = sts(size(sts,1),2);
            sts = [sts;DDA_quad( sx_1,sy_1,x2,y2,n,step,seq(i),preset,left_shift)];
        otherwise %其他象限的插补
            %判断变象限是否需要补步
            if (QuadJudge(sts(size(sts,1),1),sts(size(sts,1),2))~= seq(i)||QuadJudge(sts(size(sts,1),1),sts(size(sts,1),2))~= seq(i)+4)&&(sts(size(sts,1),1))&&(sts(size(sts,1),2))
                %当前插补点所在象限
                if seq(i)==5||seq(i)==6||seq(i)==7||seq(i)==8
                    Quad1 = seq(i)-4;
                else
                    Quad1 = seq(i);
                end
                %上一点所在象限
                Quad2 = QuadJudge(sts(size(sts,1),1),sts(size(sts,1),2));
                switch Quad1
                    case 1
                        switch Quad2
                            case 2
                                sts = [sts;[sts(size(sts,1),1)+step,sts(size(sts,1),2)]];
                            case 4
                                sts = [sts;[sts(size(sts,1),1),sts(size(sts,1),2)+step]];
                        end
                    case 2
                        switch Quad2
                            case 1
                                sts = [sts;[sts(size(sts,1),1)-step,sts(size(sts,1),2)]];
                            case 3
                                sts = [sts;[sts(size(sts,1),1),sts(size(sts,1),2)+step]];
                        end
                    case 3
                        switch Quad2
                            case 2
                                sts = [sts;[sts(size(sts,1),1),sts(size(sts,1),2)-step]];
                            case 4
                                sts = [sts;[sts(size(sts,1),1)-step,sts(size(sts,1),2)]];
                        end
                    case 4
                        switch Quad2
                            case 1
                                sts = [sts;[sts(size(sts,1),1),sts(size(sts,1),2)-step]];
                            case 3
                                sts = [sts;[sts(size(sts,1),1)+step,sts(size(sts,1),2)]];
                        end
                end
            end
            switch seq(i)
                case 1
%                     sx_1=0;sy_1=r;
                    sx_2=r;sy_2=0;
                case 2
%                     sx_1=-r;sy_1=0;
                    sx_2=0;sy_2=r;
                case 3
%                     sx_1=0;sy_1=-r;
                    sx_2=-r;sy_2=0;
                case 4
%                     sx_1=r;sy_1=0;
                    sx_2=0;sy_2=-r;
                case 5
                    sx_2=0;sy_2=r;
%                     sx_1=r;sy_1=0;
                case 6
                    sx_2=-r;sy_2=0;
%                     sx_1=0;sy_1=r;
                case 7
                    sx_2=0;sy_2=-r;
%                     sx_1=-r;sy_1=0;
                case 8
                    sx_2=r;sy_2=0;
%                     sx_1=0;sy_1=-r;
            end
          sts = [sts;DDA_quad( sts(size(sts,1),1),sts(size(sts,1),2),sx_2,sy_2,n,step,seq(i),preset,left_shift)];
    end
end
%将插补后的轨迹圆心由原点移至原圆心
sts = sts+[center_x,center_y];
end 