function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
x1 = X( : , 2);
x2 = X( : , 3);
x3 = X( : , 4);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

  theta_t = theta';
  h  = theta_t .* X;
  h_theta = sum(h, 2); 
  
  temp_theta_0 = theta(1) - ((alpha * sum(h_theta - y)) / m);
  temp_theta_1 = theta(2) - ((alpha * sum((h_theta - y) .* x1) / m));
  temp_theta_2 = theta(3) - ((alpha * sum((h_theta - y) .* x2) / m)); 
  temp_theta_3 = theta(4) - ((alpha * sum((h_theta - y) .* x3) / m));  
  
  theta(1) = temp_theta_0;
  theta(2) = temp_theta_1;
  theta(3) = temp_theta_2;
  theta(4) = temp_theta_3;

  theta = [theta(1) ; theta(2) ; theta(3) ; theta(4)];









    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
