function [q,p]=ele_quat(I,t)

q=zeros(4,3);
p=zeros(4,1);

for i=1:3
    %q(:,i)=zeros(4,1);
    q(1,i)=cos(t(i)/2);
    q(1+I(i),i)=sin(t(i)/2);
end

p=quatprod(q(:,1),quatprod(q(:,2),q(:,3)));








