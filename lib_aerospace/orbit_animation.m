function orbit_animation(x,ang,L)

if nargin<3 || isempty(L)
    L=1.1e4;
end
if nargin<2 || isempty(ang)
    ang=[70,50];
end

RE=6371;
fs1=20;
fs2=16;
lw=1.2;

foa=findobj('tag','orb_fig');
if isempty(foa)
    
    figure('position',[100 100 600 600],'color','w','tag','orb_fig')
    grid, box on, daspect([1 1 1]), hold on
    title('Orbit','fontsize',fs2)
    xlabel('$x$ [km]','interpreter','LaTex','fontsize',fs1)
    ylabel('$y$ [km]','interpreter','LaTex','fontsize',fs1)
    zlabel('$z$ [km]','interpreter','LaTex','fontsize',fs1)
    xlim([-L L]), ylim([-L L]), zlim([-L L])
    view(ang(1),ang(2))
    
    [Xph,Yph,Zph]=sphere(50);
    mesh(RE*Xph,RE*Yph,RE*Zph);

    plot3(x(1),x(2),x(3),'kd','markersize',6,'markerfacecolor','k','tag','orb_sc')
    plot3(x(1),x(2),x(3),'k--','linewidth',0.7,'tag','orb_tr')    
else
    sc=findobj('tag','orb_sc');
    sc.XData=x(1);
    sc.YData=x(2);
    sc.ZData=x(3);
    
    tr=findobj('tag','orb_tr');
    tr.XData=[tr.XData,x(1)];
    tr.YData=[tr.YData,x(2)];
    tr.ZData=[tr.ZData,x(3)];
end


