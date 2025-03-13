function [lao,ip] = quadLA(n,d,fu)      
    %determines whether the index n array in Q[sqrt(d)] is (locally) associated
    %fu is the fundamental unit
    %lao will indicate whether R is LA
    %ao will indicate whether R is associated
pf = primePowers(n);    %factors n into prime numbers
a = size(pf);
a = a(1);       %the number of distinct prime factors of n
ip = true;

%first, we will calculate the sizes of U(Rbar/I) and U(R/I)
num = 1;    %this will hold the size of U(Rbar/I)
for i=1:a
    if pf(i,1) == 2
        if mod(d,8) == 5        %if p is inert
            num = num*2^(2*(pf(i,2)-1))*3;
        else
            ip = false;
            if mod(d,8) == 1    %if p splits
                num = num*2^(2*(pf(i,2)-1));
            else                %if p ramifies
                num = num*2^(2*pf(i,2)-1);
            end
        end
    else
        if jacobiSymbol(d,pf(i,1))==-1      %if p is inert
            num = num*pf(i,1)^(2*(pf(i,2)-1))*(pf(i,1)^2-1);
        else
            ip = false;
            if jacobiSymbol(d,pf(i))==1     %if p is split
                num = num*(pf(i,1)^(pf(i,2)-1)*(pf(i,1)-1))^2;
            else                            %if p is ramified
                num = num*pf(i,1)^(2*pf(i,2)-1)*(pf(i,1)-1);
            end
        end
    end
end
%now, ip tells us if R is ideal-preserving

den = eulerPhi(n);  %this will always be the size of U(R/I)
goal = num/den;     %if this is the minimal power of fu that lands in R, R is locally associated

b = fu;      %this will hold powers of fu mod n to determine if they lie in R
for i=1:goal-1
    if b(2)==0
        lao = false;    %if too small a power of fu lies in R, not LA
        return;
    end
    if i==goal-1
        break;      %we don't need to calculate fu^goal
    end
    %now calculate next power of fu
    if mod(d,4)==1
        b = mod(polyMult(b,fu,[(1-d)/4,-1]),n);
    else
        b = mod(polyMult(b,fu,[-d,0]),n);
    end
end

lao = true; %if we make it this far, R is locally associated
%R is associated iff it is locally assocaited and ideal-preserving
%thus, we don't need to check anything more to determine associated