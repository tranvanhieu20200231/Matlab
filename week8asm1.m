function [L , U ,p ]= lutx ( A )
[n , n ]= size ( A );   %n = size cua ma tran A
p =(1: n )';    %p la ma tran chuyen vi tu ma tran bat dau tu 1 den n
for k =1: n -1 
    [r , m ]= max ( abs ( A ( k :n , k ))); 
    % tim phan tu lon nhat tren cot k khong nam trong duong cheo
    m = m +k -1;
    % dung khi phat hien cac cot toan 0
    if( A (m , k )~=0)
        % doi cho dong xoay
        if( m ~= k )
            A ([ k m ] ,:)= A ([ m k ] ,:);
            p([ k m ])= p ([ m k ]);
        end
        % tinh cac nhan tu
        i = k +1: n ;
        A (i , k )= A (i , k )/ A (k , k );
        % tinh cac phan tu cua phan con lai
        j = k +1: n ;
        A (i , j )= A (i , j ) - A (i , k )* A (k , j );
    end
end
% tra lai ket qua
L = tril (A , -1)+ eye (n , n );
U = triu ( A );
end