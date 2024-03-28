function animation_rot(hr,q)

if isempty(hr), return, end

hr1=rot_quat(q,hr);

o1=findobj('tag','hyperrct');
if isempty(o1)   
    figura_iniziale(hr1)
else
    modifica_figura(hr1);
    pause(0.01)
end

end

function figura_iniziale(hr)

fs1=20;
l1=2;

figure('color','w');
grid, hold on
daspect([1 1 1])
view(30,20)

plot3(hr(1,:),hr(2,:),hr(3,:),'color','r','tag','initial','linewidth',1.2);
plot3(hr(1,:),hr(2,:),hr(3,:),'color','b','tag','hyperrct','linewidth',1.2);

xlim([-l1 l1])
ylim([-l1 l1])
zlim([-l1 l1])

xlabel('$X$','interpreter','latex','fontsize',fs1)
ylabel('$Y$','interpreter','latex','fontsize',fs1)
zlabel('$Z$','interpreter','latex','fontsize',fs1)

end

function modifica_figura(hr1)

o1=findobj('tag','hyperrct');
set(o1,'xdata',hr1(1,:));
set(o1,'ydata',hr1(2,:));
set(o1,'zdata',hr1(3,:));

end

function v1=rot_quat(q,v)
qs=[q(1);-q(2:4)];
v=[zeros(1,size(v,2));v];
v1=qua_pro(q,qua_pro(v,qs));
v1=v1(2:4,:);
end

function p=qua_pro(q,r)
if size(r,2)>1   
    for i=1:size(r,2)
        [~,qq]=crossprod1(q(2:4),r(2:4,i));
        Q=[q(1) -q(2:4)'; q(2:4) q(1)*eye(3)+qq];
        p(:,i)=Q*r(:,i);
    end   
else   
    for i=1:size(q,2)
        [~,qq]=crossprod1(q(2:4,i),r(2:4));
        Q=[q(1,i) -q(2:4,i)'; q(2:4,i) q(1,i)*eye(3)+qq];
        p(:,i)=Q*r;
    end   
end
end

function [p,qq]=crossprod1(q,r)

q=q(:);
r=r(:);

qq=[0 -q(3) q(2);
    q(3) 0 -q(1);
    -q(2) q(1) 0];

p=qq*r;

end
