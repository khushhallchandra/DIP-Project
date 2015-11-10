function [ X, IDs ] = read_img()

% Getting subfolders inside the  
dirPath = uigetdir(); 
folders = dir([dirPath ]);
folders = folders(3:length(folders));
noFolder = length(folders);
folders = struct2cell(folders);
folders = folders(1,:);

X = [];

for i=1:length(folders)
	iPerson = folders{i};
	images = dir([dirPath, '/', iPerson]);
	images = images(3:length(images));
	noImages = length(images);
	
	% ... for each image
	for j=1:noImages		
		imgPath  = [dirPath,  '/', iPerson ,  '/', images(j).name];
		img = imread(imgPath);
		X(:,noImages*(i-1)+j) = img(:);	
	end
end

%assuming that we read equal no of images from each folder
people = 1:noFolder;
IDs = kron(people, ones([1 noImages]));
