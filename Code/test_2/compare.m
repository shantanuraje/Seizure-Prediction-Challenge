load('Dog_1_interictal_segment_0001.mat');
data = interictal_segment_1.data;
x = 1:size(interictal_segment_1.data,2);
i = 1:size(interictal_segment_1.channels,2);
% plot(x,data);
i = (i-1)'*500;
datao = data+i;
% plot(x,datao);
fdata = fft(data,[],2);
ffdata = fdata;
ffdata(:,250:end)=0;
dataf = ifft(ffdata,[],2);
datafo = dataf + i;
%figure
%plot(x,datafo);
%figure
%plot(x,datao);
load('Dog_1/Dog_1_preictal_segment_0001.mat');
datap = preictal_segment_1.data;
fdatap = fft(datap,[],2);
ffdatap = fdatap;
ffdatap(:,250:end)=0;
datapf = ifft(ffdatap,[],2);
datapfo = datapf + i;
%datapo = datap+i;
%plot(x,datapo);
%figure
%plot(x,datapfo);
%plot(x,datapfo(1,:));
%figure
%plot(x,datafo(1,:));
%figure
h_1=figure;
plot(x,abs(fdata(1,:)));
%keyboard();
h_2=figure;
plot(x,abs(fdatap(1,:)));
%keyboard();
h_3=figure;
plot(x,abs(fdata(2,:)));
%keyboard();
h_4=figure;
plot(x,abs(fdatap(2,:)));
%keyboard();
x1=1:200;
h_5=figure;
plot(x1,abs(ffdata(2,1:200)));
%keyboard();
h_6=figure;
plot(x1,abs(ffdatap(2,1:200)));
keyboard();
print(h_1,'-dpng','-color','fdata_1.png');
print(h_2,'-dpng','-color','fdatap_1.png');
print(h_3,'-dpng','-color','fdata_2.png');
print(h_4,'-dpng','-color','fdatap_2.png');
print(h_5,'-dpng','-color','ffdata_2.png');
print(h_6,'-dpng','-color','ffdatap_2.png');