function[sol]=test_area_opti()

addpath '../Optimiser/line_search'
addpath '../Optimiser/opti_methods'
addpath '../Optimiser/Examples_opti'
addpath '../Optimiser/opti_methods'
addpath '../Optimiser/Tools_opti'
%t=cputime;

%--- Exemple 1 :
% x0=[4,-4];%,-2,6];%
% sol=optimizer(@surfelem,x0,@gradient1,@goldstein);

% fprintf('temps du calcul \n')


%--- Exemple 2 :

 x0=[4,-4,-2,6];%
 sol=optimizer(@surfelem2,x0,@DFP,@goldstein); 

%--- Exemple 3 :

% x0=[4,-4,-2,6]';%
 %sol=optimizer(@f_test,x0,@grad_conjugate,@wolf); 



%e=cputime-t

