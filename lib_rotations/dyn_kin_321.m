function xd=dyn_kin_321(t,x,u,lin)

J=[937.5 833.3 270.8];
s1=(J(2)-J(3))/J(1);
s2=(J(3)-J(1))/J(2);
s3=(J(1)-J(2))/J(3);

ph=x(1);
th=x(2);
ps=x(3);
Ak=[ cos(th), sin(ph)*sin(th),  cos(ph)*sin(th)
       0, cos(ph)*cos(th), -cos(th)*sin(ph)
       0,         sin(ph),          cos(ph)]/cos(th);
   
w=x(4:6);
W=[0            2*s1*w(3)   0
   2*s2*w(3)    0           0
   2*s3*w(2)    0           0];

% beta=0.01;
% W=W-beta*eye(3);

A=[zeros(6,3) [Ak;W]]; %eig(A), pause
B=[zeros(3,3); diag(1./J)];

xd=A*x+B*u;

if lin==1
    Alin=[zeros(6,3) [eye(3);zeros(3,3)]];
    xd=Alin*x+B*u;
end



