% fidelity between A and B
function F = fidelity(A,B)
    x = sqrtm(A);
    F = x*B*x;
    F = trace(sqrtm(F));
    F = real(F)^2; 
end

