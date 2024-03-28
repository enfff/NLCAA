function beta=qua2euler(q)
 
% DCM matrix
T=[q(1)^2+q(2)^2-q(3)^2-q(4)^2 2*(q(2)*q(3)-q(1)*q(4)) 2*(q(2)*q(4)+q(1)*q(3))
    2*(q(2)*q(3)+q(1)*q(4)) q(1)^2-q(2)^2+q(3)^2-q(4)^2 2*(q(3)*q(4)-q(1)*q(2))
    2*(q(2)*q(4)-q(1)*q(3)) 2*(q(3)*q(4)+q(1)*q(2)) q(1)^2-q(2)^2-q(3)^2+q(4)^2];

% 321 angles
ph=atan2(T(3,2),T(3,3));
th=atan2(-T(3,1),sin(ph)*T(3,2)+cos(ph)*T(3,3));
ps=atan2(-cos(ph)*T(1,2)+sin(ph)*T(1,3),cos(ph)*T(2,2)-sin(ph)*T(2,3));

beta=[ps;th;ph];

