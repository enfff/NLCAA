function F=def_frame(v1,v2)

v1=v1/norm(v1);
v2=v2/norm(v2);

F(:,1)=(v1+v2)/norm(v1+v2);
F(:,2)=(v1-v2)/norm(v1-v2);
F(:,3)=crossprod(F(:,1),F(:,2));
F(:,3)=F(:,3)/norm(F(:,3));