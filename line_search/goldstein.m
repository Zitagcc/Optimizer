function[alfa1]=goldstein(f,xk,dk)

% This script apply goldstein rule
%==============================================================
% f          |-->| cost function
% xk         |<->| point
% dk         |-->| optimization direction
%==============================================================
%==============================================================
% alfa : minimizer parameter of the cost function
%==============================================================

%==================== initialization ==========================

alfa_g=0; alfa_d=0; alfa1=0.5; rho=10e-4; delta=(1+rho)/2;

%===== find alpha value according to goldstein rule ===========

d_f=deriv_fonc(f,xk);

f_x=f(xk);

h_alfa=f(xk+alfa1*dk);

h0_delta=f_x+delta*d_f*alfa1;

h0_rho=f_x+rho*d_f*alfa1;

while (h_alfa>h0_delta & h_alfa<h0_rho)
    
    if h_alfa> h0_delta
        
        alfa_d=alfa1;
        
    elseif h_alfa<h0_rho
        
        alfa_g=alfa1;
    end
    
    if alfa_d==0
        alfa1=alfa_g+1;
        
    elseif alfa_d~=0
        alfa1=(alfa_g+alfa_d)/2;
    end
    
    %===============================================
    d_f=deriv_fonc(f,xk);
    
    f_x=f(xk);
    
    h_alfa=f(xk+alfa1*dk);
    
    h0_delta=f_x+delta*d_f*alfa1;
    
    h0_rho=f_x+rho*d_f*alfa1;
    %===============================================
end

end


