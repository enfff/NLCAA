function xd=spacecraft_dynamics(t,x,u,d)

% parameters
global MU RE ve
mb=4e3;

% variables
if size(x,2)>1 && size(u,2)==1
    u=u*ones(1,size(x,2));
    d=d*ones(1,size(x,2));
end
r=vecnorm(x(1:3,:),2,1);
v=vecnorm(x(4:6,:),2,1);
m_dot=-vecnorm(u,2,1)/ve;

% end of propellant 
ii=find(x(7,:)<=mb);
x(7,ii)=mb;
u(:,ii)=0;
m_dot(ii)=0;

% drag force
cd=1;
S=12;       % m^2
rho0=1.22;  % kg/m^3
H=8;        % km
rho=rho0*exp(-(r-RE)/H);
cf=1e3;     % conversion factor m -> km
Fdrag=-1/2*cd*S*rho.*v.*x(4:6,:)*cf;

% state equations
xd(1:3,:)=x(4:6,:);
xd(4:6,:)=-MU*x(1:3,:)./r.^3+(Fdrag+d+u)./x(7,:);
xd(7,:)=m_dot;









