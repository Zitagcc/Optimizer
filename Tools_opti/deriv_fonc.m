function[df_xi,f_x]=deriv_fonc(f,x0)

% this code compute the gradient of a given function for any dimension.
% by using lim(f(x0+h)-f(x0))/h)=df(x0).
%==============================================================
% f          |-->| cost function
% x0         |-->| point 
% df_xi      |<--| derivative of f in x0
% f_x        |-->| f in x0
%==============================================================

hold off
h=10e-3;   
[m,s]=size(x0);

n=length(x0); % pb dimension
x=x0;
df_xi=[];
f_x=f(x0);
for i=1:n
    
    x(i)=x0(i)+h;
    
    df_xi=[df_xi,(f(x)-f_x)/h];
    
    x=x0;

end
    
end
