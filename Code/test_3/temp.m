
% figure(2);
% plot(frequency(1:m/2),fft_data_magnitude(1,1:m/2)/m,'r',frequency(1:m/2),abs(fft(x_filtered(1,1:m/2)))/m,'b',frequency(:,1:m/2), abs(H),'r')
% title('Filtered Signal - Using Second Order Butterworth')
% xlabel('Frequency');
% ylabel('Magnitude')
% hold on;

% subplot(2,1,2);
% plot(frequency(1:m/2),fft_data_magnitude(1,1:m/2));
% title('Magnitude Spectrum');
% xlabel('Frequency in Hz');
% ylabel('Magnitude');
% hold on;

% plot(frequency(1:length(data)/2), abs(H),'r','linewidth',2);
	% hold on;

	% fft_data_magnitude=abs(fft(data(1,:)));
	% figure;
	% plot(frequency(1:length(fft_data_magnitude)/2),fft_data_magnitude(:,1:length(fft_data_magnitude)/2));
	% hold on;
	% x_filt=filter(b,a,data(1,:));
	% x_filt_fft_magnitude=abs(fft(x_filt(1,:)));
	% plot(frequency(1:length(x_filt_fft_magnitude)/2),x_filt_fft_magnitude(:,1:length(x_filt_fft_magnitude)/2),'r');
	