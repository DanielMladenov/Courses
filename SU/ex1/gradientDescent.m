function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

%X_norm = featureNormalize((X(:,2)));

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

	h = X*theta;
	error = h - y;
	temp = (error'*X);
	%tempSum = sum(X);
	%finalCal = tempSum'/m;
	delta = (1/(2*m))*temp';
    delta = (1/m)* (( (X*theta) - y)' * X)';
	theta_change = alpha*delta;
	%theta_change = alpha*(1/m)*X'*(X*theta-y)
	%===========
	
	
	
	theta = theta - theta_change;
	%disp(J_history);




    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
	
end

gradientDescent = theta;

end
