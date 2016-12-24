function[sol]=optimizer(f,x,meth_opti,regle_rech,tol)
close all;
clc;
%==============================================================
% f          |->| cost function
% x          |->| solution
% meth_opti  |->| optimization method
% regle_rech |->| optimization line search method
% tol        |->| tolerance
% sol        |<-| optimization result
%==============================================================
%global R
%defaultopt = struct('f','notify','meth_opti',@gradient,'regle_rech',@goldstein,'tol',10e-4,'R',3)

addpath '../Optimiser/line_search'
addpath '../Optimiser/opti_methods'
addpath '../Optimiser/Examples_opti'
addpath '../Optimiser/opti_methods'
addpath '../Optimiser/Tools_opti'
%======================= default inputs =======================

if nargin < 3
    
    meth_opti=@gradient;
    
    regle_rech=@goldstein;
    
    tol=7.7*1e-2;
 
elseif nargin <4
    
    tol=7.7*1e-2;
    
    regle_rech=@goldstein;

elseif nargin <5
    
    tol=7.7*1e-2;
    
end
%=========================================================================
sol=meth_opti(f,x,regle_rech,tol);

