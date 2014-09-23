clear ; close all; clc
folder_names='/home/shantanu/workspace/Seizure Prediction challenge/Datasets/Dog_1/';
test_files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Dog_1/*_test_*.mat');

folder='/home/shantanu/workspace/Seizure Prediction challenge/Code/test_5/Features by 144/';
files=dir('/home/shantanu/workspace/Seizure Prediction challenge/Code/test_5/Features by 144/*.mat');

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


lambda=0;
% x=[];
% tic();
% 	for i=1:length(lambda)	
	[cost, grad]=costFunctionReg(initial_theta,training_data,training_prediction,lambda);
	options = optimset('GradObj', 'on', 'MaxIter', 10000);
	[theta,cost, exit_flag]=fminunc(@(t)(costFunctionReg(t,training_data,training_prediction,lambda)), initial_theta, options);
%  	x=[x;cost];
% end	
% plot(lambda,x)
% hold on;
% toc()
	

p = predict(theta, test_data);
p_files=[];

temp=[];
for i=1:10:length(p)
	% if(p(i)==1)
	% 	count++;
	% endif
	count=0;
	for x=i:i+9
		if (p(x)==1)
			count++;
		endif	
	end
	if(count>1)
		temp=[temp;1];
	else
		temp=[temp;0];
	endif		
end

cellarr={};

for i=1:length(temp)
	% csvwrite("submitt.csv",test_files(i).name,temp(i))
		cellarr={cellarr;test_files(i).name,temp(i)};

	% save("-append","submitt.csv","x","y","-ascii");
	% dlmwrite('filename.dat', [variables], 'delimiter', '\t');
	
	
end
keyboard();
dlmwrite('filename.csv', [N M],"-append","delimiter","\t");
% fprintf('Train Accuracy: %f\n', mean(double(temp)==[zeros(480,1);ones(24,1)]) * 100);
% fprintf('Train Accuracy: %f\n', mean(double(p)==training_prediction) * 100);

