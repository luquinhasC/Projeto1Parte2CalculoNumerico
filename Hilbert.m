function [H] = Hilbert(n) # chamei de Hilbert, pois a matriz resultante é denominada assim
  H = []; #Matriz Final
  for i = 1:n # Loop para linha, cada i representa a i-ésima linha da matriz
    for j = 1:n # loop para coluna, cada j representa a j-ésima coluna da matriz
      H(i,j) = (i+j-1)^-1; #Calculo do termo da i-ésima linha e j-ésima coluna
    endfor #fim do loop de j
  endfor # fim do loop de i
endfunction # fim da função

