clear all
close all
clc

% Declaration of symbolic variables
x=sym('x',[3 1],'real');
u=sym('u',[1 1],'real'); 

%% Plant definition

a=10.4;
b=16.5;
R=0.1;
%q=-1.16*x(1)+0.041*x(1)^3;  % Exercise 1
q=-1.194*x(1)+0.0422*x(1)^3;  % Exercise 2 

f=[a*(x(2)-x(1)-q)
    x(1)-x(2)+x(3)
    -b*x(2)-R*x(3)];
g=[0;1;0];
h=x(1);
C=[1 0 0];

xd=f+g*u;

%% Feedback linearization 

[u,mu,r]=io_fl(f,g,h,'chua');

%% Simulation

yr=ref_gen(r,'-3','chua');

tfin=60;
x0=randn(3,1)*0;

open('main_chua_sim')
% sim('main_chua_sim')


