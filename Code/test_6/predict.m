function p=predict(theta,training_data)

m=size(training_data,1);
p=zeros(m,1);
p=sigmoid(training_data*theta);
p=(p>=0.60);

end