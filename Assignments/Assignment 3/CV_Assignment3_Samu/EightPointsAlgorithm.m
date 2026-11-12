function F = EightPointsAlgorithm(P1, P2)

n = size(P1, 2);
A = zeros(n, 9);

for j = 1:n
    x  = P1(1,j);
    y  = P1(2,j);
    xp = P2(1,j);
    yp = P2(2,j);

    A(j,:) = [xp*x, xp*y, xp, yp*x, yp*y, yp, x, y, 1];
end

[~, ~, V] = svd(A);

m = size(V,2);
F = V(:,m);

F1 = reshape(F,3,3)';

[U1, D1, V1] = svd(F1);

D1(3,3) = 0;

F = U1 * D1 * V1';

end
