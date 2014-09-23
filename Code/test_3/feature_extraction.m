function temp=feature_extraction(data,one_min_blocks,sampling_frequency)
pkg load signal

% filtering data
% filters to be created
% delta = 0.5-4 Hz 
% theta = 4-8 Hz
% alpha = 8-13 Hz
% beta = 13-30 Hz
% gamma1 = 30-47 Hz
% gamma2 = 53-75 Hz
% gamma3 = 75-97 Hz
% gamma4 = 103-128 Hz

nyquist_freq=sampling_frequency/2;
frequency=(0:length(data)-1)*sampling_frequency/length(data);
filter_bands=[0.1 0.4;0.5 4;5 8;9 13;14 30;31 47;53 75;76 97;103 128;129 180;180 nyquist_freq];
norm_filter_bands=filter_bands./nyquist_freq;

temp=[];
for i=2:length(norm_filter_bands)-1
	norm_filter_bands(i,1);
	norm_filter_bands(i,2);
	[n wc]=buttord([norm_filter_bands(i,1) norm_filter_bands(i,2)],[norm_filter_bands(i-1,1) norm_filter_bands(i+1,2)],3,30);
	[b a]=butter(n,wc,"pass");	
	H = freqz(b,a, floor(length(data)/2));
	norm_frequency=0:1/(length(data)/2-1):1;
	[filter_bands(i,1) filter_bands(i,2)];
	filt_data=filter(b,a,data,[],2);
	
	x=[];
	for i=1:length(one_min_blocks)/2
		pow=[];
		fft_filt_data=fft(filt_data(:,one_min_blocks(i):one_min_blocks(i+1)),[],2);
		pow_fft=fft_filt_data.*conj(fft_filt_data)/length(fft_filt_data);
		sum_pow_fft=sum(pow_fft,2);

		for i=1:length(sum_pow_fft)
			pow=[pow,sum_pow_fft(i,:)];
		end
	x=[x;pow];
	end	
	temp=[temp,x];
	
	
end	

