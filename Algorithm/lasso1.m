%% lasso algorithm version 1
function [X] =lasso1(D,Y,gamma,iter)

% D is dictionary; 
% W is Multidimensional Arrays; 
% Y is input signals;
% iter is number of iterations;

X = zeros(size(D,2),size(Y,2));
p = zeros(size(Y,2),size(D,2));
u = zeros(size(D,2),size(D,2),size(Y,2));
for iteration = 1:1:iter
    for i = 1:1:size(Y,2)
        u(:,:,i) = D'* D;
        for j = 1:1:size(D,2)
            p(i,j) = Y(:,i)' * D(:,j) - X(:,i)'* u(:,j,i) + X(j,i) * u(j,j,i);
            if p(i,j) > gamma
                X(j,i) = (p(i,j) - gamma)/u(j,j,i);
            elseif p(i,j) < -1 * gamma
                X(j,i) = (p(i,j) + gamma)/u(j,j,i);
            else
                X(j,i) = 0;
            end
        end
    end
end

return;
        