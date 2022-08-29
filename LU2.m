function [L,U] = LU2(A) ## Definimos uma função que triangulariza a matriz A
   n = length(A); #Referencia ao tamanho da matriz quadrada A
   U = A; #Matriz a ser triangularizada
   L = zeros(n,n); #Matriz triangular inferior
   for k = 1:n-1 # k-ésimo termo da diagonal
     L(k,k) = 1;
     for i = k+1: n # i-ésimo linha da matriz
       alpha = U(i,k)/U(k,k); #Coeficiente que estaremos multiplicando na k-esima coluna
       L(i,k) = alpha;
       U(i,:) = U(i,:) - alpha*U(k,:);
     endfor
   endfor
   L(n,n) = 1;
endfunction
