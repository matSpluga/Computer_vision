function checkEpipolarConstraint(F, P1, P2)
    n = size(P1,2);
    thresh = 1e-2;
    for i = 1:n
        constr = P2(:,i)' * F * P1(:,i);
        if(constr < thresh)
            warning("FENOMENO");
        else
            warning("PORCODDIO");
        end
    end
end