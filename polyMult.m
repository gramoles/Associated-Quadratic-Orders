function M = polyMult(a,b,p)    
    %multiplies a*b in Q[alpha], where alpha is a root of the polynomial p
    %a=a1+a2*alpha+...+an*alpha^(n-1)
    %b=b1+b2*alpha+...+bn*alpha^(n-1)
    %p(x)=p1+p2*x+...+pn*x^(n-1)+x^n
n = size(a);                    
n = n(2);   %n = the degree [Q[alpha]:Q], also the length of a,b,p
A = zeros(n,n,n);           
B = zeros(n,2*n-1);
p=-p;       %now, p encodes alpha^n=p1+p2*alpha+...+pn*alpha^(n-1)

B(1:n,1:n)=eye(n);
B(1:n,n+1)=p;       %the i^th column of B will encode alpha^i

for i=n+2:2*n-1
    q = [zeros(1,i-n-1),p(1:n-(i-n-1))];
    B(1:n,i)=q;
    for j=n+1:i-1       %fills in the columns of B
        B(1:n,i)=B(1:n,i)+B(1:n,j)*p(n-(i-j)+1);    
    end
end

for i=1:n
    for j=1:n
        for k=1:n
            A(i,j,k)=B(k,i+j-1);    %forms an n by n by n matrix, where A(i,j) encodes alpha^(i-1)*alpha^(j-1)
        end
    end
end

M=basisMult(a,b,A);     
    %carries out the multiplication a*b; M=a*b=M1+M2*alpha+...+Mn*alpha^(n-1)