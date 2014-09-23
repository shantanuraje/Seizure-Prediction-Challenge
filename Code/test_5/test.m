folder='/home/shantanu/workspace/Seizure Prediction challenge/Code/test_5/Features by 144/';
files=dir('/home/shantanu/workspace/Seizure Prediction challenge/Code/test_5/Features by 144/*.mat');
for i=1:length(files)
	file_name=files(i).name
	load(strcat(folder,file_name))
	struct_name=whos('-file',strcat(folder,file_name));
	whos
	clear(struct_name.name);
end