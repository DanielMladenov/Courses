function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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

tempMatrix = zeros(64,3);
t = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

currentErr = 1.0;
row = 1;
for i = t
	for s = t
		tempMatrix(row,1) = i;
		tempMatrix(row,2) = s;
		
		model= svmTrain(X, y, i, @(x1, x2) gaussianKernel(x1, x2, s));
		predictions = svmPredict(model, Xval);
		
		tempMatrix(row,3) =  mean(double(predictions ~= yval));
		
		row = row + 1 ;
		
		if (mean(double(predictions ~= yval))) < currentErr
			currentErr = (mean(double(predictions ~= yval)))
			C = i;
			sigma = s;
		endif
		
		
	end 
end 
tempMatrix
C
sigma
%[minval, Retrow] = min(min(tempMatrix,[],3));









% =========================================================================

end
