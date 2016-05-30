function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



n = length(theta);

for i = 1:m;
  h = sigmoid(X(i,:)*theta);
  J = J + ((-y(i,:)*log(h)) - (1-y(i,:))*log(1-h)); % J(theta)
end

_theta_ = 0;
for j = 2:n;
  % not be regularizing the theta(1) parameters in the code
  _theta_ = _theta_ + theta(j)^2;
end

reg = lambda / (2 * m) * _theta_;
J=J/m + reg;

for j = 1:n;
  _J_ = 0;
  for i = 1:m;
    h = sigmoid(X(i,:)*theta);
    _J_ = _J_ + (h - y(i,:)) * X(i,j); % gradient compute
  end
  if j > 1; % not be regularizing the theta(1) parameters in the code
    grad(j) = ( _J_ / m ) + ( lambda * theta(j) / m);
  else
    grad(j) = _J_ / m  ;
  end

end


% =============================================================

end
