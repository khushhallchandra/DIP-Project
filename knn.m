function c = knn(P, y, Q,  k)
    %%  k-nearest neighbor classification.
    
    %%
    n = size(P,2);    
    % clip k
    if (nargin == 3)
        k=1;
    elseif (k>n)
        k=n;
    end

    Q = repmat(Q, 1, n);
    distances = sqrt(sum(power((P-Q),2),1));
    [distances, idx] = sort(distances);
    y = y(idx);
    y = y(1:k);
    h = histc(y,(1:max(y)));
    [v,c] = max(h);
end
