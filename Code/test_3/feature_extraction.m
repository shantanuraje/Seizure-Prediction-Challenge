function feature_extraction(data,one_min_blocks)
tic();
for i=1:2:size(one_min_blocks,1)
	temp_data=data(:,one_min_blocks(i):one_min_blocks(i+1));
	fft_temp_data=fft(temp_data,[],2);
	fft_temp_data_magnitude=abs(fft_temp_data);
	
	figure(1);
	plot(temp_data(1,:));
	title('Time domain signal');
	xlabel('Samples');
	ylabel('Amplitude');
	hold on;
	

	
	figure(2);
	plot(1:length(fft_temp_data),fft_temp_data_magnitude(1,:));
	title('Magnitude Spectrum');
	xlabel('DFT Bins');
	ylabel('Magnitude');
	hold on;
	

	
	half_num_bins=length(fft_temp_data_magnitude)*0.5;
	figure(3);
	plot(0:1/(half_num_bins-1):1,fft_temp_data_magnitude(1,1:half_num_bins));
	title('First half of DFT : Normalised Frequency');
	xlabel('Normalised Frequency pi rads/sample');
	ylabel('Magnitude');
	hold on;
	
	
	
	n=length(fft_temp_data_magnitude);
	f=(0:n/2-1)/(2*(n/2-1))*400;
	figure(4);
	plot(f,fft_temp_data_magnitude(1,1:n/2));
	title('First half of DFT : Frequency');
	xlabel('Frequency (Hz)');
	ylabel('Magnitude');
	hold on;
		
end
toc()
keyboard();