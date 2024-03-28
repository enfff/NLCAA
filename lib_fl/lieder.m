function [lied,Lder]=lieder(f,h,m)

if nargin<3
    m=1;
end

nx=size(f,1);
x=sym('x',[nx 1],'real');

for i=1:m
    if i==1
        Lder{i}=gradient(h,x)'*f;
    else
        Lder{i}=gradient(Lder{i-1},x)'*f;
    end
    Lder{i}=simplify(Lder{i});
end

lied=Lder{m};

end

