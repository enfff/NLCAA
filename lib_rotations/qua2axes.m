function ax=qua2axes(q)

ax=zeros(3,3);

qs=[q(1);-q(2:4)];

ax0=eye(3);

for i=1:3
    a=quatprod(q,quatprod([0;ax0(:,i)],qs));
    ax(:,i)=a(2:4)/norm(a(2:4));
end