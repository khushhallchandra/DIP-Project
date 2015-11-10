function [ V ] = lda(X, c, k)

%	Performs a LDA on X and stores k principal components.
%	X is columnized image matrix from dataset
%	c   -> it corresponds to class ID. In our case it
%	       is same as IDs as mentioned in read_img.m

% 	row -> width*breadth of each image
% 	col -> noOfTrainingFolder*noOfTrainingImages

% 	Here we assume that each class has same number of data i.e.
%	Each folder has same noOfTrainingImages
[row col]=size(X);

muTotal = mean(X,2);

%	within-class scatter matrix
Sw = zeros(row, row);

%	between-class scatter matrix
Sb = zeros(row, row);

% Here we are iterating over each class of images
% i.e. processing all the images of a class in one iteration

for i=1:max(c)
    % xC is the matrix containing all the images of a particular folder 
    xC = X(:,find(y==i));
    muC = mean(xc,2);
    % center data
    xC = xC - kron(mu, ones([1 size(xC,2)]));
    % calculate within-class scatter
    Sw = Sw + xC*xC';
    % calculate between-class scatter
    Sb = Sb + size(xC,2)*(muC-muTotal)*(muC-muTotal)';
end

[W, D] = eig(Sb,Sw);
  
[D, i] = sort(diag(D), 'descend');
W = W(:,i);

% keep k components
W = W(:,1:k);

