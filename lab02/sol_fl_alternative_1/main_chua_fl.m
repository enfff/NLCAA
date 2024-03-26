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

f=[a*(x(2)-x(1)-q)
    x(1)-x(2)+x(3)
    -b*x(2)-R*x(3)]
g=[0;1;0];
h=x(1);
C=[1 0 0];
xd=f+g*u;

matlabFunction(xd,'File','fg_chua','Vars',[u;x]);

%% Feedback linearization 

[u,mu]=io_fl(f,g,h,'chua');

%% Linear controller (PID)

A=[0 1
    0 0];

M=ss(A,g(1:2),C(1:2),0);
K=pidtune(M,'pidf',5);

%% Simulation

tfin=30;
x0=randn(3,1)*0;

open('sim_chua_fl')
