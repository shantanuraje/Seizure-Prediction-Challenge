function classifier
clear ; close all; clc
data=load("ip_features.mat");
test_data=load("test_features.mat");

x1=test_data.app_temp;
test_x=[ones(size(x1,1),1) x1];
y1=zeros(size(x1,1),1);


X=data.app_temp;

y=zeros(5040,1);
y(4081:end)=1;
%% ==================== Part 1: Plotting ====================
%  We start the exercise by first plotting the data to understand the 
%  the problem we are working with.

% fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
%          'indicating (y = 0) examples.\n']);
% % Find indices of positive and negative examples
% pos = find(y==1); neg = find(y==0);

% %Plot examples
% plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);
% plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',7);
% hold on;
% xlabel()

[m n]=size(X);
X=[ones(m,1) X];
initial_theta=zeros(n+1,1);

[cost, grad]=costFunction(initial_theta,X,y);



% Optimizing using fminunc
options = optimset('GradObj', 'on', 'MaxIter', 1000);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta,cost]=fminunc(@(t)(costFunction(t,X,y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
% fprintf('theta: \n');
% fprintf(' %f \n', theta);

p = predict(theta, X);
total=[];
files=dir('/home/shantanu/workspace/Seizure\ Prediction\ challenge/Datasets/Dog_1/testset/*.mat');

for x=1:10:length(p)-10
	s=sum(p(x):p(x+10))/10;
	total=[total;s];
end	
x_temp=[];



fprintf('Train Accuracy: %f\n', mean(double(p)==y) * 100);


keyboard();