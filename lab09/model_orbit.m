function [f,y]=model_orbit(t,x,u)

global MU 

r3=sqrt(sum(x(1:3,:).^2,1)).^3;

f(1:3,:)=x(4:6,:);
f(4:6,:)=-MU*x(1:3,:)./r3+u./x(7,:);
f(7,:)=0;

y=rv2oe(x);





