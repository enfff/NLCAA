function [u,mu,ga,a,b,MU]=io_fl(f,g,h,nome)
% f,g,h: functions defining the system
% nome: name of the Matlab function created from the symbolic expressions
% u: feedback linearization control law
% mu: state transformation
% ga: relative degree
% MU: augmented state transformation (MU(1:r)=mu)
% a,b: functions of the normal form

n=size(f,1);
mu=sym('mu',[n 1],'real');
MU=sym('MU',[n 1],'real');
syms v u real

[~,Lder]=lieder(f,h,n);
ga=1;

for i=0:n-1
    if i==0
        ll{i+1}=lieder(g,h,1);
        mu(i+1)=h;
    else
        ll{i+1}=lieder(g,Lder{i},1);
        mu(i+1)=Lder{i}+ll{i}*u;
    end
    if isequal(ll{i+1},sym(0))
        ga=i+2;
    end
end

if ga==1
    b=lieder(g,h,1);
else
    b=lieder(g,Lder{ga-1},1);
end
a=Lder{ga};
u=(-a+v)/b;

MU=mu(1:n);
mu=mu(1:ga);

if nargin>3 && ~isempty(nome)
    x=sym('x',[n 1],'real');
    matlabFunction(u,'File',['u_' nome],'Vars',{[v;x]});
    matlabFunction(mu,'File',['mu_' nome],'Vars',{x});
end

end

