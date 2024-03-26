clear all
close all
clc

% Declaration of symbolic variables
x=sym('x',[3 1],'real');
syms u v t real
syms a b R real

var=1;

%% Plant definition

a=10.4;
b=16.5;
q=-1.16*x(1)+0.041*x(1)^3;
R=0.1;

% figure
% ezplot(q,[-3 3])
% xlabel('$x_1$','interpreter','latex','fontsize',20)
% ylabel('$\rho(x_1)$','interpreter','latex','fontsize',20)
% grid

f=[a*(x(2)-x(1)-q)
   x(1)-x(2)+x(3)
   -b*x(2)-R*x(3)]
g=[0;1;0];
h=x(1);

xd=f+g*u; 

matlabFunction(xd,'File','fg_chua','Vars',[u;x]);

%% Jacobian linearization 

A=jacobian(f,x)
A=subs(A,x,zeros(3,1))
A=double(A)
C=[0 1 0]

M=ss(A,g,C,0);
zpk(M)

%% State feedback control design

Mc=ctrb(A,g);
rank(Mc)

K=place(A,g,[-1,-2,-3]);
A-g*K

%% Integral state feedback control design

% Augmented system
Aa=[A zeros(3,1);C 0];
Ba=[g;0];

% Controllability check
Mc=ctrb(Aa,Ba);
rank(Mc)

% Controller design
KI=place(Aa,Ba,-(1:4));

eig(Aa-Ba*KI)


%% Simulation

tfin=150;
x0=randn(3,1)*0;

open('sim_chua_lin_ctrl')


