function [Ts] = triang(A) ## Definimos uma função que triangulariza a matriz A
  if any(det(A) ==0,not(issquare(A)))
## Em partes
## 1 - o condicional acima verifica se podemos triangularizar a matriz A
## 2 - any() diz sobre qualquer uma das condições serem satisfeitas
## 3 - A primeira condição é a matriz ter determinante diferente de 0
# pois uma matriz triangular nunca tem determinante 0
## 4 - o segundo diz sobre a Matriz não ser quadrada, por isso o not(issquare)
## 5 - comprindo qualquer uma das duas condições, a matriz passa no condicional
# e não rodara o resto do código, retornando que a matriz não é diagonalizavel
    display("A matriz não é triangularizavel")
    Ts = "erro"; #Necessário para a futura verificação se o erro realmente ocorreu
  elseif (prod(diag(A)) == 0) #Não estarei trabalhando com esse caso
    display("Há elementos nulos na diagonal")
    Ts = "erro"; #Analogo
  else
   n = length(A); #Referencia ao tamanho da matriz quadrada A
   Ts = A; #Matriz a ser triangularizada
   for k = 1:n-1 # k-ésimo termo da diagonal
     for i = k+1: n # i-ésima linha da matriz
       alpha = Ts(i,k)/Ts(k,k); #Coeficiente que estaremos multiplicando na k-esima linha
       Ts(i,:) = Ts(i,:) - alpha*Ts(k,:); # Soma do coeficiente na k-ésima linha na linha i
       display(Ts)
     endfor
   endfor
  endif
endfunction
