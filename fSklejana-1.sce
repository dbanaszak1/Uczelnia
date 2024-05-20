function [P] = fSklejana(T, Y)
    n = length(T)-1
    P=0
    H=[]
    B=[]
    x=poly(0, 'x')
    for i=1:n
        H(i)=T(i+1)-T(i)
        B(i)=6*((Y(i+1)-Y(i))/H(i))
    end
    U(1)=2*(H(1)+H(2))
    V(1)=B(2)-B(1)
    
    for i=2:(n-1)
        U(i)=2*(H(i+1)+H(i))-(H(i)*H(i))/U(i-1)
        V(i)=(B(i+1)-B(i))-H(i)*V(i-1)/U(i-1)
    end
    Z(1) = 0
    Z(n+1)=0
    for i=n-1:-1:1
        Z(i+1)=(V(i)-H(i+1)*Z(i+2))/U(i)
    end
    Bi=[]
    for i=1:n
        Bi(i)=-((H(i)/6)*Z(i+1))-((H(i)/3)*Z(i))+((1/H(i))*(Y(i+1)-Y(i)))
        mprintf('B(%i)', i-1)
        disp(Bi(i))
    end
    S=[]
    for i=1:n
        S(i)=Y(i)+(x-T(i))*(Bi(i)+(x-T(i))*(Z(i)/2 + 1/(6*H(i))*(x-T(i))*(Z(i+1)-Z(i))))
    end
    P=S

endfunction
X=[0,1,2,3]
Y=[10,10,0,100]
P = fSklejana(X, Y)
disp(P)

