load('Dog_1_interictal_segment_0001.mat');
load('Dog_1_preictal_segment_0001.mat');

idata = interictal_segment_1.data;
idata_lenght_sec = interictal_segment_1.data_length_sec;
ichannels = interictal_segment_1.channels;
isampling_frequency = interictal_segment_1.sampling_frequency;
isequence = interictal_segment_1.sequence;

pdata = preictal_segment_1.data;
pdata_lenght_sec = preictal_segment_1.data_length_sec;
pchannels = preictal_segment_1.channels;
psampling_frequency = preictal_segment_1.sampling_frequency;
psequence = preictal_segment_1.sequence;


x=1:length(idata);
i=[0:15]'*500;
idata=idata+i;
pdata=pdata+i;
figure;
plot(x,idata);
figure;
plot(x,pdata);
figure;
x1=1:size(x,2)*2;
data = [idata,pdata];
plot(x1,data);
fdata = fft(data,[],2);
fdata(:,250:end)=0;
dataf = ifft(fdata,[],2);
plot(x1,dataf);
keyboard();
