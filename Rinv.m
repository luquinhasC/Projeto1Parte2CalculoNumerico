function [c,e] = Rinv (X)##Função que computa os parametros c e o erro da função f(x) = 1/ax + b
  n = length(X);
  Y = ones(n,2);
  Y(:,1) = X(:,1);
  A = Y'*Y;
  for i = 1:n # Neste caso só elevamos y a -1 que ja chegamos ao resultado
    B(i,1) = X(i,2)^(-1);
  endfor
  b = Y'*B;
  c = A\b; #Resolução do problema
  for i = 1:n #loop em cada ponto para calcular a função em cada ponto
    R(i) = 1/(c(1)*X(i,1)+c(2));
  endfor
  plot(X(:,1),X(:,2),'o',X(:,1),R) #plotagem da função
  #Calculo do erro:
  e = [];
  e2 = [];
  for i = 1:n
    e(i) = abs(X(i,2) - R(i));
    e2(i) = e(i)^2;
  endfor
  display(e)
  display(e2)

