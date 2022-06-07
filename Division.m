function seq = Division( transtart_x,transtart_y,transend_x,transend_y,sn )
%Division 对输入的数据进行象限分割
%transtart_x,transtart_y,transend_x,transend_y分别为转换后的起始点坐标
%sn=1为顺时针，sn=0为逆时针
%返回值seq为分割后的象限插补序列
switch QuadJudge(transtart_x,transtart_y)
    case 1  %起点第一象限
        switch QuadJudge(transend_x,transend_y)
            case 1 %终点为第一象限
                if sn == 1 && transtart_x>transend_x
                    seq = [1,4,3,2,1];
                else
                    if sn == 1 && transtart_x<transend_x
                    seq = 1;
                    else
                        if sn == 0 && transtart_x>transend_x
                        seq = 5;
                        else
                            seq = [5,6,7,8,5];
                        end
                    end
                end
            case 2 %终点为第二象限
                if sn == 1
                    seq = [1,4,3,2];
                else
                    seq = [5,6];
                end
            case 3 %终点为第三象限
                if sn == 1
                    seq = [1,4,3];
                else
                    seq = [5,6,7];
                end
            case 4 %终点为第四象限
                if sn == 1
                    seq = [1,4];
                else
                    seq = [5,6,7,8];
                end
        end
    case 2 %起点第二象限
        switch QuadJudge(transend_x,transend_y)
            case 1
                if sn == 1
                    seq = [2,1];
                else
                    seq = [6,7,8,5];
                end
            case 2
                if sn == 1 && transtart_x>transend_x
                    seq = [2,1,4,3,2];
                else
                    if sn == 1 && transtart_x<transend_x
                    seq = 2;
                    else
                        if sn == 0 && transtart_x>transend_x
                        seq = 6;
                        else
                            seq = [6,7,8,5,6];
                        end
                    end
                end
            case 3
                if sn == 1
                    seq = [2,1,4,3];
                else
                    seq = [6,7];
                end
            case 4
                if sn == 1
                    seq = [2,1,4];
                else
                    seq = [6,7,8];
                end
        end
    case 3 %起点第三象限
        switch QuadJudge(transend_x,transend_y)
            case 1
                if sn == 1
                    seq = [3,2,1];
                else
                    seq = [7,8,5];
                end
            case 2
                if sn == 1
                    seq = [3,2];
                else
                    seq = [7,8,5,6];
                end
            case 3
                if sn == 1 && transtart_x>transend_x
                    seq = 3;
                else
                    if sn == 1 && transtart_x<transend_x
                    seq = [3,2,1,4,3];
                    else
                        if sn == 0 && transtart_x>transend_x
                        seq = [7,8,5,6,7];
                        else
                            seq = 7;
                        end
                    end
                end
            case 4
                if sn == 1
                    seq = [3,2,1,4];
                else
                    seq = [7,8];
                end
        end
    case 4 %起点第四象限
        switch QuadJudge(transend_x,transend_y)
            case 1
                if sn == 1
                    seq = [4,3,2,1];
                else
                    seq = [8,5];
                end
            case 2
                if sn == 1
                    seq = [4,3,2];
                else
                    seq = [8,5,6];
                end
            case 3
                if sn == 1
                    seq = [4,1,2,3];
                else
                    seq = [8,7];
                end
            case 4
                if sn == 1 && transtart_x>transend_x
                    seq = 4;
                else
                    if sn == 1 && transtart_x<transend_x
                    seq = [4,3,2,1,4];
                    else
                        if sn == 0 && transtart_x>transend_x
                        seq = [8,5,6,7,8];
                        else
                            seq = 8;
                        end
                    end
                end
        end
end
end

