function xd=fr2b(t,x,MU)

xd=zeros(6,1);
r3=norm(x(1:3))^3;

xd(1:3)=x(4:6);
xd(4:6)=-MU*x(1:3)/r3;
