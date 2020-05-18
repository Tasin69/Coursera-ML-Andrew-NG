function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C_vec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_vec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

params = [0 0];																	%For each C and sigma, we train X and generate
lowest_error = 100000000;														%	the parameters for predicting the validation set.
for i = 1:length(C_vec)															%We then record the lowest_error and its corresponding														
	C = C_vec(i);																%	value of C and sigma and update it on vector 'params'
	for j = 1:length(C_vec)														%After all the iterations are completed, we retrieve our
		sigma = sigma_vec(j);													%	desired optimum value of C and sigma from 'params'
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));		%
		predictions = svmPredict(model, Xval);
		pred_error = mean(double(predictions ~= yval));
		if pred_error < lowest_error
			lowest_error = pred_error;
			params(1) = C;
			params(2) = sigma;
		endif
	endfor
endfor

C = params(1);
sigma = params(2);

% =========================================================================

end
