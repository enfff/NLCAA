function [r_ge,v_ge,p,T]=oe2rv(y,th,mup)

a=y(1);
e=y(2);
i=y(3);
Omega=y(4);
omega=y(5);

p=a*(1-e^2);
rs=p./(1+e*cos(th));
r=[rs.*cos(th)
	rs.*sin(th)
	zeros(size(th))];

T=rot_mat([3 1 3],[Omega i omega]);
r_ge=T*r;

if nargin<3
    v_ge=[];
else
    smp=sqrt(mup/p);
    v=[-smp*sin(th);smp*(e+cos(th));zeros(size(th))];
    v_ge=T*v;
end