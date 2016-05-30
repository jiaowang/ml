function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

o = ones(size(z));

% if length(z) == 1;
%  fprintf('\nThe z is a number\n' );
%  g = 1/(1+exp(-z));
% else
%  fprintf('\nThe z is a matrix\n' );

g = o ./ (exp(-z) + 1);

% end

% =============================================================

end
