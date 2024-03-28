function yr=ref_gen(r,ff,nome)

syms t real

yr=sym(zeros(r+1,1));

yr(1)=eval(ff);

for i=1:r
    yr(i+1)=diff(yr(i),'t');
end

if nargin>2 && ~isempty(nome)
    matlabFunction(yr,'File',['ref_' nome],'Vars',t);
    yr=yr(1:r+1);
end

end





