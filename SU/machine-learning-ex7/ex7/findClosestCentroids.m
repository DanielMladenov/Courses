function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
% X -> M x 2
%centroids -> 3x3
% otg -> M x 1 
t = [];
for inter = 1:rows(X)
	tempMin = 100;
	for c = 1:rows(centroids)
		min = sum((X(inter,:) - centroids(c,:)).^2);
		
		if min < tempMin
			retRow = c;
			tempMin = min;
			
		endif
		
	end
	t = [t; retRow];
end

idx = t;


% =============================================================

end

