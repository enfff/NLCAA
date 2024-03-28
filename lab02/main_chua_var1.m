clear
close all
clc

syms x [3 1] real
syms u real

%% Plant definition

a=10.4;
b=16.5;
R=0;

q=-1.16*x(1)+0.041*x(1)^3;

f = [a*(x2-x1-q)
    x1-x2+x3
    -b*x2-R*x3];
g=[0 1 0]';
h=x1;
C=[1 0 0];

xd=f+g*u;

matlabFunction(xd,'File','fg_chua','Vars',{[u;x]});
[u,mu,ga]=io_fl(f,g,h,'chua');

% controller definition

A = [
    0 1
    0 0
];

B=[0 1]';

K=place(A,B,[-1 -2]);

% alternaively, adopt a PID controller with
% M=ss(A,g(1:2),C(1:2),0);
% K = pidtune(M,'pidf',5)

% Simulation

ref='1'; %ref='sin(2*t)';
yr=ref_gen(ga,ref,'chua');

tfin=60;
x0=randn(3,1)*0;

open('main_chua_fl_sim')
% sim('main_chua_fl_sim')


