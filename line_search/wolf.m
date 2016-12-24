function [alfa1]=wolf(f,xk,dk)

% This script apply wolf rule

%==============================================================
% f          |-->| cost function
% xk         |<->| point
% dk         |-->| optimization direction
%==============================================================
%==============================================================
% alfa : minimizer parameter of the cost function
%==============================================================

%===================== initialization =========================

alfa_g=0; alfa_d=0; alfa1=0.5; rho=10e-4; sig=(1+rho)/2;

%======== find alpha value according to wolf rule =============

f_x=f(xk);
d_f=deriv_fonc(f,xk);

h_alfa=f(xk+alfa1*dk);
h_alfa1=f_x+rho*d_f*alfa1;
d_h0=deriv_fonc(f,xk+alfa1*dk);
d_h1=sig*d_f;

while (h_alfa>h_alfa1  & d_h0<d_h1)%(x0)
    
    if h_alfa> h_alfa1
        
        alfa_d=alfa1;
        
    elseif d_h0<d_h1
        
        alfa_g=alfa1
    end
    
    if alfa_d==0
        alfa1=alfa_g+0.1;
        
    elseif alfa_d~=0
        alfa1=(alfa_g+alfa_d)/2;
    end
    
    %=========================================
    f_x=f(xk);
    d_f=deriv_fonc(f,xk);
    
    h_alfa=f(xk+alfa1*dk);
    h_alfa1=f_x+rho*d_f*alfa1;
    d_h0=deriv_fonc(f,xk+alfa1*dk);
    d_h1=sig*d_f;
    %=========================================
    
end

end

