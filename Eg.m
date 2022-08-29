function [X] = Eg(A,B) #Resolve o sistema AX= B
  [U,B_U] = trianggauss2(A,B);
  n = rows(B_U);
  #Vamos começar tornando a matriz U em uma matriz diagonal
  for i = 0:n-1
    for j = 0:i
      if (j == i)
        B_U(n-i) = (B_U(n-i))/(U(n-i,n-j));
        U(n-i,n-j) = 1;
      else
        B_U(n-i) = B_U(n-i) - (B_U(n-j))*(U(n-i,n-j));
        U(n-i,n-j) = 0;
      endif
    endfor
  endfor
  X = B_U;
endfunction
