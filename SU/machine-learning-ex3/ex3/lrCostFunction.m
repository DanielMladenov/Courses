function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)


%size(theta);
	temp = []
	ones_y = ones(size(y));
	h0 = sigmoid(X * theta);
	%t1 = (  (-y .* log(h0)))
	%t2 =  (-(  (ones_y - y) .* log(1 - h0) )) 
	temp = (  (-y .* log(h0))) - (  (ones_y - y) .* log(1 - h0) );
	
	tt = theta(2:end,:);
	regul = (lambda/(2*m)) * sum(tt.^2);
	
	ret = ( (1/m) * (sum(temp))) + regul;
	
	J = ret;

%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

tempT = theta;
tempT(1,1) = 0;

retG = (1/m) *  (X'* (h0 - y) );
retG = retG + (lambda/m * tempT) ;







% =============================================================

%grad = grad(:);
grad = retG;

end
