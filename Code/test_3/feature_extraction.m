function feature_extraction(data,one_min_blocks,sampling_frequency,m,frequency,fft_data,fft_data_magnitude,fft_data_power)
pkg load signal
for i=1:2:size(one_min_blocks,1)
	
fft_data_temp=fft_data(1,i:i-1);
	keyboard();	
end
toc()
