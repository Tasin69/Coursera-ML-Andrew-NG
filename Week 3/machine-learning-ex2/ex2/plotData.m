function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

x1 = X( : , 1);
x2 = X( : , 2);
x1_b = zeros(2, 1);
x2_b = zeros(2, 1);
x1_r = zeros(2, 1);
x2_r = zeros(2, 1);

for i = 1:size(y)
  if y(i) == 1
    x1_b(i) = x1(i);
    x2_b(i) = x2(i);
  else
    x1_r(i) = x1(i);
    x2_r(i) = x2(i);
  endif
endfor

x1_b = nonzeros(x1_b);
x2_b = nonzeros(x2_b);
x1_r = nonzeros(x1_r);
x2_r = nonzeros(x2_r);
plot(x1_b, x2_b, 'bo');
plot(x1_r, x2_r, 'r*');







% =========================================================================



hold off;

end
