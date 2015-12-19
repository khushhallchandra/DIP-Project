function model = fisherfaces(X, IDs, k)
  %%
  %%    m_fisherface = fisherface(X, y, 100)
  
  N = size(X,2);
  c = max(IDs);
  
  % set the num_components
  
  k = min(c-1, k);
  
  Pca = pca(X, (N-c));
  X1=X-repmat(Pca.mu,1,size(X,2));
  Y1=Pca.W'*X1;
  Lda = lda(Y1, IDs, k);
  
  % build model
  model.name = 'lda';
  model.mu = repmat(0, size(X,1), 1);
  model.D = Lda.D;
  model.W = Pca.W*Lda.W;
  model.P = model.W'*X;
  model.k = Lda.k;
  model.y = IDs;
end
