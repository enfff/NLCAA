function F = constraint_function_template(x,y)
% NMPC constraint function
% x: state of the system; matrix of dimension nx*N.
% y: output of the system; matrix of dimension ny*N.
% N is the number of samples in the time interval [t,t+Tp]
% N is automatically chosen by the NMPC solver.
% F: constraint function; Nc*N matrix, where
% Nc is the number of constraints.
% Constraints are written in the standard form F(x,y)<=0.

F(1,:) = ...
F(2,:) = ...

end



