function r2=vec_rot_quat(q,r1)

N=size(r1,2);
r2=zeros(size(r1));

qs=[q(1);-q(2:4)];
R1=[zeros(1,N);r1];

for i=1:N
    R2=quatprod(q,quatprod(R1(:,i),qs));
    r2(:,i)=R2(2:4);
end