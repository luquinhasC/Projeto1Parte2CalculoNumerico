function [L,U] = LU(A) ## Definimos uma função que triangulariza a matriz A
  if any(det(A) ==0,not(issquare(A))) #condifional de verificação da matriz
    display("A matriz não é triangularizavel")
    U = "erro";
  elseif (prod(diag(A)) == 0) #diagonal ser nula
    display("Há elementos nulos na diagonal")
    U = "erro";
  else #Roda o código caso passe nas verificações
   n = length(A); #Referencia ao tamanho da matriz quadrada A
   U = A; #Matriz a ser triangularizada
   L = zeros(n,n); #Matriz triangular inferior
   for k = 1:n-1 # k-ésimo termo da diagonal
     L(k,k) = 1; # Diagonal da matriz é definida como 1
     for i = k+1: n # i-ésimo linha da matriz
       alpha = U(i,k)/U(k,k); #Coeficiente que estaremos multiplicando na k-esima coluna
       L(i,k) = alpha; #alpha é o coeficiente utilizado para zerar o elemento (i,k)
       U(i,:) = U(i,:) - alpha*U(k,:);
     endfor #fim do loop de i
   endfor #fim do loop de k
   L(n,n) = 1; #Note que k é definido até n-1, pois no caso n,n não há mudança a se fazer. Então adicionamos esse caso separadamente
  endif # fim do condicional
endfunction #final da função

