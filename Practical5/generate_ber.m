function x = generate_ber(q,m)
% GENERATE_BER - generate Ber(q) outcomes m times
%   

x=zeros(1,m);    % 1 x m vector of zeros for storing outcomes
for j=1:m        % for all numbers from 1 to m
  u=rand;        % generate uniform pseudorandom number between 0 and 1
  x(j)=(u>=1-q); % invert cdf to find x(j)
end

% a one-line alternative to "for loop" above is:
% x=(rand(1,m)>=1-q);

% plot normalised histogram of outcomes versus theoretical pmf

close all;  % close all previous plots

support_x=[0,1];        % 1 x 2 vector with alphabet of Bernoulli r.v.
hx=histc(x,support_x);  % compute histogram of outcomes x on support (i.e. count how many 0s and 1s)
stem(support_x,hx/m);   % plot normalised histogram 
hold on;                % keep this figure when plotting next
px=[1-q,q];             % theoretical pmf of Ber(q)
stem(support_x,px,'rs'); % plot pmf

axis([-1 2 0 1]);                  % widen axis of figure (for better visualisation)
legend('empirical','theoretical'); % add legend to figure
