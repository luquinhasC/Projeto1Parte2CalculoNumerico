function [c,e,e2] = Rl (X) #Função que computa os parametros c e o erro da função f(x) = ax + b
  #O input X é um vetor nx2 que é dois vetores colunas
  #Um do valor em x em cada ponto e o outro do valor de y desse ponto
  #A saida é uma dupla contendo duas matrizes
  #c é uma matriz com os coeficientes a,b da função (neste caso f(x) = ax + b)
  #e é uma matriz contendo o erro desta função em cada ponto
  n = length(X); #Quantidade de pontos que estamos imputando
  Y = ones(n,2); # Matriz de
  Y(:,1) = X(:,1); # A coluna 1 de Y defini como sendo a coluna 1 de X
  A = Y'*Y;
  b = Y'*X(:,2); #X(:,2) é o y de cada ponto em ordem
  c = A\b; #Resolução do sistema Ac = b
  plot(X(:,1),X(:,2),'o',X(:,1),c(1)*X(:,1) + c(2)) #Plotagem dos pontos tendo resolvido o sistema
  e = []; # Matriz do erro
  e2 = []; #Matriz do erro quadrado
  for i = 1:n #Variando em cada ponto de X
    e(i) = abs(X(i,2) - c(1)*X(i,1) + c(2)); #Calculo do erro no i-esimo ponto
    e2(i) = e(i)^2; #Erro quadrado nesse mesmo ponto
  endfor
  display(e)
  display(e2)






