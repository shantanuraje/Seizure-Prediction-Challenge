clear ; close all; clc
%% ==================== Part 1: Load data & extract features =====================================
tic();
fprintf('Loading Data ... \n');

folder='/home/shantanu/workspace/Seizure Prediction challenge/Datasets/Patient_2/';
interictal_files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Patient_2/*_interictal_*.mat');
preictal_files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Patient_2/*_preictal_*.mat');
test_files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Patient_2/*_test_*.mat');
tic();
interictal_features=[];
fprintf('Loading Interictal Data ... \n');
for i=1:length(interictal_files)
	file_name=interictal_files(i).name
	load(strcat(folder,file_name)) 
	struct_name=whos('-file',strcat(folder,file_name));

	data=eval(sprintf('%s.data',struct_name.name));
	data_length_sec=eval(sprintf('%s.data_length_sec',struct_name.name));
	channels=eval(sprintf('%s.channels',struct_name.name));
	sampling_frequency=eval(sprintf('%s.sampling_frequency',struct_name.name));
	%sequence=eval(sprintf('%s.sequence',struct_name.name));
	clear(struct_name.name);

	one_min_samples=round(sampling_frequency*60);
	num_of_blocks=round(data_length_sec/60);
	one_min_samples=[1,one_min_samples*[1:num_of_blocks-1],length(data)];
	one_min_blocks=[];

	for i=1:num_of_blocks
	  one_min_blocks=[one_min_blocks;one_min_samples(i) one_min_samples(i+1)-1];
	end

	temp=feature_extraction(data,one_min_blocks,sampling_frequency);
	interictal_features=[interictal_features;temp];

end	
toc()	

tic();
preictal_features=[];
fprintf('Loading Preictal Data ... \n');
for i=1:length(preictal_files)
	file_name=preictal_files(i).name
	load(strcat(folder,file_name)) 
	struct_name=whos('-file',strcat(folder,file_name));

	data=eval(sprintf('%s.data',struct_name.name));
	data_length_sec=eval(sprintf('%s.data_length_sec',struct_name.name));
	channels=eval(sprintf('%s.channels',struct_name.name));
	sampling_frequency=eval(sprintf('%s.sampling_frequency',struct_name.name));
	%sequence=eval(sprintf('%s.sequence',struct_name.name));
	clear(struct_name.name);

	one_min_samples=round(sampling_frequency*60);
	num_of_blocks=round(data_length_sec/60);
	one_min_samples=[1,one_min_samples*[1:num_of_blocks-1],length(data)];
	one_min_blocks=[];

	for i=1:num_of_blocks
	  one_min_blocks=[one_min_blocks;one_min_samples(i) one_min_samples(i+1)-1];
	end

	temp=feature_extraction(data,one_min_blocks,sampling_frequency);
	preictal_features=[preictal_features;temp];

end	

save("-append","Patient_2_training_features.mat","interictal_features","preictal_features");
toc()

tic();
test_features=[];
fprintf('Loading Test Data ... \n');
for i=1:length(test_files)
	file_name=test_files(i).name
	load(strcat(folder,file_name)) 
	struct_name=whos('-file',strcat(folder,file_name));

	data=eval(sprintf('%s.data',struct_name.name));
	data_length_sec=eval(sprintf('%s.data_length_sec',struct_name.name));
	channels=eval(sprintf('%s.channels',struct_name.name));
	sampling_frequency=eval(sprintf('%s.sampling_frequency',struct_name.name));
	%sequence=eval(sprintf('%s.sequence',struct_name.name));
	clear(struct_name.name);

	one_min_samples=round(sampling_frequency*60);
	num_of_blocks=round(data_length_sec/60);
	one_min_samples=[1,one_min_samples*[1:num_of_blocks-1],length(data)];
	one_min_blocks=[];

	for i=1:num_of_blocks
	  one_min_blocks=[one_min_blocks;one_min_samples(i) one_min_samples(i+1)-1];
	end

	temp=feature_extraction(data,one_min_blocks,sampling_frequency);
	test_features=[test_features;temp];

end	
toc()
save("-append","Patient_2_test_features.mat","test_features");
toc()
% ================================================================================