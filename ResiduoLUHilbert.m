##Script Para calculo de sistema da matriz de hilbert e o residuo
H = Hilbert(5); #Computa a matriz de hilbert de tamanho 5
b = [1:5]'; #Computa a matriz b
X = DecLU(H,b); # Resolve os sistema HX =b pela decomposição LU
display(X);
e = norm(H*X - b); #Computa o resíduo
display(e)
