function [Ts,Tb] = trianggauss(A,B) ## Definimos uma função que triangulariza a matriz A e repete os calculos na B
  if (any(det(A) ==0,not(issquare(A))))
    display("A matriz não é triangularizavel")
    Ts = "erro";
    Tb = "erro";
  elseif (prod(diag(A)) == 0)
    display("Há elementos nulos na diagonal")
    Ts = "erro";
    Tb = "erro";
  elseif (rows(B) != rows(A))
    display("A matriz B não é uma matriz coluna adequada") ##Novo condicional verificando se a matriz B é do tamanho esperado
    Ts = "erro";
    Tb = "erro";
  else
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
  endif
endfunction
