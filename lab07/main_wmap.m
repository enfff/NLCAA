clear all
close all
clc

load cube
ll=[1.5 1.5 1];
hr=diag(ll/2)*hr;

J=[399 -2.81 -1.31;
    -2.81 377 2.54;
    -1.31 2.54 377];
IJ=inv(J);

% initial conditions
q0=[0;0;1;0];
w0=[0.1;-0.9;0.12];

% reference
thr=0.3927;
ea_dot_ref=[0.001745;0;0.04859];

animation_rot(hr,q0)
view(10,10)

Tfin=400;

open('sim_wmap')