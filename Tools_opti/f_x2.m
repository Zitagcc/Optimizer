function[sol]=f_x2(x)
% this code contains few function that can be used to test optimization
% code.
%==============================================================
% x         |->| point 
% sol       |->| solution
%==============================================================
global choi_fon
global fon_sp
%choi_fon=1;

if choi_fon==1
r1=4;
x=[x(1),x(2)];    
    sol=surfelem(x,r1);

elseif choi_fon==2 % deux antennes.
r1=4;
r2=3;
x0=[x(1),x(2)];
x1=[x(3),x(4)];
    sol=1/2*(surfelem(x0,r2)+surfelem(x1,r1))+(max((r1+r2)-norm(x0-x1),0));%fminsearch^2; 

elseif choi_fon==3
    
    sol=x(1)^2+x(2)^2;
    
elseif choi_fon==4
    
    sol=x(1)^4/4+x(2)^2/2-x(1)*x(2)+x(1)-x(2);%
    
    %sol=(x(1)+10*x(2))^2+5*(x(3)-x(4))^2+(x(2)-2*x(3))^4+10*(x(1)-x(4))^4;

elseif choi_fon==5
    
    
    sol=fon_sp(x);    
    
end
hold off