function AllPauli = Allpaulis(n)
% Here we use the way of getting Pauli operator ... 
% from Steve Flammia, Sep 2011
%   References:
%   S. T. Flammia, D. Gross, Y.-K. Liu, and J. Eisert, Quantum tomography 
%   via compressed sensing: error bounds, sample complexity and
%   efficient estimators, New J. Phys. 14, 095022 (2012).
  
d = 2^n; d2 = d^2;

% X:1, Y:2, Z:3, I:4;

AllPauli = sparse([],[],[],d2,d2);

for i=1:d2
    list = int2base(i,4,n);
    % index 1-4
    list(find(list == 0)) = 4;

    E_i = PauliTensor( list ); 
    
% store every pauli operator 
    AllPauli(:,i) = E_i(:) ; 
end


AllPauli = AllPauli'; 
% attention: if use Pauli = Pauli.', then operator with \sigma_y will 
% casue error; 
end