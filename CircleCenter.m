function [ cen ] = CircleCenter( x1,y1,x2,y2,r,sn,procon )
%CircleCenter ����Բ������յ��Լ�˳�����Ӽ���Բ������
%   �˴���ʾ��ϸ˵��
%˳Բ��sn=1����Բ��sn=0���Ż�procon=1���ӻ�procon=0��
syms a b;
%��Բ�ķ���
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