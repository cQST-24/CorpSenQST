function dts=int2base(n,b,ndigits)
% convert the integer n into an array 

for j=1:ndigits
   dts(ndigits-j+1)=n-b*floor(n/b);
   n=floor(n/b);
end

end