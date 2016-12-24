function[x0]=BFGS(f,x0,regle_rech,tol)

% This script apply BFGS method.
%==============================================================
% f          |-->| cost function
% x0         |<->| the start point
% regle_rech |-->| optimization line search method
% tol        |-->| tolerance
%==============================================================
%==============================================================
% alfa : optimization step
% ite  : iteration number
% ctp  : call number of the cost function
%==============================================================
%======================= default inputs =======================

if nargin < 3
    regle_rech=@goldstein;
    tol=10e-4;
elseif nargin <4
    
    tol=10e-4;
    
end
%==============================================================
%======================= intialization ========================
%close all;
%clear all; clc;
%x0=[4;-4];

global ctp


x0=x0';
n=length(x0);

hk=eye(n);

g0=deriv_fonc(f,x0')';
%fx=1;
%tol=10e-4;%-44;%
ite=0;
%regle_rech=4;
d_xk=1;
%================== le corps de la méthode du gradient ===================
ecart=1
while ecart>tol
    
    if mod(ctp,2)==0
        
        dk=-g0;
        
    else
        
        dk=-hk*g0;
        
    end
    
    alfa=regle_rech(f,x0',-g0');%(f,x0,-g0,regle_rech);
    
    xk=x0+alfa*dk;
    
    d_xk=alfa*dk;
    ecart=norm(d_xk)/norm(xk)
    [gk,fx]=deriv_fonc(f,xk');
    
    gk=gk';
    
    d_gk=gk-g0;
    
    hk=hk+(1+(d_gk'*hk*d_gk)/(d_gk'*d_xk))*(d_xk*d_xk')/(d_xk'*d_gk)-(hk*d_gk*d_xk'+(hk*d_gk*d_xk')')/(d_gk'*d_xk);
    
    g0=gk;
    
    x0=xk;
    
    ite=ite+1;
    
end

fprintf('optimal point\n')
x0

fprintf('number of cost function calls')
ctp

fprintf('iteration number')
ite

fprintf('value of cost function in x*')
fx
end