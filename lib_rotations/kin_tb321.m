function xd=kin_tb321(t,x)

w=[0.2*sin(t);
    0.5*sin(2*t);
    0];

ph=x(1);
th=x(2);
ps=x(3);

A=[ cos(th), sin(ph)*sin(th),  cos(ph)*sin(th)
       0, cos(ph)*cos(th), -cos(th)*sin(ph)
       0,         sin(ph),          cos(ph)]/cos(th);
   
xd=A*w;