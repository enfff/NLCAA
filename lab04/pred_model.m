function [f,h]=pred_model(t,x,u)
% NMPC prediction model
% t: time; vector of dimenensions 1 X N, where
% N is the number of samples in the time interval [t,t+Tp];
% N is automatically chosen by the NMPC solver.
% t is useful only in the case of time-varying system.
% x: state of the system; matrix of dimension nx X N.
% u: input of the system; matrix of dimension nu X N.
% f,h: functions of the state equations: 
% xdot=f(t,x,u); y=h(t,x,u).

w=0.0011;

A=[0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1
   3*w^2 0 0 0 2*w 0
   0 0 0 -2*w 0 0
   0 0 -w^2 0 0 0];

B=[zeros(3);eye(3)];

f=A*x+B*u;

h=x;

