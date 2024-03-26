function F=nlcon(x,y)
% NMPC constraint function
% x: state of the system; matrix of dimension nx X N.
% y: output of the system; matrix of dimension ny X N.
% N is the number of samples in the time interval [t,t+Tp]
% N is automatically chosen by the NMPC solver.
% F: constraint function; Nc X N matrix, where
% Nc is the number of constraints.
% Constraints are written in the standard form F(x,y)<=0.

F(1,:)=10-vecnorm(x(1:3,:));
% F(1,:)=10-sqrt(sum(x(1:3,:).^2,1));
% F(2,:)=...;




