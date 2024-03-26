clear all
close all
clc

% Declaration of symbolic variables
x=sym('x',[3 1],'real');
u=sym('u',[1 1],'real'); 

%% Plant definition

a=10.4;
b=16.5;
R=0;
q=-1.16*x(1)+0.041*x(1)^3;

% figure
% ezplot(q,[-3 3])
% xlabel('$x_1$','interpreter','latex','fontsize',20)
% ylabel('$\rho(x_1)$','interpreter','latex','fontsize',20)
% grid
% return

f=[a*(x(2)-x(1)-q)
    x(1)-x(2)+x(3)
    -b*x(2)-R*x(3)];

g=[0;1;0];

h=x(1);
C=[1 0 0];

xd=f+g*u;

matlabFunction(xd,'File','fg_chua','Vars',{[u;x]});
%return

%% Feedback linearization 

[u,mu,ga]=io_fl(f,g,h,'chua')
%return

%% Linear controller 

A=[0 1
    0 0];

B=[0;1];

K=place(A,B,[-1 -2]);
%return

%% Simulation

%ref='sin(2*t)';
ref='1';
yr=ref_gen(ga,ref,'chua');

tfin=60;
x0=randn(3,1)*0;

open('main_chua_fl_sim')
% sim('main_chua_fl_sim')


