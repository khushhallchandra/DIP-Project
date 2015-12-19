function model = eigenfaces(X, IDs, k)
  %%  Performs a PCA on X and stores num_components principal components.
  %%
  %%
  %%  Example:
  %%    m_eigenface = eigenfaces(X, y, 100)
  % perform pca
  Pca = pca(X, k);
  % build model
  model.name = 'eigenfaces';
  model.D = Pca.D;
  model.W = Pca.W;
  model.k = k;
  model.mu = Pca.mu;
  % project data
  model.P = model.W'*(X - repmat(Pca.mu, 1, size(X,2)));
  % store classes
  model.y = IDs;
end
