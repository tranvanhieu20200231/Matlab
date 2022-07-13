function x = bslashtx(A,b)
[n , n] = size(A);
% Tim phan tich LU
[L, U, p] = lutx(A);
% Hoan vi va khu xuoi
y = zeros(n, 1);
    for 
        k = 1:n
        j = 1:k-1;
        y(k) = b(p(k)) - L(k, j) * y(j);
    end
% The nguoc
x = zeros(n, 1);
    for k = n:-1:1
        j = k+1:n;
        x(k) = (y(k) - U(k, j) * x(j)) / U(k, k);
    end
end