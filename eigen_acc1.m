function acc1=eigen_acc1()
%k=100;
kvals = [30 40 50 60 70 80 90 100];
[X, IDs]= read_img();

n = size(X,2);

t=zeros(size(kvals));
%reco_rate=zeros(size(kvals));
q=0;
for k = kvals
    q=q+1;
    
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
    model1 = eigenfaces(Xtrain,ytrain,k);
% get a prediction from the model
    predicted = eigenfaces_predict(model1, Xtest, 1);
    if predicted==ytest 
    	correct=correct+1;
    end
end
t(q)=100-(correct*100/165);

end
acc1=0;
%reco_rate(q)=t(q);
figure('Name','MK','NumberTitle','off');
plot(kvals,t);
xlabel('K');
ylabel('RecognitionRate');
end
