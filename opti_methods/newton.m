function[x0]=newton(f,x0,regle_rech,tol)

% This code apply newton method.

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
    regle_rech=0;
    tol=10e-4;
    
  end
%==============================================================
%========================= intialization ======================
%close all;
%clear all; clc;

global ctp
ctp=0;

n=length(x0);

ecart=1;
ite=0;
%================= apply Newton method  ======================
while ecart>tol

    [g0,fx]=deriv_fonc(f,x0);
    
    [d2f]=d2_f(f,x0);

    %alfa=regle_rech(f,x0,-g0*inv(d2f));
    
    xn=x0-(inv(d2f)*g0')';

    %ecart=norm(x2-x);

    ecart=norm(xn-x0)/norm(xn)
    x0=xn;
    
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