function T=axes2dcm(a0,A)

if nargin<2 || isempty(A)
    A=eye(3);
end

T=eye(3);
a=eye(3);
a(:,1)=a0(:,1);
a(:,2)=a0(:,2);
a(:,3)=crossprod(a0(:,1),a0(:,2));

for j=1:3   
    a(:,j)=a(:,j)/norm(a(:,j));
    A(:,j)=A(:,j)/norm(A(:,j));
end

for j=1:3
    for i=1:3
        T(i,j)=A(:,i)'*a(:,j);
    end
end