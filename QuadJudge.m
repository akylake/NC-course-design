function quad = QuadJudge( x,y )
% QuadJudge  判断点的象限
if x>=0 
    if y>=0
        quad=1;   
    else
        quad=4;
    end
else if y>=0
        quad=2;
    else
        quad=3;
    end
end
end

