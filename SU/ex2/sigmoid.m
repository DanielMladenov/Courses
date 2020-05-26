function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

temp = e;

[row, column] = size(z);

for r = 1:row
	for c = 1:column
		tempval = z(r,c);
		z(r,c) = 1/(1 + (temp^-tempval));
	end
end 

g = z;


%g = 1/(1 + temp^z)



% =============================================================

end
