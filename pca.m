function model = pca(X, k)
  %%  Performs a PCA on X and stores num_components principal components.
  %%
  %%
  % center data
  mu = mean(X,2);
  X = X - repmat(mu, 1, size(X,2));
  % svd on centered data == pca
  [E,D,V] = svd(X ,'econ');
  % build model
  model.name = 'pca';
  model.D = diag(D).^2;
  model.D = model.D(1:k);
  model.W = E(:,1:k);
  model.k = k;
  model.mu = mu;
end
