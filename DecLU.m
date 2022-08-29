function [X] = DecLU(A,B) #Resolução do sistema AX = B pela decomposição LU
 [L,U] = LU(A); #Calcula as matrizes L e U de A
  B_L = B; #matriz B tal que L(Y) = B_L, para um Y tal que U(X) = Y
  n = rows(A); #Tamanho da matriz quadrada A
  for i = 2:n # Loop nas linhas
    for j = 1:i-1 #Loop nas colunas, como a matriz é triangular inferior, só precisamos calcular para j<i
       B_L(i) = B_L(i) - (B_L(j))*(L(i,j)); #calculo analogo ao de EG
       L(i,j) = 0;
    endfor #fim do primeiro loop nas linhas
  endfor # fim dos primeiro loop nas colunas
    Y = B_L; # Assim descobrimos Y
   for i = 0:n-1 #novo loop nas linhas
    for j = 0:i #novo loop nas colunas
      if (j == i) #exatametne mesmo calculo que no EG, podia inclusive utilizar o script de EG para o calculo
        Y(n-i) = Y(n-i)./U(n-i,n-j);
        U(n-i,n-j) = 1;
      else
        Y(n-i) = Y(n-i) - (Y(n-j)).*(U(n-i,n-j));
        U(n-i,n-j) = 0;
      endif
    endfor #fim do novo loop das linhas
  endfor # fim do novo loop das colunas
   X = Y # resposta
endfunction
