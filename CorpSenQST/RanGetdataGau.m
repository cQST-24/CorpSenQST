function [rhoT,noiseT,Pauli,y] = RanGetdataGau(d,n,r,m,s,N)
%%% n is the qubit numbers
%%% r is the rank of testing rho
%%% s is the sparse level of corrupted noise


% generate a d-by-d density matrix with rank r
% random state
rhoT = RandomDensityMatrix(d,0,r);    


% get all the pauli operators
AllPauli = Allpaulis(n);


% generate the sparse (corrupted) noise
noiseT = zeros(m,1);
v1 = randperm(m); % The position of noise element is given randomly  
sigma = 4;
noiseT(v1(1:s)) = sigma.*randn(s,1); % sparsely specified positions with Gaussian noise

% Pauli measurement
% select m Paulis operator at random
rp = randperm(d^2); 
Pauli = AllPauli(rp(1:m),:);
% vectorize rho
% get data from pauli measurement
data = real(Pauli * vec(rhoT));


% make noisy data by simulating measurements
p = (1+data)/2; 
s0 = rand(numel(data),N); 
P = repmat(p,1,N); 
st = P > s0; 
s1 = sum(st,2); 
s2 = s1/N; 
edata = 2*s2-1; 
% noisy data with corrupted noise
y = edata + noiseT ;
end






