clear ; close all; clc
tic();
load("Dog_1_training_features.mat");
load("Dog_1_test_features.mat");

no_channels=16;
temp_interictal_features=[];
for i=1:size(interictal_features,2)
	% temp=interictal_features(:,i);
	new_temp=[];
	for j=1:no_channels:length(interictal_features)
		new_temp=[new_temp;interictal_features(j:j+(no_channels-1),1)'];
		%[j,j+(no_channels-1)]
	end
	temp_interictal_features=[temp_interictal_features,new_temp];		
end	

interictal_features=temp_interictal_features;

temp_preictal_features=[];
for i=1:size(preictal_features,2)
	% temp=preictal_features(:,i);
	new_temp=[];
	for j=1:no_channels:length(preictal_features)
		new_temp=[new_temp;preictal_features(j:j+(no_channels-1),1)'];
		% [j,j+(no_channels-1)]
		
	end
	temp_preictal_features=[temp_preictal_features,new_temp];		
end	
preictal_features=temp_preictal_features;

save("Dog_1_training_features_1.mat","interictal_features","preictal_features");

temp_test_features=[];
for i=1:size(test_features,2)
	% temp=test_features(:,i);
	new_temp=[];
	for j=1:no_channels:length(test_features)
		new_temp=[new_temp;test_features(j:j+(no_channels-1),1)'];
		% [j,j+(no_channels-1)]
		
	end
	temp_test_features=[temp_test_features,new_temp];		
end	
test_features=temp_test_features;

save("Dog_1_test_features_1.mat","test_features");
toc()	
keyboard();



