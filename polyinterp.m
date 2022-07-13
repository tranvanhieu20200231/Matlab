function v = polyinterp(x,y,u)
n = length(x);
v = zeros(size(u));
for k = 1:n
    w = ones(size(u));
    for j = [1 : k -1  k+1:n]
        w = (ux(j))./(x(k) - x(j)).*w;
    end
    v(k) = v(k) + w(k)*y(k);
end
