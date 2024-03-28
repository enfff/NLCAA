function [dq,dq_vec] = quat_error(qr,q)

qs=[q(1);-q(2:4)];
dq=quatprod(qs,qr);
dq_vec=dq(2:4);
%ndq=norm(dq_vec);

end