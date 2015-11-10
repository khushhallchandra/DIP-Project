function [W] = fisherfaces(X, IDs, k)

[row col] = size(X);

c = max(IDs);

Vpca = pca(X, (col-c));

X = X - kron(mu, ones([1 col]));
Y = W'*X;

Vlda = lda(Y, IDs, k);
W = Wpca * Wlda ;
end
