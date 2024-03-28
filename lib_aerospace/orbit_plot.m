%% Plots
close all

fs1=20;
fs2=16;
lw=1.2;
uu=1;

v=sqrt(sum(x.data(:,4:6).^2,2));

% figure('color','w')
% title('Spacecraft speed','fontsize',fs2)
% plot(x.time/60,v,'linewidth',lw)
% ylabel('$v$ [km/s]','interpreter','LaTex','fontsize',fs1)
% xlabel('time [min]','interpreter','LaTex','fontsize',fs1)
% return

figure('color','w')
title('Signals','fontsize',fs2)
subplot(3,1,1), grid on, box on, hold on
plot(x.time/60,x.data(:,1:3),'linewidth',lw)
xlim([0 x.time(end)/60])
ylabel('$\mathbf{r}$ [km]','interpreter','LaTex','fontsize',fs1)
%xlabel('time [min]','interpreter','LaTex','fontsize',fs1)
%legend('x_1','x_2','x_3')
subplot(3,1,2), grid on, box on, hold on
plot(x.time/60,x.data(:,7),'linewidth',lw)
xlim([0 x.time(end)/60])
ylabel('$m$ [kg]','interpreter','LaTex','fontsize',fs1)
subplot(3,1,3), grid on, box on, hold on
plot(u.time/60,u.data,'linewidth',lw)
xlim([0 x.time(end)/60])
ylabel('$u$ [kg$\cdot$km/s$^2$]','interpreter','LaTex','fontsize',fs1)
xlabel('time [min]','interpreter','LaTex','fontsize',fs1)
%return

figure('color','w'), grid, box on, daspect([1 1 1]), hold on
title('Orbit projection on the equatorial plane','fontsize',fs2)
circle(0,0,RE/uu,[0 0.6 0],1.5)
plot(x.data(1:end,1)/uu,x.data(1:end,2)/uu,'k','linewidth',lw)
% plot(x.data(1:i1,1)/uu,x.data(1:i1,2)/uu,'r','linewidth',lw)
% plot(x.data(i1:i2,1)/uu,x.data(i1:i2,2)/uu,'b--','linewidth',lw*0.6)
plot(x.data(end,1)/uu,x.data(end,2)/uu,'k.','markersize',12)
xlabel('$x$ [km]','interpreter','LaTex','fontsize',fs1)
ylabel('$y$ [km]','interpreter','LaTex','fontsize',fs1)
% leg=legend('Earth surface','complete orbit');
% set(leg,'FontSize',14)

figure('color','w'), grid, box on, daspect([1 1 1]), hold on
title('Orbit','fontsize',fs2)
[Xph,Yph,Zph]=sphere(50);
mesh(RE/uu*Xph,RE/uu*Yph,RE/uu*Zph);
plot3(x.data(1:end,1)/uu,x.data(1:end,2)/uu,x.data(1:end,3)/uu,'k','linewidth',lw)
% plot3(x.data(1:i1,1)/uu,x.data(1:i1,2)/uu,x.data(1:i1,3)/uu,'r','linewidth',lw)
% plot3(x.data(i1:i2,1)/uu,x.data(i1:i2,2)/uu,x.data(i1:i2,3)/uu,'b--','linewidth',lw*0.6)
plot3(x.data(end,1)/uu,x.data(end,2)/uu,x.data(end,3)/uu,'k.','markersize',12)
xlabel('$x$ [km]','interpreter','LaTex','fontsize',fs1)
ylabel('$y$ [km]','interpreter','LaTex','fontsize',fs1)
zlabel('$z$ [km]','interpreter','LaTex','fontsize',fs1)
view(70,30)