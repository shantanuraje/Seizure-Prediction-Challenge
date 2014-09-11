%------------------------------------------------------------------
%  Plot Data
%  ------------
%  Plot of full clip i.e 10 minutes, of individual channels 
%
%     1) Amplitude vs Samples (Time domain)
%     2) Magnitude vs DFT Bins (Frequency domain)
%     3) Power vs DFT Bins (Frequency domain)
%	  4) Magnitude vs Frequency (Frequency domain)
%     5) Power vs Frequency (Frequency domain)
%	  6) Magnitude vs Normalized Frequency (Frequency domain)
%     7) Power vs Normalized Frequency (Frequency domain)
%     
%  Only First halves in frequency domain   
%     
%------------------------------------------------------------------


function plot_data(data,sampling_frequency,m,frequency,norm_frequency,fft_data,fft_data_magnitude,fft_data_power)
tic();
for i=1:size(data,1)
	
	figure;
	plot(1:length(data),data(i,:));
	title('Time domain signal');
	xlabel('Samples');
	ylabel('Amplitude');
	hold on;

	figure;
	subplot(2,1,1);
	plot(1:length(frequency)/2,fft_data_magnitude(i,1:length(frequency)/2));
	title('Magnitude Spectrum');
	xlabel('DFT Bins');
	ylabel('Magnitude');
	hold on;
	
	subplot(2,1,2);
	plot(1:length(frequency)/2,fft_data_power(i,1:length(frequency)/2));
	title('Power Spectrum');
	xlabel('DFT Bins');
	ylabel('Power');
	hold on;

	figure;
	subplot(2,1,1);
	plot(frequency(1:m/2),fft_data_magnitude(i,1:m/2));
	title('Magnitude Spectrum');
	xlabel('Frequency in Hz');
	ylabel('Magnitude');
	hold on;

	subplot(2,1,2);
	plot(frequency(1:m/2),fft_data_power(i,1:m/2));
	title('Power Spectrum');
	xlabel('Frequency in Hz');
	ylabel('Power');
	hold on;

	figure;
	subplot(2,1,1);
	plot(norm_frequency(1:m/2),fft_data_magnitude(i,1:m/2));
	title('Magnitude Spectrum');
	xlabel('Normalized Frequency ');
	ylabel('Magnitude');
	hold on;

	subplot(2,1,2);
	plot(norm_frequency(1:m/2),fft_data_power(i,1:m/2));
	title('Power Spectrum');
	xlabel('Normalized Frequency');
	ylabel('Power');
	hold on;

	keyboard();
	
end
toc()