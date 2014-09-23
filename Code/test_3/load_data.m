folder='/home/shantanu/workspace/Seizure Prediction challenge/Datasets/Dog_1/';
files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Dog_1/*.mat');
num_files=length(files);

for i=1:num_files

	name=files(i).name
	load(strcat(folder,files(i).name));

	data=interictal_segment_1.data;
	data_length_sec=interictal_segment_1.data_length_sec;
	channels=interictal_segment_1.channels;
	sampling_frequency=interictal_segment_1.sampling_frequency;
	sequence=interictal_segment_1.sequence;
	
end	