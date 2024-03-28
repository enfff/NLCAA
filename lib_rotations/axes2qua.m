function q=axes2qua(a,A)

if nargin<2 || isempty(A)
    A=eye(3);
end

T=axes2dcm(a,A);
q=dcm2qua(T);