function [x0]=gradient1(f,x0,regle_rech,tol)

% this code apply gradient method.
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
n=length(x0);

%======================= default inputs =======================

if nargin < 3
    regle_rech=@goldstein;
    tol=10e-4;
elseif nargin <4
    
    tol=10e-3;
    
end
%=========================================================================

%=========================== intialisation ================================
%close all;
%clear all;
clc;
global ctp

double ecart

ctp=0; ite=1;


%f_x=1;%norm(deriv_fonc(x0));
ecart=1;
ecart=1;
f0=0;
%===================== Body of gradient method ================
while ecart>tol || ecart1>tol
    
    [d_f,f_x]=deriv_fonc(f,x0);
    
    alf=regle_rech(f,x0,-d_f);
    
    x1=x0-alf*d_f;
    
    ecart=norm(x1-x0)/(norm(x1))%
    
    ecart1=abs(f_x-f0)/max(1,abs(f_x));
    
    f0=f_x;
    
    x0=x1;
    
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



