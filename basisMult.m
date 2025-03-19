function M = basisMult(a,b,A)

n = length(a);
M = zeros(1,n);

for i=1:n
    for j=1:n
        for k=1:n
            M(k) = M(k) + a(i)*b(j)*A(i,j,k);
        end
    end
end