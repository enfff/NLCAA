clear
close all
clc

% Declaration of symbolic variables
syms x [3 1] real
syms u

a=10.4;
b=16.5;
R=0.1;
q=-1.16*x1+0.041*x1^3;  % Exercise 1
% q=-1.194*x1+0.0422*x1^3;  % Exercise 2 

f = [
    a*(x2-x1-q)
    x1-x2+x3
    -b*x2-R*x3
];

g=[0 1 0]';
h=x1;
C=[1 0 0];

xd=f+g*u;
[u,mu,r]=io_fl(f,g,h,'chua');

% simulation

yr=ref_gen(r,'-3','chua');

tfin=30;
x0=randn(3,1)*0;

% open('main_chua_sim')
sim('main_chua_sim')


