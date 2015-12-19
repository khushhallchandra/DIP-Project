function model = lda(X, y, k)
  %%  Performs a Linear Discriminant Analysis and returns the 
  %%  num_components components sorted descending by their 
  %%  eigenvalue. 
  
  dim = size(X,1);
  c = max(y); 
  k = min(c-1,k);
  
  meanTotal = mean(X,2);
  
  Sw = zeros(dim, dim);
  Sb = zeros(dim, dim);
  for i=1:c
    Xi = X(:,find(y==i));
    meanClass = mean(Xi,2);
    % center data
    Xi = Xi - repmat(meanClass, 1, size(Xi,2));
    % calculate within-class scatter
    Sw = Sw + Xi*Xi';
    % calculate between-class scatter
    Sb = Sb + size(Xi,2)*(meanClass-meanTotal)*(meanClass-meanTotal)';
  end

  % solve the eigenvalue problem
  [V, D] = eig(Sb,Sw);
  
  % sort eigenvectors descending by eigenvalue
  [D,idx] = sort(diag(D), 1, 'descend');
  
  V = V(:,idx);
  % build model
  model.name = 'lda';
  model.k = k;
  model.D = D(1:k);
  model.W = V(:,1:k);
end
