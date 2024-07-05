function [X,v] = Solve_FP(n,~,m,~,Pauli,y,tau1,tau2)

% Solve the following optimization problem
% FP convex problem: no prior information is available
d = 2^n;

% Remove "quiet" to get solution details
% cvx_precision: default
cvx_begin sdp quiet

                % define the variable 
                variable X(d,d) hermitian;
                variable v(m)
               
                X == hermitian_semidefinite(d);

                % ||X||_tr=tr(sqrt(X^{\dagger}X))=tr(X)
                
                minimize(0.5*pow_pos(norm(y-Pauli*vec(X)-v),2) + tau1*trace(X) + tau2*norm(v,1));     
 
                subject to
                X  >= 0;             
cvx_end
end





