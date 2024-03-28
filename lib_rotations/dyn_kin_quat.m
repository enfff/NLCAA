function xd=dyn_kin_quat(t,x)

J=[937.5 833.3 270.8];

s1=(J(2)-J(3))/J(1);
s2=(J(3)-J(1))/J(2);
s3=(J(1)-J(2))/J(3);

q=x(1:4);
w=x(5:7);

Q=[-q(2) -q(3) -q(4)
    q(1) -q(4)  q(3)
    q(4)  q(1) -q(2)
   -q(3)  q(2)  q(1)];

W=[0            2*s1*w(3)   0
   2*s2*w(3)    0           0
   2*s3*w(2)    0           0];

A=[zeros(7,4) [Q;W]]/2;

xd=A*x;

global hr
animation_rot(hr,q)

