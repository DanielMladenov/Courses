function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%

tempX = [ones(m,1) X];
ones_y = ones(size(y));
tempJ = 0;
temp = 0;

a2 = [];
z3 = [];

%temp =  (-tempY.*log(sigmoid(a2 * Theta2' )) - ( (ones_y - tempY) .* log(1- sigmoid(a2 * Theta2' ) ) )  ); 
ones_theta = ones(m, 1);
a1 = tempX;
a2 = sigmoid(tempX * Theta1');
a2 = [ones_theta a2];
z2 = [tempX * Theta1'];
z3 = (a2 * Theta2');


%Grad
delta3 = [];
delta2 = [];
prime1 = [];
prime2 = [];


for i = 1:m
	temp = 0 ;
	for k = 1:num_labels
		tempY = (y == k);
		h0 = sigmoid(z3(i,k));
		temp = temp +  (  (-tempY(i)*log(h0)) - ( (1 - tempY(i)) * log(1- h0) ) )    ; 
		
		
		
	end
	tempJ = tempJ + ((1/m) * temp);
	
	%=====
	%	delta2 = ( (Theta2)' * delta3) .* sigmoidGradient(z2);

end

reg1 = Theta1(:,2:end).^2;
reg2 = Theta2(:,2:end).^2;

returnReg = (sum(sum(reg1)) + sum(sum(reg2))); 

J =   tempJ + ( (lambda/(2*m)) * returnReg) ;


%========

for i = 1:m;

	a1 = tempX(i,:)';
	z2 = Theta1 * a1 ;
	a2 = sigmoid(z2);
	a2 = [1; a2];
	
	z3 = Theta2 * a2;
	a3 = sigmoid(z3);
	
	tempY = zeros(num_labels,1);
	for k = 1:num_labels
		tempY(k,1) = (y(i,1) == k);
	end
	% tempY = 10x1
	
	delta3 = (a3 - tempY);
	delta2 = (Theta2' * delta3) .* sigmoidGradient([1; z2]);
	delta2 = delta2(2:end);
	
	dt2 = delta3 * a2';
	dt1 = delta2 * a1';
	
	Theta1_grad = Theta1_grad + dt1;
	Theta2_grad = Theta2_grad + dt2;
	
end

Theta1_grad = (1/m) * Theta1_grad;
Theta2_grad = (1/m) * Theta2_grad;

Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + ( (lambda/m) * Theta1(:, 2:end));
Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + ( (lambda/m) * Theta2(:, 2:end));

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%





	



% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================


% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
