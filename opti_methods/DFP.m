function[x0]=DFP(f,x0,regle_rech,tol)

% This script apply DFP method.
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
    tol=1e-3;
elseif nargin <4
  
    tol=1e-3;
    
  end
%==============================================================
%======================= intialization ========================
%close all;
%clear all; clc;
%x0=[4;-4];

global ctp
ctp=0;
n=length(x0);
x0=x0';
hk=eye(n);

[g0,f0]=deriv_fonc(f,x0');
g0=g0';
%fx=1;
%tol=8*10e-2;%-44;%
ite=0;
ecart=1;
ecart1=1;
while ecart1>tol | ecart1>tol
    
    dk=-hk*g0;
    
    alfa=0.5;%regle_rech(f,x0',-g0')
    
    xk=x0+alfa*dk;
    
    d_xk=alfa*dk;
    
    [gk,fx]=deriv_fonc(f,xk');
    gk=gk';
    d_gk=gk-g0;
    
    hk=hk+(d_xk*d_xk')/(d_xk'*d_gk)-((hk*d_gk)*(hk*d_gk)')/(d_gk'*hk*d_gk);
    
    g0=gk;
    
    ecart=norm(xk-x0)%/norm(xk)

    ecart1= abs(fx-f0)
    f0=fx;
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