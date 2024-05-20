clear
clc

function[P] = lagrange(X,Y) //X nodes,Y values;P is the numerical Lagrange
    n = length(X); // n is the number of nodes. (n-1) is the degree
    x = poly(0,"x");
    P = 0;
    for i = 1:n, L=1;
        for j = [1:i-1,i+1:n] 
            L = L*(x-X(j))/(X(i)-X(j));
        end
        P = P+L*Y(i);
    end
endfunction

clear X Y P;
X = [3; 5; 7]; // Węzły interpolacji
Y = [4; 6; -2]; // Wartości w węzłach
P = lagrange(X,Y); // Wielomian interpolacyjny
disp("Interpolacja Larangea");
disp(P);
disp(horner(P,[1.5])); // Oblicz wartość wielominu w punktach
