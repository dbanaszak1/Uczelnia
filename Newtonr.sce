function [P]=Newton(X, Y)
    n0=length(X)
    n=n0+(n0-1)
    m=n0+1
    tab=zeros(n,m)
    for i=1:2:n
        j = (i+1)/2
        tab(i,1) = X(j)
        tab(i,2) = Y(j)
    end
    x=0
    for i=3:m
        for j=(2+x):2:(n-x)
            tab(j,i) = (tab(j+1, i-1)-tab(j-1,i-1))/(tab(j+1+x,1)-tab(j-1-x,1))
        end
        x=x+1 
    end
    B=[]
    for i=1:n0
        B(i) = tab(i,i+1)
    end
    x=poly(0,'x')
    Pi(1)=1
    for i=2:n0
        Pi(i)=Pi(i-1)*(x-X(i-1))
    end
    
    P=B(1)
    for i=2:n0
        P=P+B(i)*Pi(i)
    end

endfunction

X=[0,2,3,4,6]
Y=[1,3,2,5,7]
B = Newton(X, Y)

disp(B)
