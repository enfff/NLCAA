function T=rot_mat(I,t)

T=RR(I(1),t(1))*RR(I(2),t(2))*RR(I(3),t(3));

end

function A=RR(i,x)

switch i
    case 1
        A=[1 0 0; 0 cos(x) -sin(x); 0 sin(x) cos(x)];
    case 2
        A=[cos(x) 0 sin(x); 0 1 0; -sin(x) 0 cos(x)];
    case 3
        A=[cos(x) -sin(x) 0; sin(x) cos(x) 0; 0 0 1];
end
end


