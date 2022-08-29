function [c,e] = Rsqr (X) ##Função que computa os parametros c e o erro da função f(x) = a + bx + cx^2
  n = length(X);
  Y = ones(n,3);
  Y(:,2) = X(:,1);
  for i = 1:n #3º coluna entrando os valores de x^2
    Y(i,3) = X(i,1)^2;
  endfor
  A = Y'*Y;
  b = Y'*X(:,2);
  c = A\b; #Resultado do sistema, isto é os parametros a,b,c
  for i = 1:n
    R(i) = c(1) + c(2)*X(i,1) + c(3)*X(i,1)^2; #computando os valores na função
  endfor
  plot(X(:,1),X(:,2),'o',X(:,1),R) #plot da função
  #calculo do erro
  e = [];
  e2 = [];
  for i = 1:n
    e(i) = abs(X(i,2) - R(i));
    e2(i) = e(i)^2;
  endfor
  display(e)
  display(e2)






