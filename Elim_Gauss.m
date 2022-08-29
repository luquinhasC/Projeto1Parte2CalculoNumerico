function [X] = Elim_Gauss(A,B) #Resolve o sistema AX= B
  if (any(typeinfo(trianggauss(A,B)) == "string")) #Verifica se o outro script calculo corretamente as matrizes
    display("As Matrizes dadas não são resolviveis pela eliminação gaussiana")
  else
  [U,B_U] = trianggauss(A,B); #Matrizes triangularizadas, U é a matriz triangular superior e B_U é a matriz coluna B adaptada
  n = rows(B_U); # Tamanho da matriz quadrada U e da matriz coluna B_U
  #Vamos começar tornando a matriz U em uma matriz diagonal
  for i = 0:n-1 # Loop nas linhas
    for j = 0:i #Loop nas colunas
      if (j == i) #No caso i=j simplesmente dividimos uma linha pelo valor de a(i,i)
        B_U(n-i) = (B_U(n-i))/(U(n-i,n-j));
        U(n-i,n-j) = 1;
      else
        B_U(n-i) = B_U(n-i) - (B_U(n-j))*(U(n-i,n-j)); # diminuindo a linha n-j da linha n-i afim de zerar o elemento U(n-i,n-j)
        #Processo extremamente analogo ao de triangularização, porem realizando na ordem decrescente
        U(n-i,n-j) = 0;
      endif
    endfor
  endfor
   X = B_U; #Como U é a identidade temos U*X = B_U o que implica X = B_U
endif
endfunction
