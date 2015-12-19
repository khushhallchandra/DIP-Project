function acc=fischer_acc(k)

[X, IDs]= read_img();

n = size(X,2);
correct=0;
% split data
% into training set
for test1=1:165
    Xtrain = X(:, [1:(test1-1), (test1+1):n]); 
    ytrain = IDs([1:(test1-1), (test1+1):n]);
% into test set
%example testing test1, leave one out classification
    Xtest = X(:,test1);
    ytest = IDs(test1);
% compute a model
  %change value of k to get graph.
%change k to get results
    model1 = fisherfaces(Xtrain,ytrain,k);
% get a prediction from the model
    predicted = fisherfaces_predict(model1, Xtest, 1);
    if predicted==ytest
    	correct=correct+1;
    end
end
acc=correct*100/165;
