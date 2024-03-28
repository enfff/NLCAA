function [y,el,th]=rv2oe(x,mup)

% x: n by N matrix, where 
% n=6 or n=7: number of state variables
% N: number of samples
% y: orbital elements used for NMPC
% el: "classical" Keplerian orbital elements 
% th: true anomaly

if nargin<2
    global MU
    mup=MU;
end

Kv=[0;0;1];
rr=x(1:3,:);
vv=x(4:6,:);
r=vecnorm(rr,2,1);
rn=rr./r;
v=vecnorm(vv,2,1);

hh=crossprod(rr,vv);
h=vecnorm(hh,2,1);
hhn=hh./h;

ee=1/mup*crossprod(vv,hh)-rn;
e=vecnorm(ee,2,1);

p=h.^2/mup;
a=p./max(1-e.^2,1e-10);
ci=Kv'*hhn;

y=[a;ee;ci];

if nargout>1
    Iv=[1;0;0];
    L=crossprod(Kv,hh);
    Ln=L./vecnorm(L,2,1);
    en=ee./e;

    i=acos(ci);
    Om=acos(Iv'*Ln);

    N=size(x,2);
    for j=1:N
        om(j)=acos(Ln(:,j)'*en(:,j));
        th(j)=acos(rn(:,j)'*en(:,j));
    end

    el=[a;e;i;Om;om];
end


