function seq = Division( transtart_x,transtart_y,transend_x,transend_y,sn )
%Division ����������ݽ������޷ָ�
%transtart_x,transtart_y,transend_x,transend_y�ֱ�Ϊת�������ʼ������
%sn=1Ϊ˳ʱ�룬sn=0Ϊ��ʱ��
%����ֵseqΪ�ָ������޲岹����
switch QuadJudge(transtart_x,transtart_y)
    case 1  %����һ����
        switch QuadJudge(transend_x,transend_y)
            case 1 %�յ�Ϊ��һ����
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
            case 2 %�յ�Ϊ�ڶ�����
                if sn == 1
                    seq = [1,4,3,2];
                else
                    seq = [5,6];
                end
            case 3 %�յ�Ϊ��������
                if sn == 1
                    seq = [1,4,3];
                else
                    seq = [5,6,7];
                end
            case 4 %�յ�Ϊ��������
                if sn == 1
                    seq = [1,4];
                else
                    seq = [5,6,7,8];
                end
        end
    case 2 %���ڶ�����
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
    case 3 %����������
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
    case 4 %����������
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

