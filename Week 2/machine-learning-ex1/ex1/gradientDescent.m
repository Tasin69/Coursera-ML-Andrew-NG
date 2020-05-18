function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
x = X( : , 2);

J_history = zeros(num_iters, 1);
theta_0 = theta(1, 1);
theta_1 = theta(2, 1);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.

  theta_t = theta';
  h  = theta_t .* X;
  h_theta = sum(h, 2); 
  
  temp_theta_0 = theta_0 - ((alpha * sum(h_theta - y)) / m);
  temp_theta_1 = theta_1 - ((alpha * sum((h_theta - y) .* x) / m));
  
  theta_0 = temp_theta_0;
  theta_1 = temp_theta_1;
  theta(1) = theta_0;
  theta(2) = theta_1;




    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
