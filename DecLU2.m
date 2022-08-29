function [X] = DecLU2(A,B) #Resolução do sistema AX = B pela decomposição LU
 [L,U] = LU2(A);
  B_L = B;
  n = rows(A);
  for i = 2:n
    for j = 1:i-1
       B_L(i) = B_L(i) - (B_L(j))*(L(i,j));
       L(i,j) = 0;
    endfor
  endfor
    Y = B_L;
   for i = 0:n-1
    for j = 0:i
      if (j == i)
        Y(n-i) = Y(n-i)./U(n-i,n-j);
        U(n-i,n-j) = 1;
      else
        Y(n-i) = Y(n-i) - (Y(n-j)).*(U(n-i,n-j));
        U(n-i,n-j) = 0;
      endif
    endfor
  endfor
  X = Y
endfunction
