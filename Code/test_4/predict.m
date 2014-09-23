function p=predict(theta,X)

m=size(X,1);
p=zeros(m,1);
p=sigmoid(X*theta);
p=(p>=0.50);

end