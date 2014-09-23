clear ; close all; clc
folder_names='/home/shantanu/workspace/Seizure Prediction challenge/Datasets/Dog_1/';
test_files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Dog_1/*_test_*.mat');

folder='/home/shantanu/workspace/Seizure Prediction challenge/Code/Features by 144/';
files=dir('/home/shantanu/workspace/Seizure Prediction challenge/Code/Features by 144/*.mat');

training_data=load(strcat(folder,"Dog_1_training_features_1.mat"));
test_data=load(strcat(folder,"Dog_1_test_features_1.mat"));

clear files;


training_prediction=[zeros(length(training_data.interictal_features),1);ones(length(training_data.preictal_features),1)];
test_prediction=zeros(length(test_data.test_features),1);	

training_data=[training_data.interictal_features;training_data.preictal_features];
test_data=test_data.test_features;

mu_train = mean(training_data);
mu_test = mean(test_data);
training_data_norm = bsxfun(@minus, training_data, mu_train);
test_data_norm = bsxfun(@minus, test_data, mu_test);

sigma_train = std(training_data_norm);
sigma_test = std(test_data_norm);
training_data_norm = bsxfun(@rdivide, training_data_norm, sigma_train);
test_data_norm = bsxfun(@rdivide, test_data_norm, sigma_test);

training_data=[ones(length(training_prediction),1) training_data_norm];
test_data=[ones(length(test_prediction),1) test_data_norm];

[m n]=size(training_data);
initial_theta=zeros(n,1);

for i=1:length(training_data)
	if training_prediction(i)==0
		plot(1:size(training_data,2),training_data(i,:),'bo')
	else
		plot(1:size(training_data,2),training_data(i,:),'rx')
	endif	
	hold on;
end	

keyboard();
lambda=0;

[J, grad]=costFunctionReg(initial_theta,training_data,training_prediction,lambda);

options = optimset('GradObj', 'on', 'MaxIter', 10000);
[theta,J, exit_flag]=fminunc(@(t)(costFunctionReg(t,training_data,training_prediction,lambda)), initial_theta, options);

