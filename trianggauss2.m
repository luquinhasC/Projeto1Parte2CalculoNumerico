function [Ts,Tb] = trianggauss2(A,B) ## Definimos uma função que triangulariza a matriz A e repete os calculos na B
   n = length(A); #Referencia ao tamanho da matriz quadrada A
   Ts = A; #Matriz a ser triangularizada
   Tb = B; #Matriz coluna que estaremos salvando os coeficientes
   for k = 1:n-1 # k-ésimo termo da diagonal (e a coluna também)
     for i = k+1: n # i-ésimo linha da matriz
       alpha = Ts(i,k)/Ts(k,k); #Coeficiente que estaremos multiplicando na k-esima coluna
       Ts(i,:) = Ts(i,:) - alpha.*Ts(k,:);
       Tb(i) = Tb(i) - alpha*Tb(k); #aplicando as operações na matriz b
     endfor
   endfor
endfunction
