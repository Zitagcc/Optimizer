function[sol]=surfelem2(x)

r1=4;
r2=3;

x0=[x(1),x(2)];
x1=[x(3),x(4)];
    sol=1/2*(surfelem(x0,r2)+surfelem(x1,r1))+(max((r1+r2)-norm(x0-x1),0));
hold off
end