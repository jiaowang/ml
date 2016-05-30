data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%  plotData(X, y);

% Put some labels
% hold on;
% Labels and Legend
% xlabel('Exam 1 score')
% ylabel('Exam 2 score')

% Specified in plot order
% legend('Admitted', 'Not admitted')
% hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

[m, n] = size(X);

X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);

m ,n ,initial_theta

[cost, grad] = costFunction(initial_theta, X, y)

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

p = predict(theta, X);

p == y
