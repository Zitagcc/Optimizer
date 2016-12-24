function surf=surfelem(P,R)

%======================= default input =======================
if nargin < 2
    R=4; 
  end
%=============================================================

%global R
%R=4;
% Approximate calculation of the surface of the intersection of
% M and a disc with center P and radius R
%==============================================================
% P          |-->| center circle coordinates
% R          |-->| circle radius
% surf       |<--| surface of the intersection map-disc
%==============================================================
% M table with 2 colunms (xi,yi) coordonates of boundary points
%==============================================================
global ctp
ctp=ctp+1;
load 'loire.mat' x y
x=[x;x(1)];
y=[y;y(1)];  

M=[x,y];

plot(M(:,1),M(:,2),'b'); % draw map
hold on
%R=4;
plot( P(1),P(2),'o'); % drawing center of disc
hold on

surf=0; % initialization
ML=M;   
        
npoints=size(M,1); % nomber of M lines


u1= ML(1,:)-P;  % vector of radius

if norm(u1)>R 
   ML(1,:)=P+R*u1/norm(u1); % intersection disc/map 
end

% compute of total surface
for i=1: npoints-1
   u1= ML(i,:)-P;
   u2= ML(i+1,:)-P;
   if norm(u2)>R       
      ML(i+1,:)=P+R*u2/norm(u2);
   end
   u1= ML(i,:)-P;
   u2= ML(i+1,:)-P;

   surftri=0.5*(u1(1)*u2(2)-u1(2)*u2(1));
   surf=surf+surftri;
end

plot(ML(:,1),ML(:,2),'r', 'linewidth',2); % draw of cirle in red
 
axis equal
hold on
surf=-surf; %( we minimize - surf, so we return - surf )
pause(0.1) 
%hold off
