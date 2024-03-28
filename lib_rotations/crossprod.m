function prod=crossprod(q,p)

prod=[q(2,:).*p(3,:)-q(3,:).*p(2,:);
    q(3,:).*p(1,:)-q(1,:).*p(3,:);
    q(1,:).*p(2,:)-q(2,:).*p(1,:)];

end