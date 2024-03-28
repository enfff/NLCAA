function circle(x,y,r,col,lw)
%circle(x,y,r,col,lw)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
%0.01 is the angle step, bigger values will draw the circle faster but
%you might notice imperfections (not very smooth)
ang=linspace(0,2*pi,500); 
xp=r*cos(ang);
yp=r*sin(ang);
% plot(x+xp,y+yp,'color',col,'linewidth',lw);
plot(x+xp,y+yp,'-','color',col,'linewidth',lw);
end