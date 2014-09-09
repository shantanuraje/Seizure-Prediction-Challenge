load('Dog_1_interictal_segment_0001.mat');

data = interictal_segment_1.data;
data_lenght_sec = interictal_segment_1.data_length_sec;
channels = interictal_segment_1.channels;
sampling_frequency = interictal_segment_1.sampling_frequency;
sequence = interictal_segment_1.sequence;

x=1:length(data);
i=[0:15]'*4000;

fdata = fft(data,[],2);
alpha1(1:16,1:239766)=0;
alpha1(:,8:13) = fdata(:,8:13);
beta1(1:16,1:239766)=0;
beta1(:,13:30)=fdata(:,13:30);
gamma1(1:16,1:239766)=0;
gamma1(:,30:47)=fdata(:,30:47);
gamma1(:,53:75)=fdata(:,53:75);
gamma1(:,75:97)=fdata(:,75:97);
gamma1(:,103:128)=fdata(:,103:128);
delta1(1:16,1:239766)=0;
delta1(:,1:4)=fdata(:,1:4);
theta1(1:16,1:239766)=0;
theta1(:,4:8)=fdata(:,4:8);

talpha1=ifft(alpha1,[],2);
tbeta1=ifft(beta1,[],2);
tgamma1=ifft(gamma1,[],2);
tdelta1=ifft(delta1,[],2);
ttheta1=ifft(theta1,[],2);

datao=data+i;
plot(x,alpha1(1,:));

keyboard();
