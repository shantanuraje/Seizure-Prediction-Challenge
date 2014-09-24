function [J,grad]=costFunctionReg(theta,training_data,training_prediction,lambda)

% cost function at initial theta;
m=length(training_data);
J = 0;
grad = zeros(size(theta));

hypothesis = sigmoid(training_data*theta);

cost = [training_prediction'*log(hypothesis)] + [(1-training_prediction)'*log(1-hypothesis)];
temp = theta(2:size(theta),1);
temp = realpow(temp,2);
regTerm = (lambda/(2*m))*sum(temp);
temp=[];
 J = (-1/m)*sum(cost) + regTerm 	
 % Jtrain = (-1/m)*sum(cost) 	


for j=1:size((theta))
      if (j==1) 
		grad(j)=(1/m)*(sum((hypothesis-training_prediction).*training_data(:,j)));
      else
		grad(j)=[(1/m)*(sum((hypothesis-training_prediction).*training_data(:,j)))]+[(lambda/m)*theta(j)];
      endif
end
plot(1:length(hypothesis),hypothesis,'r-','LineWidth',1);
hold on;

keyboard();
% temp=training_data*theta;
% x=temp(1:4800,:);
% y=hypothesis(1:4800,:);
% plot(x,y,'b+','LineWidth',1,'MarkerSize',7)
% temp=training_data*theta;
% x=temp(4801:end,:);
% y=hypothesis(4801:end,:);
% plot(x,y,'ro','LineWidth',1,'MarkerSize',7)
% hold on;

% plot(temp(4081:end),hypothesis(4081:end),'b+','LineWidth',2,'MarkerSize',7)
% keyboard();

% hold on;
% plot(training_data(:,2),hypothesis,'-')

end
