function[alfa1]=armijo(f,xk,dk)

% This script apply Armijo rule
%==============================================================
% f          |-->| cost function
% xk         |<->| point
% dk         |-->| optimization direction
%==============================================================
%==============================================================
% alfa : minimizer parameter of the cost function
%==============================================================

%==================== initialization ==========================
alfa_d=0; alfa1=0.5; rho=10e-4; 

%==============================================================

while (f(xk+alfa1*dk)>f(xk)+rho*deriv_fonc(f,xk)*alfa1)
    
    alfa_g=alfa1; 
   
    if alfa_d==0
        
        alfa1=alfa_g+1;
        
    else
        
        alfa1=(alfa_d+alfa_g)/2;
    
    end
end
