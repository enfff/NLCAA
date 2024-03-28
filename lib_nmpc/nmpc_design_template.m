clear all
close all
clc

%% Plant parameters


%% NMPC design

par.model=@pred_model;
par.nlc=@fcon;
par.n=...

par.Ts=...
par.Tp=...

par.P=...
par.Q=...
par.R=...

par.lb=...
par.ub=...

K=nmpc_design_st(par);
    
%% Simulation


