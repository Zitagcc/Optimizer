function[sol]=f_test(x)

global ctp
sol=x(1)^2+x(2)^2;
%sol=(x(1)-4)^4+(x(2)-3)^2+4*(x(3)+5)^4;
%plot(x(1),sol,'ro');
%hold on
ctp=ctp+1;