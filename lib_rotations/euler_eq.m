function wd=euler_eq(t,w)

global J
%J=[400 50 150];

wd=zeros(3,1);

wd(1)=(J(2)-J(3))/J(1)*w(2)*w(3);
wd(2)=(J(3)-J(1))/J(2)*w(1)*w(3);
wd(3)=(J(1)-J(2))/J(3)*w(1)*w(2);

% Alternative
% I=diag(J);
% wd=-inv(I)*crossprod(w,I*w);