function [J,grad]=costFunction(theta,X,y)

% cost function at initial theta;
m=length(y);
temp=zeros(1,m);
J=0;
grad=zeros(size(theta));

hypothesis=sigmoid(X*theta);
cost=[y'*log(hypothesis)] + [(1-y)'*log(1-hypothesis)];
J=(-1/m)*sum(cost);

temp=(hypothesis-y)'*X;
grad=(1/m)*temp;

end
