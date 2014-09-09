load('Dog_1_interictal_segment_0001.mat');

data=interictal_segment_1.data;
data_lenght_sec=interictal_segment_1.data_length_sec;
channels=interictal_segment_1.channels;
sampling_frequency=interictal_segment_1.sampling_frequency;
sequence=interictal_segment_1.sequence;

onem=round(sampling_frequency*60);
total=length(data)/sampling_frequency;
numofb=round(total/60);

#onem=onem*[1:numofb-1];
#onem=[1,onem,length(data)+1];
#onem=[1:onem-1:length(data)];
j=mod(length(data),10)
for i=1:numofb
	#blocks(1,i)=data(:,onem(i):onem(i+1)-1);
	#[onem(i) onem(i+1)-1]
	#[onem(i+1)-onem(i)]
	i*23976+j
	#[(i+1)*23976+j]-[(i)*23976+j]
	if j>0
		j--;
	endif
end
keyboard();
