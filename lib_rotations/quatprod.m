function r=quatprod(q,p)

if nargin==2
    r=quapro(q,p);
else
    r=q(:,1);
    for i=2:size(q,2)
        r=quapro(r,q(:,i));
    end
end

end


function r=quapro(q,p)

qq=[0 -q(4) q(3);
    q(4) 0 -q(2);
    -q(3) q(2) 0];

Q=[q(1) -q(2:4)'; 
    q(2:4) q(1)*eye(3)+qq];

r=Q*p;

end