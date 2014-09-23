function p=predict(theta,training_data)

m=size(training_data,1);
p=zeros(m,1);
p=1./(1+e.^(-training_data*theta));
p=(p>=0.50);

end