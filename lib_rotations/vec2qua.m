function [q,ang]=vec2qua(a,A)

if nargin<2 || isempty(A)
    A=eye(3);
end

q=[1;0;0;0];

for i=1:size(a,2)
    a(:,i)=a(:,i)/norm(a(:,i));
end

ang=acos(a(:,1)'*a(:,2));

ax1=(a(:,1)+a(:,2))/norm(a(:,1)+a(:,2));
ax2=(a(:,1)-a(:,2))/norm(a(:,1)-a(:,2));

q=axes2qua([ax1 ax2],A);

end