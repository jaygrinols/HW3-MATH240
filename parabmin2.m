function [x,fx,ea,iter]=parabmin2(g,xl,xr,xu,es,maxit,varargin)

% parabmin: minimization by parabolic interpolation
% adapted from Capra's goldmin script
%     finds the minimum of approximating parabolas to find min of f
% input:
%   f = name of function
%   xl, xu = lower and upper bracket, which should contain exactly
%   one local minimum and no local maxima. 
%  xr is any point inside these brackets
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1,p2,... = additional parameters used by f
% output:
%   x = location of minimum
%   fx = minimum function value
%   ea = approximate relative error (%)
%   iter = number of iterations

% In addition to the error check below inside the loop we should 
% (but did not) include two more checks:

% (A) Is y(4) really a new value? Look at y(4)==y(1) || y(4)==y(2) || y(4)==y(3)

% Also should include a check for a zero in the denominator of y(4).

% (B) If ( f(y(2))-f(y(3)) )/(y(2)-y(3))==( f(y(2))-f(y(1)) )/(y(2)-y(1))

% then the three points used to create y(4) are all on
% a line and this function fails.

% As written, this function is sloppy with function calls, 
% including MANY function calls each iteration, and  all 
% but ONE of them are repeated calculations. These values should be placed 
% in a vector at first use and NEVER recalculated.

if nargin<4,error('at least 4 input arguments required'),end
if nargin<5|isempty(es), es=0.0001;end
if nargin<6|isempty(maxit), maxit=50;end

f=@(x) g(x,varargin{:});

y(1)=xl; y(2)=xr; y(3)=xu;

iter=0;
Z2=y(1);

while(1)

if   f(y(2))>max( [f(y(1)) f(y(3))] ),error('The function has a local maximum on the interval between %8.4f and %8.4f. Choose another interval.', y(1), y(3) ),end

Z1=Z2;

y(4)=y(2)-( (y(2)-y(1))^2*( f(y(2))-f(y(3)) )-(y(2)-y(3))^2*( f(y(2))-f(y(1)) ) )/( 2*( (y(2)-y(1))*( f(y(2))-f(y(3)) )-(y(2)-y(3))*( f(y(2))-f(y(1)) )));

Z2=y(4);

y=sort(y);

  if f(y(1))==min(f(y)) || f(y(2)) == min(f(y)) 
   y=[y(1) y(2) y(3)];
  else 
  y=[y(2) y(3) y(4)];
  end
  
  iter=iter+1;
  
  if Z2~=0, ea = abs((Z2-Z1)/Z2) * 100;end
  if ea <= es | iter >= maxit,break,end
  
end

x=Z2;fx=f(Z2);