function[x0]=grad_conjugate(f,x0,regle_rech,tol)

% This script apply conjugate gradient method.
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
ctp=0
x0=x0';

[g0,f0]=deriv_fonc(f,x0');
g0=g0';
ecart=1;
%ecart1=1;
ite=0;

while ecart>tol %&& ecart1>tol
    
    d0=-g0;
    
    alfa=regle_rech(f,x0',-g0');%-(g0'*d0)/(d0'*q*d0);
    
    xk=x0+alfa*d0;
    
    [gk,fx]=deriv_fonc(f,xk');
    
    gk=gk';
    
    beta=(gk'*gk)/(g0'*g0);
    
    g0=gk;
    
    dk=-gk+beta*d0;
    
    
    ecart=norm(xk-x0)/(2*norm(xk))
    
    %ecart1=abs(fx-f0)/abs(fx);
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

