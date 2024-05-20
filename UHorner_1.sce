function [w] = UHorner(B, X, s)
     n = length(B)
     pn = B(n)
     n=n-1
     for i=n:-1:1
         temp = pn*(s-X(i))+B(i)
         //disp(temp, i)//
         pn = temp
     end
     w = pn
     
endfunction
B=[4,3,(-5/2)]
X=[1,2]
w = UHorner(B, X, 4)
disp(w)
