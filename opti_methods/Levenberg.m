function[x0]=Levenberg(f,x0,regle_rech,tol)

% This code apply Levenberg-Marquard method.

% REMARK :
% the convergence of the method is depending mainly on the choice of mu 
% for surfelem (one antenna) case. 
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
%=========================================================================
%=========================== intialization ===============================
%close all;
%clear all; clc;
global ctp
ctp=0;
%x0=[1,1];
n=length(x0);
g0=1;

%tol=10e-5;
ecart=1;
ite=0;
mu=0.1;
%================= apply Levenberg-Marquard method ====================
while ecart>tol

    [g0,fx]=deriv_fonc(f,x0);
    g0=g0';
    [d2f]=d2_f(f,x0)';

    alfa=regle_rech(f,x0,-(inv(d2f)*g0)');
        
    xn=x0'-(inv(d2f+mu*eye(n))*g0);

    xn=xn';

    %ecart=norm(x2-x);

    ecart=norm(xn-x0)
    x0=xn;
    
    mu=mu+0.65;

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