clear all
close all
clc

load cube
ll=[1.1 1 2];
hr=diag(ll/2)*hr;

J=diag([10 9 12]*1e3);
IJ=inv(J);

q0=[0.6853 0.6953 0.1531 0.1531]';
w0=[0.53 0.53 0.053]';
qr=[1 0 0 0]';

% q0=[1;0;0;0];
% w0=[0;0;0];
% th=pi*3/4;
% qr=[cos(th/2);0;sin(th/2);0];

animation_rot(hr,q0)
view(10,10)

Tfin=500;

sim('sim_regulation')