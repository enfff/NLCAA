clear
close all
clc

jacobian

syms x [3 1] real
syms u real

a=10;
b=100/7; 
R=0;

q=2/7*x1^3-8/7*x1;

f = [a*(x2-x1-q)
   x1-x2+x3
   -b*x2-R*x3
];
g = [0 1 0]';
h=x1;
C=[1 0 0];

ff = f+g*u;

matlabFunction(ff,'File','fg_chua');

%% Exercise 1

% equilibrium points
[xe1,xe2,xe3]=solve(f);     
for i=1:length(xe1)
    xeq(:,i)=double([xe1(i); xe2(i); xe3(i)]);
end

F=jacobian(ff,x);            % linearization

for i=1:length(xe1) 
    %xeq(:,i)=double([xe1(i); xe2(i); xe3(i)])
    subs(ff,[x;u],[xeq(:,i);0]) 
    As=subs(F,x,xeq(:,i));
    A{i}=double(As);
%     eig(A{i})                  % stability study
end

%% Exercise 2 

Tfin=50;
x0=randn(3,1)*0.01; % random initial condition
xp0=x0+[0.01;0;0];  % random initial condition + perturbation

open('chua_sim')
sim('chua_sim')

figure,     plot3(x(:,1),x(:,2),x(:,3), color="red", DisplayName="Trajectory")
hold on,    plot3(xp(:,1),xp(:,2),xp(:,3), color="blue", DisplayName="Perturbed Trajectory")

plot3(x,xp)

xlabel('$x_1$','interpreter','latex','fontsize', 20)
ylabel('$x_2$','interpreter','latex','fontsize', 20)
zlabel('$x_3$','interpreter','latex','fontsize', 20)
view(20,50)

%% Exercise 3

ie=1;
K=place(A{ie},g,[-1,-2,-3]);     % eigenvalues for the linear controller

Tfin=30;
x0=randn(3,1)*0.2;

open('chua_c_sim')
sim('chua_c_sim')

figure
grid, hold on

plot3(x(:,1),x(:,2),x(:,3))
xlabel('$x_1$','interpreter','latex','fontsize', 20)
ylabel('$x_2$','interpreter','latex','fontsize', 20)
zlabel('$x_3$','interpreter','latex','fontsize', 20)
view(20,50)