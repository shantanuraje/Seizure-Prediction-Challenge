function [m,frequency,norm_frequency,fft_data,fft_data_magnitude,fft_data_power]= preprocess_data(data,sampling_frequency)

tic();	
m=length(data);	
%n=pow2(nextpow2(m));
fft_data=fft(data,[],2);
fft_data_magnitude=abs(fft_data);
fft_data_power=fft_data_magnitude.*conj(fft_data_magnitude)/m;
frequency=(0:m-1)*sampling_frequency/m;
norm_frequency=0:1/(m/2-1):1;

toc()