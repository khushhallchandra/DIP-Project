function C = eigenfaces_predict(model, Xtest, k)
	%%	Predicts nearest neighbor for given Eigenfaces model.
	Q = model.W' * (Xtest - model.mu);
	C = knn(model.P, model.y, Q, k);
end
