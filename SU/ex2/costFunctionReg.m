function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
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


ret = [];
temp = 0;


for row = 1:m
	h0 = sigmoid(X(row, :) * theta);
	temp = ( (-y(row) * log(h0) ) - ( (1-y(row)) * log((1-h0)) ) );
	temp = ( (1/m) * temp);
	ret = [ret
		   temp];
	
end
tt = theta(2:end,:);
regul = (lambda/(2*m)) * sum(tt.^2);


% Gred
tempTheta = zeros(rows(theta),1);

for r = 1:rows(theta)
	if (r == 1)
		tempTheta(r,1) = 0;
	else
		tempTheta(r,1) = (lambda/m)*theta(r,1);
	endif
end
tempTheta;
tempT1 = [];

tempT1 =  (1/m) * ( X'*(sigmoid(X*theta) - y)  )   ;
retT = tempT1 + tempTheta;

% Returns =======================================
J = sum(ret) + regul;
grad = retT;
% =============================================================

end
