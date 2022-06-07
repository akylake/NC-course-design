function [ cen ] = CircleCenter( x1,y1,x2,y2,r,sn,procon )
%CircleCenter 根据圆弧起点终点以及顺逆优劣计算圆心坐标
%   此处显示详细说明
%顺圆弧sn=1，逆圆弧sn=0；优弧procon=1，劣弧procon=0；
syms a b;
%接圆心方程
[a,b] = solve([(x1-a)^2+(y1-b)^2==r^2,(x2-a)^2+(y2-b)^2==r^2],[a,b]);
if length(a)==1
    cen = [(x2-x1)/2,(y2-y1)/2];
    return;
end    
if ((y1-y2)*double(a(1))+(x2-x1)*double(b(1))+x1*y2-x2*y1)>0
    cen1 = double([a(1),b(1)]);
    cen2 = double([a(2),b(2)]);
else
    cen1 = double([a(2),b(2)]);
    cen2 = double([a(1),b(1)]);
end    

if sn
    if procon
        cen = cen1;
    else 
        cen = cen2;
    end
else
    if procon
        cen = cen2;
    else 
        cen = cen1;
    end
end
end