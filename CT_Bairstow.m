function [Root]=CT_Bairstow(Coeff,initialGuess,MaxApproxError) 
maxiternumber=200;
r=initialGuess;
s=initialGuess;
maxerr=MaxApproxError; % max error
flag =1; % Flag will be used for terminating process
Root_index =0;
fac=[1  0];
while(flag==1)
    [~,col] = size(Coeff);
    if (col==1)
        flag =0;
    elseif(col==2)
        flag=0;
        Root_index = Root_index + 1;
        Root(Root_index)= -Coeff(2)/Coeff(1);
    elseif(col >= 3)
        A=flip(Coeff);
        [~,n]=size(A);
        B=zeros(1,n);
        C=zeros(1,n);
        r=initialGuess;
        s=initialGuess;
        for i = 1:maxiternumber
            B(n)=A(n);
            B(n-1)=A(n-1)+(r*B(n));
            for j=n-2:-1:1
                B(j)=A(j)+(r*B(j+1))+(s*B(j+2));
            end
            C(4)=0;% a safety measure for quadratic equations
            C(n)=B(n);
            C(n-1)=B(n-1)+(r*C(n));
            for j=n-2:-1:1
                C(j)=B(j)+(r*C(j+1))+(s*C(j+2));
            end
            cofmat=[C(3) C(4);
                    C(2) C(3)];
            b=[-1*B(2);
               -1*B(1)];
            del = inv(cofmat)*b;
                
            if (abs(del(2)/s)<maxerr && abs(del(1)/r)<maxerr)
                
                r=r+del(1);
                s=s+del(2);
                x1=(r+sqrt((r^2)+(4*s)))/2;
                Root_index=Root_index+1;
                Root(Root_index)=x1;
                x2=(r-sqrt((r^2)+(4*s)))/2;
                Root_index=Root_index+1;
                Root(Root_index)=x2;
                break
            else
                r=r+del(1);
                s=s+del(2);
            end
            if(i==maxiternumber-1)
                disp('Method failed to find root');
            end
                       
        end
        
    end
    [Coeff,~] = deconv(Coeff,[1 -x1]);
    [Coeff,~] = deconv(Coeff,[1 -x2]);%reduces the order of function when 2 roots are found
end
end