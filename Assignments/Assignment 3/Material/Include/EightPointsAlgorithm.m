function [F] = EightPointsAlgorithm(P1, P2)
     
    N = size(P1, 2);
    
    %extracting coordinates:
    x1 = P1(1,:);    % vector containing all the x of P1
    y1 = P1(2,:);    % vector containing all the y of P1
    x2 = P2(1,:);    % vector containing all the x of P2
    y2 = P2(2,:);    % vector containing all the y of P2
    
    
    %initialization of matrix A:
    A = zeros(N, 9);

    %computation of matrix A
    for i = 1:N

        x  = x1(i);
        y  = y1(i);
        xp = x2(i);
        yp = y2(i);

        A(i,:) = [xp*x, xp*y, xp, yp*x, yp*y, yp, x, y, 1];
    end

    %Solving Af = 0 with SVD
    [~,~,V] = svd(A);
    f = V(:,end);           % Picked the last column of V as solution

    % Reconstructing F from f
    F = reshape(f, 3, 3)';  

    % Imposing the rank-2 constraint on F 
    [U,D,V2] = svd(F);
    D(3,3) = 0;
    F = U * D * V2';
end

