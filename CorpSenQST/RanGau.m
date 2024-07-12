clc;clear;
n = 5;
d = 2^n;
% rank of density matrix
r0 = 1;
% N0 = [100 1000 10000];
N0 = [100 150 200];

tic;
for nn = 1:length(N0)
    N = N0(nn);
r = r0;
% sampling way
m = [2*d d^2 2*d]; 
m_begin = m(1);
m_finish = m(2);
m_step = m(3);
m_iter = ceil(1+(m_finish-m_begin)/m_step);
fprintf('Running from m = %d to %d in increments of %d\n',...
        m_begin,m_finish,m_step);

% do experiments, then take average

% repeat experiment 
ave = 120;

% Create an array of structures and allocates memory
outRan.m = zeros(m_iter,1);
outRan.FdRho = zeros(m_iter,ave);
outRan.MseNoise = zeros(m_iter,ave);

outRan.MeanFdRho = zeros(m_iter,1);
outRan.MeanMseNoise = zeros(m_iter,1);

 for m = m_begin: m_step: m_finish
    % here we set sparsity rate less or equal 4%
    s = floor(m*0.04);
    
% estimator parameter
% There is a precision tradeoff between the state recovery and
% the noise recovery, one can try to reduce tau2 to improve 
% the accuracy of corrupted noise reconstruction
tau1 = 0.011*m;
tau2 = 0.16;

fprintf('Taking measurements...');
fprintf('%5.1f%%\n', m/m_finish*100 )

% remember to change save road if you run in different device
pname = 'D:\Project\Numerical Simulation\CSQST_matlab\';
parfor ii = 1:ave
   [rhoT,noiseT,Pauli,y] = RanGetdataGau(d,n,r,m,s,N);
   [rhoE,noiseE] = Solve_FP(n,r,m,s,Pauli,y,tau1,tau2);
  % renormalize 
   rhoE = full(rhoE);
   rhoE = rhoE/trace(rhoE);
   
   FdRho(ii) = fidelity(rhoE,rhoT);
   MseNoise(ii) = mse(noiseT,noiseE);
   fprintf('Running N=%d, r=%d, m=%d, s=%d, tau1=%d,tau2=%d, ave=%d for %d qubit\n',N,r,m,s,tau1,tau2,ii,n);
end
mval = ceil(1+(m-m_begin)/m_step);
outRan.m(mval,1) = m;

outRan.FdRho(mval,:) = FdRho;
outRan.MseNoise(mval,:) =  MseNoise;

end

if ave~=1 
outRan.MeanFdRho = (sum(outRan.FdRho.')/ave).';
outRan.MeanMseNoise = (sum(outRan.MseNoise.')/ave).';

else 
    outRan.MeanFdRho = outRan.FdRho;
    outRan.MeanMseNoise = outRan.MseNoise;
end

fname = strcat(int2str(N),'_',int2str(n),'q_',int2str(r),'r_',...
             'Fid_Mse','_',int2str(m_begin),'_',...
               int2str(m_finish),'_',int2str(ave),'.mat');

fname = strcat(pname,fname);               
save( fname , 'outRan');  
end
toc;
