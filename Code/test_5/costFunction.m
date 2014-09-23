function [J,grad]=costFunctionReg(theta,training_data,training_prediction,lambda)

% cost function at initial theta;
m=length(training_data);

hypothesis = sigmoid(training_data*theta);
cost = [training_prediction'*log(hypothesis)] + [(1-training_prediction)'*log(1-hypothesis)];
temp = theta(2:size(theta),1);
temp = realpow(temp,2);
regTerm = (lambda/(2*m))*sum(temp);

J = (-1/m)*sum(cost) + regTerm ;
for j=1:size((theta))
      if (j==1) 
	grad(j)=(1/m)*(sum((hypothesis-training_prediction).*X(:,j)));
      else
	grad(j)=[(1/m)*(sum((hypothesis-training_prediction).*X(:,j)))]+[(lambda/m)*theta(j)];
      endif
end

plot(theta,J);
end
