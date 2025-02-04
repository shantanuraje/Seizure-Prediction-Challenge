clear ; close all; clc
%% ==================== Part 1: Load data ====================
tic()
fprintf('Loading Data ... \n');

folder='/home/shantanu/workspace/Seizure Prediction challenge/Datasets/Dog_1/';
files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Dog_1/*.mat');
num_files=length(files);
% count_interictal=0;
% count_preictal=0;
% count_test=0;
app_temp=[];
tic();
for i=1:num_files

	file_name=files(i).name;
	load(strcat(folder,file_name)) 
	struct_name=whos('-file',strcat(folder,file_name));
	
	% if (strfind(struct_name.name,'interictal')==1)
	data=eval(sprintf('%s.data',struct_name.name));
	data_length_sec=eval(sprintf('%s.data_length_sec',struct_name.name));
	channels=eval(sprintf('%s.channels',struct_name.name));
	sampling_frequency=eval(sprintf('%s.sampling_frequency',struct_name.name));
	%sequence=eval(sprintf('%s.sequence',struct_name.name));
	
	clear(struct_name.name);
	% count_interictal++;
	% elseif (strfind(struct_name.name,'preictal')==1)
	% 	count_preictal++;
	% else
	% 	count_test++;
	% end

% 	clear(struct_name.name);
% end	
% toc();
% keyboard();

% fprintf('Program paused. Press enter to continue.\n');
% toc()
% pause;

%% ===========================================================
%% ==================== Part 2: Preprocess data =================

% fprintf('Preprocess data ... \n');

% [m,frequency,norm_frequency,fft_data,fft_data_magnitude,fft_data_power]=preprocess_data(data,sampling_frequency);

% fprintf('Program paused. Press enter to continue.\n');
% pause;

% %% ===========================================================
% %% ==================== Part 3:Plot data =================

% fprintf('Plotting data samples of full clip x all channels ... \n');

% plot_data(data,sampling_frequency,m,frequency,norm_frequency,fft_data,fft_data_magnitude,fft_data_power);

% fprintf('Program paused. Press enter to continue.\n');
% pause;

%% ===========================================================

%% ==================== Part 4:Chopping data =================

	% fprintf('Chopping data into 1 minute blocks ... \n');

	one_min_samples=round(sampling_frequency*60);
	num_of_blocks=round(data_length_sec/60);
	one_min_samples=[1,one_min_samples*[1:num_of_blocks-1],length(data)];
	one_min_blocks=[];

	for i=1:num_of_blocks
	  one_min_blocks=[one_min_blocks;one_min_samples(i);one_min_samples(i+1)-1];
	end

	% fprintf('Program paused. Press enter to continue.\n');
	% pause;

	% %% ===========================================================
	% %% ==================== Part 3:Feature Extraction ============

	temp=feature_extraction(data,one_min_blocks,sampling_frequency);
	app_temp=[app_temp;temp];
	

	
end	
save("-append","ip_features.mat","app_temp");

toc();

fprintf('Program paused. Press enter to continue.\n');
toc()
pause;
