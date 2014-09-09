function feature_extraction(data,one_min_blocks)

for i=1:2:size(one_min_blocks,1)
	temp_data=data(:,one_min_blocks(i):one_min_blocks(i+1));
	fft_temp_data=fft(temp_data,[],2);
	fft_temp_data_magnitude=abs(fft_temp_data);
	tic();
	figure(1);
	plot(temp_data(1,:));
	title('Time domain signal');
	xlabel('Samples');
	ylabel('Amplitude');
	toc()

	tic();
	figure(2);
	plot(1:length(fft_temp_data),fft_temp_data_magnitude(1,:));
	title('Magnitude Spectrum');
	xlabel('DFT Bins');
	ylabel('Magnitude');
	toc()

	tic();
	half_num_bins=length(fft_temp_data_magnitude)*0.5;
	figure(3);
	plot(0:1/(half_num_bins-1):1,fft_temp_data_magnitude(1,1:half_num_bins));
	title('First half of DFT : Normalised Frequency');
	xlabel('Normalised Frequency pi rads/sample');
	ylabel('Magnitude');
	toc()	
	
	tic();
	n=pow2(nextpow2(length(fft_temp_data_magnitude)));
	frequency=(0:n-1)*399.61/n*3.14;
	
	keyboard();
	figure(4);
	plot(frequency,fft_temp_data_magnitude(1,1:half_num_bins));
	title('First half of DFT : Frequency');
	xlabel('Frequency (Hz)');
	ylabel('Magnitude');
	toc()	
	
	keyboard();
end