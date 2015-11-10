function [ V ] = pca(X, k)
%	Performs a PCA on X and stores k principal components.
%	X is columnized image matrix from dataset

% 	r -> width*breadth of each image
% 	c -> noOfTrainingFolder*noOfTrainingImages
[r c]=size(X);

% Mean Column Vector Calculation
mu = mean(X,2);
X = X - kron(mu, ones([1 c]));

% Generate X'*X and find its eigenvectors
[W,D] = eig(X'*X);

% Get eigenvectors and eigenvalues of Covariance Matrix and normalize them
V = X*W;
norms = sqrt(sum(V.^2));
V = V ./ kron(norms, ones([r 1]));

% Sort eigenValues and vectors 
[D, i] = sort(diag(D), 'descend');
V = V(:,i);

% keep k components
V = V(:,1:k);
