function acc=fischer_acc1()
kvals = [2 4 6 8 10 12 14];
[X, IDs]= read_img();
t=zeros(size(kvals));
%reco_rate=zeros(size(kvals));
q=0;
for k = kvals
    q=q+1;
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
t(q)=100-(correct*100/165);
end
acc=0;
figure('Name','MK','NumberTitle','off');
plot(kvals,t);
xlabel('K');
ylabel('RecognitionRate');
end

