function w=qua2omega(q,q_dot)


Q=[q(1) -q(2) -q(3) -q(4);
    q(2) q(1) -q(4) q(3);
    q(3) q(4) q(1) -q(2);
    q(4) -q(3) q(2) q(1)];

omega=2*inv(Q)*q_dot;
w=omega(2:4);