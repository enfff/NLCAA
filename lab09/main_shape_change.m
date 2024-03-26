clear all 
close all 
clc

%% Parameters
global MU RE ve
MU=4e5;
RE=6371;
ve=4.4;
m0=10e3;

%% NMPC Design

par.model=@model_orbit;
par.n=7;
par.Ts=30;
par.Tp=90;
par.R=0.1*eye(3);
par.P=diag([1,1e5*ones(1,4)]);
par.ub=132*ones(3,1);
par.lb=-132*ones(3,1);
par.tol=[1;0.005*ones(4,1)];
par.Tctrl=500;

K=nmpc_design_st(par);

% Reference
ar=(RE+500)*1.3;
er=[0.25;0;0];
cir=1;
yr=[ar;er;cir];

%return
%% Simulation 

% Initial conditions
r0=(RE+500);
v0=sqrt(MU/r0);
x0=[r0 0 0 0 v0 0 m0]';
u0=[0;0;0];

% Simulation parameters 
Tfin=30000;
st_size=2;

open('sim_orb_ctrl_1')
%return

%% simulation 

sim('sim_orb_ctrl_1')

return
%% plot
close all
% clc

i1=580;
i2=1200;
Tctrl=K.Tctrl;
orbit_plot


