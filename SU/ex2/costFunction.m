function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
x0 = ones(length(y), 1);
updateMatrix = [x0 X(:, 1:columns(X)-1)];


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
ret = [];
temp = 0;

for row = 1:m
	h0 = sigmoid(X(row, :) * theta);
	temp = ( (-y(row) * log(h0) ) - ( (1-y(row)) * log((1-h0)) ) );
	temp = (1/m) * temp;
	ret = [ret
		   temp];
	
end

%size(ret);
J = sum(ret);


% Gradient

retT = (1/m) * ( X'*(sigmoid(X*theta) - y)  );

grad = retT;

% =============================================================

end
