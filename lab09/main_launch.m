clear all 
close all 
clc

%% Parameters
global MU RE ve
MU=4e5;
RE=6371;
ve=15;
m0=30e3;

%% NMPC Design

par.model=@model_launch;
par.n=7;
par.Ts=50;
par.Tp=450;
par.R=0.1*eye(3);
par.P=diag([1e2,1e6*ones(1,4)]);
par.Q=par.P;
par.tol=[5;0.01*ones(4,1)];

K=nmpc_design_st(par)
%return

% Reference
ar=RE+500;
er=[0;0;0];
cir=1;
yr=[ar;er;cir];

%return
%% Simulation 

% Initial conditions
x0=[RE 0 0 0 0.465 0 m0]';
u0=[0;0;0];

% Simulation parameters 
Tfin=2*60*60;
st_size=1;

open('sim_orb_ctrl_1')
orbit_animation(x0,[0,90],7.5e3)
%return

%pause
xlim([5.8e3 6.8e3])
ylim([-1e3 3e3])
%pause
%return

sim('sim_orb_ctrl_1')

%% plot
%close all

i1=1;
i2=1;
orbit_plot

