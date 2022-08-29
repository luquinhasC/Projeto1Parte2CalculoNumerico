function [c,e] = Rexp (X) #Função que computa os parametros c e o erro da função f(x) = ax^b
  n = length(X);
  Y = ones(n,1);
  B = []; #Matriz contendo os y alterado dos pontos
  for i = 1:n
    Y(i,2) = log(X(i,1)); #Ln dos x nos pontos
    B(i,1) = log(X(i,2)); #Ln de y nos pontos
  endfor
  A = Y'*Y; # Matriz A analoga a Rl
  b = Y'*B; # Matriz b analoga a Rl
  c = A\b; #Resolução do sistema
  c(1) = e^(c(1)); #efetivamente o primeiro parametro
  for i = 1:n
    R(i) = c(1)*X(i,1)^c(2); # Calculo da nossa função aplicada em cada ponto
  endfor
  plot(X(:,1),X(:,2),'o',X(:,1),R) #plotagem da função
  e = []; #Calculo dos erros
  e2 = [];
  for i = 1:n
    e(i) = abs(X(i,2) - R(i));
    e2(i) = e(i)^2;
  endfor
  display(e)
  display(e2)
