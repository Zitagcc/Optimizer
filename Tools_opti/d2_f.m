function[d2f_xi]=d2_f(f,x0)

% this code compute the gradient of a given function for any dimension.
% by using lim(f(x0+h)-f(x0))/h)=df(x0).
%==============================================================
% f          |->| cost function
% x0         |->| point
% d2f_xi     |<-| 2nd derivative of f in x0
%==============================================================

h=10e-3;

n=length(x0); % pb dimension.
x_12_prim=x0;
x1_prim=x0;
x2=x0;
d2f_xi=zeros(n,n);
d=[];
f_x=f(x0);
for j=1:n
    x_12_prim=x0;
    x_12_prim(j)=x0(j)+h;
    x_12=x_12_prim;
    
    x1_prim=x0;
    x1_prim(j)=x0(j)+h;
    x1=x1_prim;
    
    for i=1:n
        
        if i==j
            
            x_12(i)=x_12(i)+h;
            
        else
            
            x_12(i)=x0(i)+h;
            
        end
        x2(i)=x0(i)+h;
        
        d2f_xi(i,j)=(f(x_12)-f(x1)-f(x2)+f_x)/h^2;
        
        x_12=x_12_prim; x2=x0;
    end
    %d=[d;d2f_xi']
    x_12=x0;
    x1=x0;
    x2=x0;
end
hold off
end