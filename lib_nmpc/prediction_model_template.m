function [f,h] = prediction_model_template(t,x,u)
% NMPC prediction model
% t: time; vector of dimenensions 1*N, where
% N is the number of samples in the time interval [t,t+Tp];
% N is automatically chosen by the NMPC solver.
% t is useful only in the case of time-varying system.
% x: state of the system; matrix of dimension nx*N.
% u: input of the system; matrix of dimension nu*N.
% f,h: functions of the state equations: 
% xdot=f(t,x,u); y=h(t,x,u).

f = ...

h = ...
    
end

