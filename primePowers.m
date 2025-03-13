function p = primePowers(n)     %factors n into prime powers
                                %each row of p is [q a], where q^a divides n

pf = factor(n);     %find the prime factorization of n
p = [pf(1) 1];      %this will encode pf more usefully
j = 1;              %counter for the following loop

for i=2:length(pf)
    if pf(i)==pf(i-1)
        p(j,2) = p(j,2)+1;
    else
        p = [p; pf(i) 1];
        j = j+1;
    end
end
