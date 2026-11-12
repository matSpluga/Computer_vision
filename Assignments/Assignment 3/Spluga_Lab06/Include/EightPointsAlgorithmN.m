function [F] = EightPointsAlgorithmN(P1, P2)

    % 1) Normalization
    [nP1, T1] = normalise2dpts(P1);
    [nP2, T2] = normalise2dpts(P2);

    % 2) Eight-point algorithm
    F_norm = EightPointsAlgorithm(nP1, nP2);

    % 3) De-normalization
    F = T2' * F_norm * T1;

    
end