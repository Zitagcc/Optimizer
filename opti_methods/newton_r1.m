function[x0]=newton_r1(f,x0,regle_rech,tol)%(@f_x2,x,choi_regle,tol)

% This code apply Newton rang1 method.
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
%======================== intialization =======================
global ctp

%clear all; clc;

%x0=[4;-4];  % point initial.
x0=x0';

n=length(x0); % pb dimension

hk=eye(n); % matrix identity

g0=deriv_fonc(f,x0')';%ones(n,1);  % intial gradient

%tol=10e-5;  % tolerance

ite=0;   % iteration counter
fx=0;
%choi=4;  % choix de la méthode de la recherchel linéaire.
ecart=1;
while ecart>tol
    
    dk=-hk*g0;
    
    alfa=regle_rech(f,x0',-g0');%(f,x0,-g0,regle_rech);
    
    xk=x0+alfa*dk;
    
    [gk,fx]=deriv_fonc(f,xk');
    gk=gk';
    d_xk=alfa*dk;
    
    d_gk=gk-g0;
    
    hk=hk+(d_xk-hk*d_gk)*(d_xk-hk*d_gk)'/(d_gk'*(d_xk-hk*d_gk));
    
    ecart=norm(d_xk)
    
    x0=xk;
    
    g0=gk;
    
    ite=ite+1;
    
end

fprintf('The optimal point\n')
x0

fprintf('Nomber of cost function calls')
ctp

fprintf('Nomber of iteration')
ite

fprintf('Value of cost function in x*')
fx
end

%function[sol]=f(x)

%sol=x(1)^2+(x(2)+3)^2;

%end

