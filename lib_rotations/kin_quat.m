function qd=kin_quat(t,q)

w=[0.2*sin(t);
    0.5*sin(2*t);
    0];

q=q/norm(q);

Q=[-q(2) -q(3) -q(4)
    q(1) -q(4) q(3)
    q(4) q(1)  -q(2)
    -q(3) q(2) q(1)];

qd=1/2*Q*w;

global hr
animation_rot(hr,q);